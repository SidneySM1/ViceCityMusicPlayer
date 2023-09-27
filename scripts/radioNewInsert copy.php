<?php
// Conexão com o banco de dados MySQL (com base nas informações fornecidas)
require_once("../conn.php");



// Processar os dados do formulário
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST["nome"];
    $descricao = $_POST["descricao"];

    // Verificar se a rádio com o mesmo nome já existe no banco de dados
    $verifica_sql = "SELECT nome FROM radio WHERE nome = '$nome'";
    $verifica_result = $conn->query($verifica_sql);

    if ($verifica_result->num_rows > 0) {
        echo "Já existe uma rádio com o mesmo nome. Escolha um nome diferente.";
    } else {
        // Processar o upload da imagem
        $imagem_nome = $_FILES["imagem"]["name"];
        $imagem_temp = $_FILES["imagem"]["tmp_name"];
        $caminho_imagem = "../radios/" . $nome . "/" . $imagem_nome; // Caminho da imagem com base no nome da rádio
        $caminho_imagemSQL = "radios/" . $nome . "/" . $imagem_nome;

        // Crie a pasta da rádio se ela não existir
        if (!is_dir("../radios/" . $nome)) {
            mkdir("../radios/" . $nome, 0777, true);
        }

        // Move a imagem para a pasta da rádio com nome personalizado
        move_uploaded_file($imagem_temp, $caminho_imagem);

        // Diretório onde as músicas da rádio serão armazenadas
        $diretorio_musicas = "radios/" . $nome; // Caminho do diretório para músicas da rádio

        // Inserir os dados no banco de dados com nome da rádio e diretório
        $sql = "INSERT INTO radio (nome, descricao, imagem, diretorio) VALUES ('$nome', '$descricao', '$caminho_imagemSQL', '$diretorio_musicas')";

        if ($conn->query($sql) === TRUE) {
            echo "Rádio adicionada com sucesso!";
        } else {
            echo "Erro ao adicionar a rádio: " . $conn->error;
        }
    }
}

// Fechar a conexão com o banco de dados
$conn->close();
?>
