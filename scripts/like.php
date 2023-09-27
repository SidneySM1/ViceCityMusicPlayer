<?php

require_once("../conn.php");
// Obtém o endereço IP do usuário
$ip = $_SERVER['REMOTE_ADDR'];

// Verifica se o IP já existe na tabela de curtidas
$sql_check_ip = "SELECT COUNT(*) as count FROM likes WHERE user_ip = '$ip'";
$result_check_ip = $conn->query($sql_check_ip);

if ($result_check_ip && $result_check_ip->num_rows > 0) {
    $row = $result_check_ip->fetch_assoc();
    if ($row['count'] == 0) {
        // IP não encontrado na tabela, então insira um novo registro
        $sql_insert_like = "INSERT INTO likes (user_ip, liked_at) VALUES ('$ip', NOW())";
        if ($conn->query($sql_insert_like) === TRUE) {
            echo "Curtida registrada com sucesso!";
        } else {
            echo "Erro ao registrar a curtida: " . $conn->error;
        }
    } else {
        // IP encontrado na tabela, então remova o registro existente
        $sql_remove_like = "DELETE FROM likes WHERE user_ip = '$ip'";
        if ($conn->query($sql_remove_like) === TRUE) {
            echo "Você removeu a curtida!";
        } else {
            echo "Erro ao remover a curtida: " . $conn->error;
        }
    }
} else {
    echo "Erro ao verificar o IP: " . $conn->error;
}

?>