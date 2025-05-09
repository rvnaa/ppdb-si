<?php

session_start();
include("../../config/connection.php");
// Login Peserta
	if (isset($_POST['loginDataPeserta'])) {
		$nisn 			= mysqli_real_escape_string($conn, $_POST['nisn']); 
		$tanggal_lahir 	= mysqli_real_escape_string($conn, $_POST['tanggal_lahir']);

		$query = mysqli_query($conn, "SELECT * FROM identitas_siswa WHERE NISN = '$nisn' AND Tanggal_Lahir = '$tanggal_lahir'") or die(mysqli_error($conn));

		if(mysqli_num_rows($query) > 0) {
			foreach ($query as $row) {
				$_SESSION['nisnPeserta'] = $nisn; 
				$_SESSION['namaPeserta'] = $row['Nama_Peserta_Didik']; 
				$_SESSION['tlPeserta'] = $tanggal_lahir; 
				$_SESSION['status_ortu'] = $row['status_ortu']; 
				header('Location: ../../view/halaman/daftarSiswa.php');
			}
		} else {
			$_SESSION['alert'] = '<div class="alert alert-danger alert-has-icon" id="alert">
			                        <div class="alert-icon"><i class="far fa-lightbulb"></i></div>
			                        <div class="alert-body">
			                          <button class="close" data-dismiss="alert">
			                            <span>×</span>
			                          </button>
			                          <div class="alert-title">Login Gagal</div>
			                          NISN dan Tanggal Lahir anda tidak cocok.
			                        </div>
			                      </div>';
			header('Location: ../../view/halaman/login.php');
		}
	}

    ?>