<?php
session_start();

include "koneksiAkun.php";

$username = $_POST["username"];
$password = $_POST["password"];


$data = mysqli_query($konek, "SELECT * FROM user WHERE username='$username' AND password='$password'");

$cek = mysqli_num_rows($data);

if ($cek > 0) {
    $_SESSION['username'] = $username;
    $_SESSION['status'] = "login";
    header('location:daftar.php'); // Ganti dengan halaman tujuan setelah login berhasil
} else {
    header('location:login.php?pesan=gagal');
}

// Tutup koneksi
mysqli_close($konek);
?>
