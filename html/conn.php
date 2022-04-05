<?php

$connect = new mysqli("http://192.168.50.2/", "root", "", "api_margaasih");
if ($connect) {
    
}else{
    echo"Koneksi gagal";
    exit();
}

$nisn = $_POST['nisn'];
$password = $_POST['password'];

$query = $connect->query("SELECT * FROM siswa WHERE nisn = '$nisn' AND password = '$password'");
$result = array();
while ($row = $query->fetch_assoc()) {
    $result[] = $row;
}

echo json_encode($result);