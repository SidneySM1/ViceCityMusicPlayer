<?php
// Conexão com o banco de dados
require_once("../conn.php");

// Verifique se o ID da rádio foi recebido
if (isset($_GET['radio_id'])) {
    $radio_id = $_GET['radio_id'];

    // Consulta SQL para selecionar as músicas apenas da rádio especificada, em ordem aleatória,
    // garantindo que não haja duas músicas consecutivas do tipo "comentário"
    // Consulta SQL para selecionar todas as músicas da rádio especificada, incluindo comentários, em ordem aleatória
$sql = "SELECT *, radio.imagem
FROM musicas
INNER JOIN radio ON musicas.radio_id = radio.id
WHERE radio_id = $radio_id
ORDER BY RAND()";

$result = $conn->query($sql);

$track_list = array();
$musicas = array();
$comentarios = array();

if ($result->num_rows > 0) {
while ($row = $result->fetch_assoc()) {
$track = array(
    "name" => $row["name"],
    "artist" => $row["artist"],
    "image" => $row["directory"], // Usando a imagem da música
    "path" => $row["directory"],
    "type" => $row["type"]
);

if ($row["type"] == "comentario") {
    array_push($comentarios, $track);
} else {
    array_push($musicas, $track);
}
}
}

// Embaralhe as músicas e os comentários
shuffle($musicas);
shuffle($comentarios);

// Garanta que não haja dois comentários consecutivos, com no máximo 1 comentário a cada 3 músicas
$track_list = array();
$commentIndex = 0;
$musicIndex = 0;

while ($commentIndex < count($comentarios) && $musicIndex < count($musicas)) {
// Adicione uma música
array_push($track_list, $musicas[$musicIndex]);
$musicIndex++;

// Adicione um comentário, se houver, a cada 3 músicas ou mais
if ($commentIndex < count($comentarios) && $musicIndex % 3 == 0) {
array_push($track_list, $comentarios[$commentIndex]);
$commentIndex++;
}
}

// Adicione as músicas restantes, se houver
while ($musicIndex < count($musicas)) {
array_push($track_list, $musicas[$musicIndex]);
$musicIndex++;
}

// Adicione os comentários restantes, se houver
while ($commentIndex < count($comentarios)) {
array_push($track_list, $comentarios[$commentIndex]);
$commentIndex++;
}

// Converter a lista de faixas em formato JSON e retorná-la
echo json_encode($track_list);
} else {
    // ID da rádio não foi fornecido, retorne um erro ou uma resposta vazia
    echo json_encode(array("error" => "ID da rádio não fornecido"));
}
?>
