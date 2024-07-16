<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/PHPMailer/src/Exception.php';
require '../vendor/PHPMailer/src/PHPMailer.php';
require '../vendor/PHPMailer/src/SMTP.php';
require '../connection.php';


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];

    $stmt = $con->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $otp = rand(100000, 999999);
        $otp_expiration = date("Y-m-d H:i:s", strtotime('+1 hour'));

        $stmt->close();
        $stmt = $con->prepare("UPDATE users SET otp = ?, otp_expiration = ? WHERE email = ?");
        $stmt->bind_param("iss", $otp, $otp_expiration, $email);

        if ($stmt->execute()) {
            $mail = new PHPMailer;
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'kjansammad@gmail.com';
            $mail->Password = 'rmxc mtwc bsbu liyd';
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;

            $mail->setFrom('your-email@gmail.com', 'samamd');
            $mail->addAddress($email);

            $mail->isHTML(true);
            $mail->Subject = 'Password Reset OTP';
            $mail->Body    = "Your OTP for password reset is: $otp";

            if ($mail->send()) {
                echo json_encode(["status" => "success", "message" => "OTP sent to your email."]);
            } else {
                echo json_encode(["status" => "error", "message" => "Failed to send OTP."]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to generate OTP."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Email not found."]);
    }
    $stmt->close();
    $con->close();
}
?>
