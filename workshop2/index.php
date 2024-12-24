<?php
require("./conn.php");


?>


<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
</head>

<body>
     <div>
          <form action="./add.php" method="post">
               <label for="title">Titre:</label><br>
               <input type="text" id="title" name="title"><br><br>

               <label for="author">Auteur:</label><br>
               <input type="text" id="author" name="author"><br><br>

               <label for="category">Catégorie:</label><br>
               <input type="text" id="category" name="category"><br><br>

               <label for="date">Date d'ajout:</label><br>
               <input type="date" id="date" name="date"><br><br>

               <label for="availability">Disponibilité:</label><br>
               <select id="availability" name="availability">
                    <option value="available">Disponible</option>
                    <option value="not-available">Non disponible</option>
               </select><br><br>

               <button type="submit">Soumettre</button>
          </form>
     </div>

     <?php  
          include "./show.php";
     ?>
</body>

</html>