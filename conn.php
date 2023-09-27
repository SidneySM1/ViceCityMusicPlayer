<?php
$servername = "localhost";
$username = "root";
$password = "124679N@ruto";
$dbname = "vicecityradio";

// Criar uma conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar se houve algum erro na conexão
if ($conn->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conn->connect_error);
}

// Definir o conjunto de caracteres para UTF-8 (opcional, dependendo da configuração do seu banco de dados)
$conn->set_charset("utf8");
?>
