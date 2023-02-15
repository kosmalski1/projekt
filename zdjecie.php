<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $db = new mysqli('localhost', 'root', '', 'baza_moja'); 
        $sqlpyt = "select * FROM post ORDER BY id DESC";
         $result = mysqli_query($db , $sqlpyt);
         echo '<div style="display: flex; flex-direction: column;">';
         while($row = mysqli_fetch_assoc($result)){
            $img_sha256 = $row['filename'];
            $img_path = 'pub/sandbox/img/'. $img_sha256.'.webp';
            echo '<img src="'.$img_path.'">';
         }
         echo '</div>';
         $db->close();
        ?>
</body>
</html>