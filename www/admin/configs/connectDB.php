<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "start_app_dorm_management_db";
 

// Create connection
// $conn = mysqli_connect($servername, $username, $password, $database);

// DOCKER
$conn = mysqli_connect('db', 'root', '12345678', "start_app_dorm_management_db");


// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// echo "Connected successfully";

mysqli_set_charset($conn, "utf8");