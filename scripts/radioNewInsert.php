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
        // Processar o upload da imagem da rádio
        $imagem_nome = $_FILES["imagem"]["name"];
        $imagem_temp = $_FILES["imagem"]["tmp_name"];
        $caminho_imagem = "../radios/" . $nome . "/" . $imagem_nome;
        $caminho_imagemSQL = "radios/" . $nome . "/" . $imagem_nome;

        // Processar o upload da logo da rádio
        $logo_nome = $_FILES["logo"]["name"];
        $logo_temp = $_FILES["logo"]["tmp_name"];
        $caminho_logo = "../radios/" . $nome . "/" . $logo_nome;
        $caminho_logoSQL = "radios/" . $nome . "/" . $logo_nome;

        // Crie a pasta da rádio se ela não existir
        if (!is_dir("../radios/" . $nome)) {
            mkdir("../radios/" . $nome, 0777, true);
        }

        // Move a imagem da rádio para a pasta da rádio
        move_uploaded_file($imagem_temp, $caminho_imagem);

        // Move a logo da rádio para a pasta da rádio
        move_uploaded_file($logo_temp, $caminho_logo);

        // Diretório onde as músicas da rádio serão armazenadas
        $diretorio_musicas = "radios/" . $nome;

        // Inserir os dados no banco de dados com nome da rádio, diretório, imagem e logo
        $sql = "INSERT INTO radio (nome, descricao, imagem, logo, diretorio) 
                VALUES ('$nome', '$descricao', '$caminho_imagemSQL', '$caminho_logoSQL', '$diretorio_musicas')";

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
