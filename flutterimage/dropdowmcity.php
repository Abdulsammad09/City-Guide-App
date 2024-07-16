<?php

include('connection.php');

$sql = "SELECT * FROM table_country";
$result = $con->query($sql);

$countries = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $countries[] = $row;
    }
}

echo json_encode($countries);

$con->close();
?>
