<?php  

include "./conn.php";

$result = $conn->query("SELECT * FROM Livres");

while ($row = $result->fetch_assoc()) {
     $disponible = $row["disponible"] ? "Disponible" : "No";
     echo "ID: " . $row["id"] . " - Title: " . $row["titre"] . " - Categprie: " . $row["categorie"] . " - Disponible: " . $disponible . "<br>";
}


?>