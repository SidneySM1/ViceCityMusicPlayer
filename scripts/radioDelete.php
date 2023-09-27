<?php
// Inclua o arquivo de conexão com o banco de dados
include("../conn.php");

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    // Verifique se o parâmetro 'id' foi fornecido na URL
    if (isset($_GET["id"])) {
        $id = $_GET["id"];

        // Consulta para obter o diretório da rádio
        $sql = "SELECT diretorio FROM radio WHERE id = $id";
        $result = $conn->query($sql);

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            $diretorio = $row["diretorio"];

            // Exclua a rádio do banco de dados
            $sqlDelete = "DELETE FROM radio WHERE id = $id";
            if ($conn->query($sqlDelete) === TRUE) {
                // Exclua a pasta da rádio e seus arquivos
                $radioFolder = "../" . $diretorio;
                if (is_dir($radioFolder)) {
                    // Função para excluir a pasta recursivamente
                    function deleteDirectory($dir) {
                        if (!file_exists($dir)) return true;
                        if (!is_dir($dir)) return unlink($dir);
                        foreach (scandir($dir) as $item) {
                            if ($item == '.' || $item == '..') continue;
                            if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) return false;
                        }
                        return rmdir($dir);
                    }

                    // Chame a função para excluir a pasta
                    if (deleteDirectory($radioFolder)) {
                        echo "Rádio excluída com sucesso!";
                    } else {
                        echo "Erro ao excluir a pasta da rádio.";
                    }
                } else {
                    echo "Pasta da rádio não encontrada.";
                }
            } else {
                echo "Erro ao excluir a rádio do banco de dados: " . $conn->error;
            }
        } else {
            echo "Rádio não encontrada.";
        }
    } else {
        echo "Parâmetro 'id' não fornecido na URL.";
    }
} else {
    echo "Método de solicitação inválido.";
}

// Fechar a conexão com o banco de dados
$conn->close();
?>
