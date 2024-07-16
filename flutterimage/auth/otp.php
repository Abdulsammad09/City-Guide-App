<?php
require '../connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $otp = $_POST['otp'];

    if (empty($email) || empty($otp)) {
        echo json_encode(["status" => "error", "message" => "Email and OTP are required."]);
        exit();
    }

    $stmt = $con->prepare("SELECT otp, otp_expiration FROM users WHERE email = ?");
    if ($stmt === false) {
        echo json_encode(["status" => "error", "message" => "Error preparing statement: " . $con->error]);
        exit();
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->bind_result($stored_otp, $otp_expiration);
    $stmt->fetch();
    $stmt->close();

    if ($stored_otp === $otp && new DateTime() < new DateTime($otp_expiration)) {
        $stmt = $con->prepare("UPDATE users SET otp = NULL, otp_expiration = NULL , is_verified = 1 WHERE email = ?");
        if ($stmt === false) {
            echo json_encode(["status" => "error", "message" => "Error preparing statement: " . $con->error]);
            exit();
        }

        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->close();

        echo json_encode(["status" => "success", "message" => "OTP verified successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid OTP or OTP expired."]);
    }
}

$con->close();
?>
