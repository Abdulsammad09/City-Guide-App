<?php
include('connection.php');


if(isset($_POST["id"]))
{
  $id = $_POST["id"];
}
else  return;

$query = "DELETE FROM `table_hotal` WHERE id = '$id'";
$exe = mysqli_query($con,$query);

$arr = [];

if ($exe) {
  $arr["success"] = "true";
}
else{
  $arr["success"] = "false";

}

print(json_encode($arr));
?>
