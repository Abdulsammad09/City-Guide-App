<?php
include('../connection.php');
header('Content-Type: application/json');

$country_id = intval($_GET['country_id']); // Ensure country_id is an integer

$sql = "SELECT * FROM table_city WHERE country_id = $country_id";
$result = $con->query($sql);

$cities = [];
if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $row['id'] = (int) $row['id'];  // Explicitly cast id to integer
    $cities[] = $row;
  }
} else {
  echo json_encode([]);
}
$con->close();

echo json_encode($cities);
?>
