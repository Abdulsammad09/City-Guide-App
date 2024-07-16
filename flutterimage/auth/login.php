<?php

include('../connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Debug: print input data
    error_log("Received email: $email, password: $password");

    // Prepare the SELECT statement
    $stmt = $con->prepare("SELECT id, email, password, role, is_verified FROM users WHERE email = ?");
    if ($stmt === false) {
        echo json_encode(["status" => "Error", "message" => "Error preparing statement: " . $con->error]);
        exit();
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($db_id, $db_email, $db_password, $db_role, $db_is_verified);
    $stmt->fetch();

    // Debug: print fetched data
    error_log("Fetched user: ID=$db_id, email=$db_email, role=$db_role, is_verified=$db_is_verified");

    if ($stmt->num_rows > 0) {
        if ($db_is_verified == 1) {
            if (password_verify($password, $db_password)) {
                echo json_encode([
                    "status" => "Success", 
                    "role" => $db_role, 
                    "user_id" => $db_id
                ]);
            } else {
                echo json_encode(["status" => "Error", "message" => "Invalid password"]);
            }
        } else {
            echo json_encode(["status" => "Error", "message" => "Email not verified"]);
        }
    } else {
        echo json_encode(["status" => "Error", "message" => "User not found"]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "Error", "message" => "Invalid request method"]);
}

$con->close();
?>
