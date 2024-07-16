<?php

include('connection.php');

$sql = "SELECT * FROM table_city";
$result = $con->query($sql);

$city = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $city[] = $row;
    }
}

echo json_encode($city);

$con->close();
?>
