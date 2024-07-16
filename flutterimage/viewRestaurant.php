<?php

include('connection.php');


$query = "SELECT * FROM table_restaurant";

$exe = mysqli_query($con,$query);

$arr=[];
while($row = mysqli_fetch_assoc($exe)){

    $arr[] = $row;
}

print(json_encode($arr));


?>