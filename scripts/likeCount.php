<?php
require_once("../conn.php");

// IP do usuário
$user_ip = $_SERVER['REMOTE_ADDR'];

// Consulta para contar as curtidas do usuário
$sql = "SELECT COUNT(*) AS like_count FROM likes";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $like_count = $row['like_count'];
    echo $like_count;
} else {
    echo "0"; // Se o usuário não tem curtidas, retorna 0
}

$conn->close();
?>
