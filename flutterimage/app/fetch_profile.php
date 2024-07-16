<?php
include('../connection.php');

if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    // Prepare the SELECT statement
    $stmt = $con->prepare("SELECT username, email FROM users WHERE id = ?");
    if ($stmt === false) {
        echo json_encode(["status" => "Error", "message" => "Error preparing statement: " . $con->error]);
        exit();
    }

    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($name, $email); // Binding specific columns

    if ($stmt->num_rows > 0) {
        $stmt->fetch(); // Fetching the result into bound variables
        echo json_encode([
            "status" => "Success",
            "name" => $name,
            "email" => $email,
            
        ]);
    } else {
        echo json_encode(["status" => "Error", "message" => "User not found"]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "Error", "message" => "User ID not provided"]);
}

$con->close();
?>
