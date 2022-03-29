<?php

//Define your host here.
$HostName = "localhost";
//Define your database username here.
$HostUser = "root";
//Define your database password here.
$HostPass = "";
//Define your database name here.
$DatabaseName = "start_app_dorm_management_db";

// $con = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);

// $conn = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);


// DOCKER
$con = mysqli_connect('db', 'root', '12345678', "start_app_dorm_management_db");
$conn = mysqli_connect('db', 'root', '12345678', "start_app_dorm_management_db");