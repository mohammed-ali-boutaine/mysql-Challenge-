
<?php

include_once "./conn.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
print_r($_POST);
     $stmt = $conn->prepare("INSERT INTO Livres (titre,auteur,categorie,date_ajout,disponible) VALUES (?,?,?,?,?)");

     $title = $_POST["title"];
     $author = $_POST["author"];
     $category = $_POST["category"];
     $date = $_POST["date"];
     $availability = $_POST["availability"];

     $availability = $availability == "available" ? 1 : 0;

     $stmt->bind_param("ssssi", $title, $author, $category, $date, $availability);

     $stmt->execute();

     // Check if the insertion was successful
     if ($stmt->affected_rows > 0) {
          echo "New book added successfully.";
     } else {
          echo "Error: " . $stmt->error;
     }
     // Close the statement and connection
     $stmt->close();
     $conn->close();
}
