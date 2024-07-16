<?php
require '../connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $otp = $_POST['otp'];
    $new_password = password_hash($_POST['new_password'], PASSWORD_BCRYPT);

    $stmt = $con->prepare("SELECT otp, otp_expiration FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->bind_result($stored_otp, $otp_expiration);
    $stmt->fetch();
    $stmt->close();

    if ($stored_otp == $otp && new DateTime() < new DateTime($otp_expiration)) {
        $stmt = $con->prepare("UPDATE users SET password = ?, otp = NULL, otp_expiration = NULL WHERE email = ?");
        $stmt->bind_param("ss", $new_password, $email);
        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Password updated successfully."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to update password."]);
        }
        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid OTP or OTP expired."]);
    }
}

$con->close();
?>
