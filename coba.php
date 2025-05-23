<?php
// Proses upload saat form disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["gambar"])) {
    $targetDir = "uploads/";
    $fileName = basename($_FILES["gambar"]["name"]);
    $targetFile = $targetDir . $fileName;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    $uploadOk = 1;
    $message = "";

    // Cek apakah file benar-benar gambar
    $check = getimagesize($_FILES["gambar"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        $message .= "File bukan gambar.<br>";
        $uploadOk = 0;
    }

    // Cek apakah file sudah ada
    if (file_exists($targetFile)) {
        $message .= "Maaf, file sudah ada.<br>";
        $uploadOk = 0;
    }

    // Bolehkan hanya format tertentu
    $allowedTypes = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($imageFileType, $allowedTypes)) {
        $message .= "Hanya file JPG, JPEG, PNG, & GIF yang diperbolehkan.<br>";
        $uploadOk = 0;
    }

    // Upload file jika aman
    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["gambar"]["tmp_name"], $targetFile)) {
            $message .= "File " . htmlspecialchars($fileName) . " berhasil diunggah.<br>";
            $uploadedImage = $targetFile;
        } else {
            $message .= "Maaf, terjadi kesalahan saat mengunggah file.<br>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Upload Gambar PHP</title>
</head>

<body>
    <h2>Form Upload Gambar</h2>

    <?php if (!empty($message)) echo "<p>$message</p>"; ?>

    <?php if (!empty($uploadedImage)) echo "<img src='$uploadedImage' style='max-width:500px;'><br><br>"; ?>

    <form action="" method="post" enctype="multipart/form-data">
        <label for="gambar">Pilih gambar:</label><br><br>
        <input type="file" name="gambar" id="gambar" required>
        <br><br>
        <input type="submit" value="Upload Gambar">
    </form>
</body>

</html>