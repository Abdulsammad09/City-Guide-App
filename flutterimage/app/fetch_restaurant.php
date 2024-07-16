<?php

include('../connection.php');

// Fetch hotels based on city_id
if (isset($_GET['city_id'])) {
    $city_id = $_GET['city_id'];

    $sql = "SELECT * FROM table_restaurant WHERE city_id = $city_id";
    $result = $con->query($sql);

    if ($result->num_rows > 0) {
        $hotels = array();
        while ($row = $result->fetch_assoc()) {
            $hotels[] = $row;
        }
        echo json_encode($hotels); // Return JSON response
    } else {
        echo "No hotels found for this city.";
    }
} else {
    echo "City ID parameter is missing.";
}

$con->close();


?>