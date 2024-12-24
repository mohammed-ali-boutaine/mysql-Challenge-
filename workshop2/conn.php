<?php 
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "bibliotheque";

// Mode orienté objet :

$conn = new mysqli($servername, $username, $password, $dbname);

if($conn->connect_error){
     die("Échec de la connexion : " . $conn->connect_error);
}

// procedurale:
$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
     die("Échec de la connexion : " . mysqli_connect_error());
}
