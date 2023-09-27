<?php
// Inclua o arquivo de conexão com o banco de dados
include("../conn.php");

// Consulta para obter todas as rádios adicionadas
$sql = "SELECT * FROM radio";
$result = $conn->query($sql);

$radios = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $radios[] = $row;
    }
}

// Fechar a conexão com o banco de dados (se necessário)
$conn->close();

// Retornar os dados das rádios como JSON
header("Content-type: application/json");
echo json_encode($radios);

// Encerre a execução do script PHP imediatamente
exit;
?>
