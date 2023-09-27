<?php
require_once("../conn.php");

// IP do usuário (você precisa obtê-lo de alguma forma, por exemplo, $_SERVER['REMOTE_ADDR'])
$user_ip = $_SERVER['REMOTE_ADDR'];

// Consulta SQL para verificar se o user_ip existe na tabela likes
$sql = "SELECT COUNT(*) as count FROM likes WHERE user_ip = '$user_ip'";
$result = $conn->query($sql);

if ($result === false) {
    die("Erro na consulta SQL: " . $conn->error);
}

// Analise o resultado da consulta
$row = $result->fetch_assoc();
$curtiu = ($row['count'] > 0); // true se existir, false se não existir

// Feche a conexão com o banco de dados
$conn->close();

// Retorne o resultado como JSON
$response = [
    'curtiu' => $curtiu
];

header('Content-Type: application/json');
echo json_encode($response);
?>
