<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/PHPMailer/src/Exception.php';
require '../vendor/PHPMailer/src/PHPMailer.php';
require '../vendor/PHPMailer/src/SMTP.php';
require '../connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $email = $_POST['email'];
    $role = 'user';
    $otp = rand(100000, 999999);
    $otp_expiration = date('Y-m-d H:i:s', strtotime('+10 minutes'));

    $stmt = $con->prepare("INSERT INTO users (username, password, email, role, otp, otp_expiration) VALUES (?, ?, ?, ?, ?, ?)");
    if ($stmt === false) {
        echo json_encode("Error preparing statement: " . $con->error);
        exit();
    }

    $stmt->bind_param("ssssss", $username, $password, $email, $role, $otp, $otp_expiration);

    if ($stmt->execute()) {
        $subject = "Your OTP Code";
        $message = "Your OTP code is $otp";

        $mail = new PHPMailer(true);
        try {
            // Server settings
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
            $mail->SMTPAuth = true;
            $mail->Username = 'kjansammad@gmail.com'; // SMTP username
            $mail->Password = 'rmxc mtwc bsbu liyd'; // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587; // TCP port to connect to

            // Recipients
            $mail->setFrom('kjansamamd@gmail.com', 'sammad');
            $mail->addAddress($email); // Add a recipient

            // Content
            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body = $message;

            $mail->send();
            echo json_encode("User registered successfully. Please check your email for the OTP.");
        } catch (Exception $e) {
            echo json_encode("Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
        }
    } else {
        echo json_encode("Error executing statement: " . $stmt->error);
    }

    $stmt->close();
}

$con->close();
?>
