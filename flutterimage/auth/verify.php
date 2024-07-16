<?php
include('../connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $token = $_POST['token'];

    // Retrieve the token from the database
    $stmt = $con->prepare("SELECT token FROM users WHERE email = ?");
    if ($stmt === false) {
        echo json_encode(["status" => "Error", "message" => "Error preparing statement: " . $con->error]);
        exit();
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($db_token);
    $stmt->fetch();

    if ($stmt->num_rows > 0) {
        if ($db_token === $token) {
            // Token is valid, mark email as verified
            $stmt->close();

            $stmt = $con->prepare("UPDATE users SET is_verified = 1, token = NULL WHERE email = ?");
            if ($stmt === false) {
                echo json_encode(["status" => "Error", "message" => "Error preparing statement: " . $con->error]);
                exit();
            }

            $stmt->bind_param("s", $email);
            $stmt->execute();
            echo json_encode(["status" => "Success", "message" => "Email verified successfully"]);
        } else {
            echo json_encode(["status" => "Error", "message" => "Invalid token"]);
        }
    } else {
        echo json_encode(["status" => "Error", "message" => "User not found"]);
    }

    $stmt->close();
}

$con->close();
?>
