<?php
include('connection.php');
$uploadDir = 'upload/'; // Directory where images will be stored
$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['image'])) {
    $name = $_POST['name'];
    $countryId = $_POST['country_id'];
    $description = $_POST['description'];

    $fileTmpPath = $_FILES['image']['tmp_name'];
    $fileName = $_FILES['image']['name'];
    $fileNameCmps = explode(".", $fileName);
    $fileExtension = strtolower(end($fileNameCmps));

    $newFileName = md5(time() . $fileName) . '.' . $fileExtension;
    $uploadFileDir = $uploadDir . $newFileName;
    $uploadPath = dirname(__FILE__) . '/' . $uploadFileDir;

    if (move_uploaded_file($fileTmpPath, $uploadPath)) {
        // File uploaded successfully, now insert data into database using mysqli
      
        // Prepare data for insertion
        $name = $con->real_escape_string($name);
        $countryId = $con->real_escape_string($countryId);
        $description = $con->real_escape_string($description);
        $imagePath = $con->real_escape_string($uploadFileDir);

        // Insert data into database
        $sql = "INSERT INTO table_city (name, country_id, description, image_path) VALUES ('$name', '$countryId', '$description', '$imagePath')";

        if ($con->query($sql) === TRUE) {
            $response['message'] = 'Data inserted successfully';
            echo json_encode($response);
        } else {
            $response['error'] = true;
            $response['message'] = 'Error: ' . $sql . '<br>' . $con->error;
            echo json_encode($response);
        }

        $con->close();
    } else {
        $response['error'] = true;
        $response['message'] = 'File upload failed';
        echo json_encode($response);
    }
} else {
    $response['error'] = true;
    $response['message'] = 'Invalid request';
    echo json_encode($response);
}
?>
