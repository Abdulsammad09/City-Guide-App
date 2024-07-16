<?php
include('../connection.php');
header('Content-Type: application/json');

$sql = "SELECT id, name, image_path FROM table_country";
$result = $con->query($sql);

$countries = [];
if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $countries[] = $row;
  }
}

$con->close();
echo json_encode($countries);
?>
