<?php
include('../connection.php');



$search = $_GET['search'] ?? '';

$sql_countries = "SELECT * FROM table_country WHERE name LIKE '%$search%'";
$sql_cities = "SELECT * FROM  table_city WHERE name LIKE '%$search%'";

$result_countries = $con->query($sql_countries);
$result_cities = $con->query($sql_cities);

$countries = [];
$cities = [];

if ($result_countries->num_rows > 0) {
    while($row = $result_countries->fetch_assoc()) {
        $countries[] = $row;
    }
}

if ($result_cities->num_rows > 0) {
    while($row = $result_cities->fetch_assoc()) {
        $cities[] = $row;
    }
}

$con->close();

$response = [
    'countries' => $countries,
    'cities' => $cities
];

header('Content-Type: application/json');
echo json_encode($response);

?>