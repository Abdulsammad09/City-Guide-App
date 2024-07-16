<?php

include('connection.php');

$image = $_FILES['image']['name'];
$name = $_POST['name'];

$imagePath = 'upload/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagePath);


$con->query("INSERT INTO `table_country`( `name`, `image_path`) VALUES ('".$name."','".$image."')");


?>