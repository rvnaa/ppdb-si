-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2025 at 01:24 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrasi`
--

CREATE TABLE `administrasi` (
  `id_administrasi` int NOT NULL,
  `id_identitas_siswa` int NOT NULL,
  `harga` int NOT NULL,
  `status` enum('Lunas','Belum Lunas') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrasi`
--

INSERT INTO `administrasi` (`id_administrasi`, `id_identitas_siswa`, `harga`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(5, 1, 1250000, 'Lunas', '2020-09-17 09:48:12', '2020-09-17 08:22:50');

--
-- Triggers `administrasi`
--
DELIMITER $$
CREATE TRIGGER `HapusAdministrasi` AFTER DELETE ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 0 
  WHERE Id_Identitas_Siswa = OLD.id_identitas_siswa; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahAdministrasi` AFTER INSERT ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 1 
  WHERE Id_Identitas_Siswa = NEW.id_identitas_siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `identitas_siswa`
--

CREATE TABLE `identitas_siswa` (
  `Id_Identitas_Siswa` int NOT NULL,
  `NISN` varchar(15) NOT NULL,
  `No_KK` varchar(20) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Nama_Panggilan` text NOT NULL,
  `Nama_Peserta_Didik` text NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `Agama` varchar(9) NOT NULL,
  `Gol_Darah` varchar(5) NOT NULL,
  `Tinggi_Badan` varchar(4) NOT NULL,
  `Berat_Badan` varchar(3) NOT NULL,
  `Suku` varchar(10) NOT NULL,
  `Bahasa` varchar(12) NOT NULL,
  `Kewarganegaraan` varchar(10) NOT NULL,
  `Status_Anak` varchar(12) NOT NULL,
  `Anak_Ke` int NOT NULL,
  `Jml_Saudara` int NOT NULL,
  `Jenis_Tinggal` varchar(17) NOT NULL,
  `Alamat_Tinggal` text NOT NULL,
  `Provinsi_Tinggal` varchar(30) NOT NULL,
  `Kab_Kota_Tinggal` varchar(30) NOT NULL,
  `Kec_Tinggal` varchar(30) NOT NULL,
  `Kelurahan_Tinggal` varchar(30) NOT NULL,
  `Kode_POS` varchar(6) NOT NULL,
  `Jarak_Ke_Sekolah` varchar(5) NOT NULL,
  `Riwayat_Penyakit` text NOT NULL,
  `status_ortu` tinyint(1) NOT NULL,
  `status_administrasi` tinyint(1) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identitas_siswa`
--

INSERT INTO `identitas_siswa` (`Id_Identitas_Siswa`, `NISN`, `No_KK`, `NIK`, `Nama_Panggilan`, `Nama_Peserta_Didik`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Agama`, `Gol_Darah`, `Tinggi_Badan`, `Berat_Badan`, `Suku`, `Bahasa`, `Kewarganegaraan`, `Status_Anak`, `Anak_Ke`, `Jml_Saudara`, `Jenis_Tinggal`, `Alamat_Tinggal`, `Provinsi_Tinggal`, `Kab_Kota_Tinggal`, `Kec_Tinggal`, `Kelurahan_Tinggal`, `Kode_POS`, `Jarak_Ke_Sekolah`, `Riwayat_Penyakit`, `status_ortu`, `status_administrasi`, `tgl_buat`, `tgl_ubah`) VALUES
(1, '0001999901', '0001999999999994', '0001999999999944', 'Jaya', 'Jaya Wijayanti', 'Kuningan', '2012-06-19', 'Perempuan', 'Islam', 'A', '108', '28', 'Jawa', 'Indonesia', 'Indonesia', 'Jawa', 1, 3, 'Kontrak', 'Jl. kuningan', 'Jawa Barat', 'Kuningan', 'kuningan', 'kuningan', '11111', '1', 'Tidak Ada', 1, 1, '2025-04-27 14:59:15', '2025-04-27 14:59:15'),
(5, '1346547516', '6564562356456356', '6726437864263647', 'rere', 'rerer', 'tasik', '2025-04-23', 'Perempuan', 'islam', '0', '1532', '52', 'sunda', 'jhfjsdhf', 'kjhdjsfh', 'sunda', 3, 5, 'hjsfv', 'Barangbang', 'kjhdfkh', 'kjhfk', 'kjfhk', 'kjhfk', '27673', '235', 'vdghvfhdgf', 1, 1, '2025-04-29 05:15:25', '2025-04-29 05:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `orang_tua_wali`
--

CREATE TABLE `orang_tua_wali` (
  `Id_Orang_Tua_Wali` int NOT NULL,
  `Id_Identitas_Siswa` int NOT NULL,
  `Nama_Ayah` varchar(30) NOT NULL,
  `Status_Ayah` varchar(10) NOT NULL,
  `Tgl_Lahir_Ayah` date NOT NULL,
  `Telepon_Ayah` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ayah` varchar(20) NOT NULL,
  `Pekerjaan_Ayah` varchar(30) NOT NULL,
  `Penghasilan_Ayah` varchar(10) NOT NULL,
  `Alamat_Ayah` varchar(165) NOT NULL,
  `Nama_Ibu` varchar(30) NOT NULL,
  `Status_Ibu` varchar(10) NOT NULL,
  `Tgl_Lahir_Ibu` date NOT NULL,
  `Telepon_Ibu` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ibu` varchar(20) NOT NULL,
  `Pekerjaan_Ibu` varchar(30) NOT NULL,
  `Penghasilan_Ibu` varchar(10) NOT NULL,
  `Alamat_Ibu` varchar(165) NOT NULL,
  `Nama_Wali` varchar(30) NOT NULL,
  `Status_Wali` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Tgl_Lahir_Wali` date NOT NULL,
  `Telepon_Wali` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Wali` varchar(20) NOT NULL,
  `Pekerjaan_Wali` varchar(30) NOT NULL,
  `Penghasilan_Wali` varchar(10) NOT NULL,
  `Alamat_Wali` varchar(165) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orang_tua_wali`
--

INSERT INTO `orang_tua_wali` (`Id_Orang_Tua_Wali`, `Id_Identitas_Siswa`, `Nama_Ayah`, `Status_Ayah`, `Tgl_Lahir_Ayah`, `Telepon_Ayah`, `Pendidikan_Terakhir_Ayah`, `Pekerjaan_Ayah`, `Penghasilan_Ayah`, `Alamat_Ayah`, `Nama_Ibu`, `Status_Ibu`, `Tgl_Lahir_Ibu`, `Telepon_Ibu`, `Pendidikan_Terakhir_Ibu`, `Pekerjaan_Ibu`, `Penghasilan_Ibu`, `Alamat_Ibu`, `Nama_Wali`, `Status_Wali`, `Tgl_Lahir_Wali`, `Telepon_Wali`, `Pendidikan_Terakhir_Wali`, `Pekerjaan_Wali`, `Penghasilan_Wali`, `Alamat_Wali`, `tgl_buat`, `tgl_ubah`) VALUES
(1, 1, 'Dedi', 'Kandung', '1988-08-30', '089623492347', 'SMA', 'Teknisi', '1991-05-05', 'JL. Kuningan', 'Mami', 'Kandung', '1991-10-13', '082323231231', 'SMA', 'Ibu Rumah Tangga', '1992-12-06', 'Jl. Kuningan', 'Dedi', 'Ayah Kandung', '1989-03-20', '089623492347', 'SMA', 'Teknisi', '10000000', 'Jl. kuningan', '2025-04-29 04:20:45', '2025-04-29 04:20:45'),
(4, 5, 'dd', 'kandung', '2025-04-16', '1656526361', 'sd', 'sd', '1000000', 'ajjhjxbhabsx', 'ii', 'kandung', '2025-04-26', '767635423', 'sd', 'irt', '0', 'namsncjas', '-', '-', '2025-04-23', '7638716278', 'sd', 'qjhksj', '0', 'jbxnabj', '2025-04-29 05:16:45', '2025-04-29 05:16:45');

--
-- Triggers `orang_tua_wali`
--
DELIMITER $$
CREATE TRIGGER `HapusOrangTuaWali` AFTER DELETE ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 0 
  WHERE Id_Identitas_Siswa = OLD.Id_Identitas_Siswa;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahOrangTuaWali` AFTER INSERT ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 1 
  WHERE Id_Identitas_Siswa = NEW.Id_Identitas_Siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nama` char(45) NOT NULL,
  `username` char(65) NOT NULL,
  `password` char(125) NOT NULL,
  `hak` enum('admin','pegawai') NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `hak`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(7, 'Revina Aulia', 'revinaau', 'revinaau', 'admin', 'aktif', '2025-04-27 14:47:41', '2025-04-27 14:47:41'),
(8, 'Gita Syafira Azzahra', 'gitazahra', 'gitazahra', 'pegawai', 'aktif', '2025-04-27 14:48:18', '2025-04-27 14:48:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`id_administrasi`),
  ADD KEY `id_identitas_siswa` (`id_identitas_siswa`);

--
-- Indexes for table `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  ADD PRIMARY KEY (`Id_Identitas_Siswa`),
  ADD UNIQUE KEY `NISN` (`NISN`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indexes for table `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD PRIMARY KEY (`Id_Orang_Tua_Wali`),
  ADD KEY `Id_Identitas_Siswa` (`Id_Identitas_Siswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `id_administrasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  MODIFY `Id_Identitas_Siswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  MODIFY `Id_Orang_Tua_Wali` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`id_identitas_siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);

--
-- Constraints for table `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD CONSTRAINT `orang_tua_wali_ibfk_1` FOREIGN KEY (`Id_Identitas_Siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
