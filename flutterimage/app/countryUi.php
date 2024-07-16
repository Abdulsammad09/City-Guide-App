<?php

include('../connection.php');

$query = "SELECT* From table_country";
$exe = mysqli_query($con,$query);
$arr = [];
while($row= mysqli_fetch_array($exe)){
$arr[] =$row; 
}

print(json_encode($arr));


?>