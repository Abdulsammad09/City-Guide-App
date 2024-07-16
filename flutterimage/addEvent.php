<?php
include('connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $city_id = $_POST['city_id'];
    $description = $_POST['description'];
    $date = $_POST['date'];
    $address = $_POST['address'];

    // Check if image file is a actual image or fake image
    if(isset($_FILES['image'])) {
        $image = $_FILES['image']['name'];
        $target_dir = "upload/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);

        // Select file type
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Valid file extensions
        $extensions_arr = array("jpg","jpeg","png","gif");

        // Check extension
        if(in_array($imageFileType,$extensions_arr)) {
            // Upload file
            if(move_uploaded_file($_FILES['image']['tmp_name'],$target_file)) {
                // Insert record
                $query = "INSERT INTO table_event(`city_id`, `name`, `description`,  `image_path`,`date`, `address`) VALUES('$city_id','$name',  '$description',  '$image','$date','$address')";
                mysqli_query($con,$query);
                echo json_encode(['status' => 'success', 'message' => 'Event added successfully']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to upload image']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid file extension']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No image file uploaded']);
    }
}
?>
