-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2022 at 10:59 AM
-- Server version: 8.0.25
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_ekspedisi`
--

-- --------------------------------------------------------

--
-- Table structure for table `rec_exp`
--

CREATE TABLE `rec_exp` (
  `id_rec_exp` int NOT NULL,
  `id_barang` int NOT NULL,
  `nama_cabang_sebelum` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi` int NOT NULL,
  `id_ekspedisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `rec_exp`
--

INSERT INTO `rec_exp` (`id_rec_exp`, `id_barang`, `nama_cabang_sebelum`, `id_admin`, `nama_admin`, `waktu_penerimaan`, `resi`, `id_ekspedisi`) VALUES
(2, 12222, 'Bandung', 111, 'Gani', '2022-01-23 08:31:04', 435252, 919);

-- --------------------------------------------------------

--
-- Table structure for table `rec_user`
--

CREATE TABLE `rec_user` (
  `id_rec_user` int NOT NULL,
  `id_barang` int NOT NULL,
  `nama_barang` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nama_cabang_asal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nama_pengirim` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nama_penerima` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `kota` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi_barang` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `rec_user`
--

INSERT INTO `rec_user` (`id_rec_user`, `id_barang`, `nama_barang`, `nama_cabang_asal`, `nama_pengirim`, `nama_penerima`, `kota`, `alamat`, `waktu_penerimaan`, `resi_barang`) VALUES
(1, 1, 'percobaan', 'Bandung', 'Gani', 'ivan', 'Jakarta', 'Jalan Alun-Alun No. 196', '2021-10-28 18:30:30', 907483),
(3, 222222, 'Kasur', 'Semarang', 'Irpan', 'Ivan', 'Bandung', 'Jl. Cibiru No. 111', '2021-10-09 09:00:12', 324244),
(5, 122132, 'Kursi', 'Aceh', 'Agus', 'Ighna', 'Cimahi', 'Jl. Paranya No. 823', '2020-11-12 19:30:12', 235326),
(6, 24324, 'Pensil', 'Bandung', 'Gani', 'Irpan', 'CIbiru', 'Jl. Kepatihan NO.199', '2020-12-08 18:09:00', 213),
(7, 72, 'botol', 'toto', 'agus', 'ilham', 'cijambe', 'jl.berlubang', '2100-12-08 18:09:00', 34);

-- --------------------------------------------------------

--
-- Table structure for table `sen_rec`
--

CREATE TABLE `sen_rec` (
  `id_sen_rec` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nama_penerima` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `waktu_pengiriman` datetime NOT NULL,
  `resi` int NOT NULL,
  `id_pengiriman` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `sen_rec`
--

INSERT INTO `sen_rec` (`id_sen_rec`, `id_barang`, `id_admin`, `nama_admin`, `nama_penerima`, `alamat`, `waktu_pengiriman`, `resi`, `id_pengiriman`) VALUES
(1, 433333333, 1233213, 'Gani', 'Ilham', 'Jl. Paranya No. 823', '2002-12-30 20:09:00', 2353262, 333333321),
(2, 2147483647, 888888888, 'enje', 'indah', 'jl. anu anu anu', '2010-10-09 12:08:32', 444444, 66666666),
(3, 13, 213, 'df', 'as', 'Jl. Cibiru No. 111', '2002-12-30 20:09:00', 4352521, 133);

-- --------------------------------------------------------

--
-- Table structure for table `sen_tran`
--

CREATE TABLE `sen_tran` (
  `id_sen_tran` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_cabang_asal` int NOT NULL,
  `nama_cabang_asal` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_cabang_penerima` int NOT NULL,
  `nama_cabang_penerima` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi_barang` int NOT NULL,
  `id_ekspedisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `sen_tran`
--

INSERT INTO `sen_tran` (`id_sen_tran`, `id_barang`, `id_cabang_asal`, `nama_cabang_asal`, `id_admin`, `nama_admin`, `id_cabang_penerima`, `nama_cabang_penerima`, `waktu_penerimaan`, `resi_barang`, `id_ekspedisi`) VALUES
(1, 2313213, 23213, 'Irian', 12321, 'Gilang', 12312, 'Maluku', '2020-02-14 10:19:20', 324242, 21321),
(2, 1121, 213, 'Bandung', 182, 'Irpan', 321, 'Jakarta', '2020-10-09 12:08:32', 1321424, 213),
(3, 0, 9999, 'cikape', 2222, 'indah', 3333, 'cikole', '2000-10-09 12:08:32', 8888, 9999),
(4, 25252525, 9, 'nnn', 4, 'nnnnn', 5, 'kkk', '2020-10-09 12:08:31', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_tabel`
--

CREATE TABLE `superadmin_tabel` (
  `sa_id` int NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superadmin_tabel`
--

INSERT INTO `superadmin_tabel` (`sa_id`, `username`, `password`) VALUES
(1, 'superadmin1', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `table_admin`
--

CREATE TABLE `table_admin` (
  `admin_id` int NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `password_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_admin`
--

INSERT INTO `table_admin` (`admin_id`, `admin_email`, `password_password`) VALUES
(17, '1231', '123'),
(18, '213', '111'),
(19, '1231', '111'),
(20, '1231', '24124'),
(21, '1231', '111'),
(22, '1231', '111');

-- --------------------------------------------------------

--
-- Table structure for table `table_cabang`
--

CREATE TABLE `table_cabang` (
  `id_table_cabang` int NOT NULL,
  `id_cabang` int NOT NULL,
  `nama_cabang` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `lokasi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `table_cabang`
--

INSERT INTO `table_cabang` (`id_table_cabang`, `id_cabang`, `nama_cabang`, `lokasi`) VALUES
(1, 23, 'Halo', 'Haloww'),
(2, 121212, 'kapol', 'riau'),
(3, 0, 'sss', 'asaa'),
(6, 54, 'ukir', 'paris'),
(7, 3434, 'oppo', 'ciherang'),
(8, 102, 'Cpq2', 'kan'),
(9, 6, 'koko', 'cici'),
(10, 333333333, 'kaka', 'kiki'),
(12, 777, 'k', 'j'),
(13, 123, '2323', '212'),
(14, 1233, 'dfsfs', 'asa'),
(15, 11920, 'Cibiru 01', 'Bandung Timur');

-- --------------------------------------------------------

--
-- Table structure for table `table_karyawan`
--

CREATE TABLE `table_karyawan` (
  `id_table_karyawan` int NOT NULL,
  `id_karyawan` int NOT NULL,
  `nama_karyawan` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cabang_karyawan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `table_karyawan`
--

INSERT INTO `table_karyawan` (`id_table_karyawan`, `id_karyawan`, `nama_karyawan`, `cabang_karyawan`) VALUES
(1, 23, 'Halo', 'Haloww'),
(2, 121212, 'kapol', 'riau'),
(3, 0, 'sss', 'asaa'),
(6, 54, 'ukir', 'paris'),
(7, 999, 'irpan', 'sukabumi'),
(8, 12331, 'Kiki ', 'Cibiru 01'),
(9, 123121, 'Dani', 'Cibiru 01'),
(10, 11221, 'Cici', 'Cibiru 01'),
(11, 121211, 'Cici', 'Cibiru 01');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `user_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`user_id`, `username`, `password`) VALUES
(1, 'user1@gmail.com', '123'),
(2, 'user2@gmail.com', '12323');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rec_exp`
--
ALTER TABLE `rec_exp`
  ADD PRIMARY KEY (`id_rec_exp`),
  ADD UNIQUE KEY `id_barang` (`id_barang`),
  ADD UNIQUE KEY `id_ekspedisi` (`id_ekspedisi`),
  ADD UNIQUE KEY `resi` (`resi`);

--
-- Indexes for table `rec_user`
--
ALTER TABLE `rec_user`
  ADD PRIMARY KEY (`id_rec_user`),
  ADD UNIQUE KEY `id_barang` (`id_barang`),
  ADD UNIQUE KEY `resi_barang` (`resi_barang`);

--
-- Indexes for table `sen_rec`
--
ALTER TABLE `sen_rec`
  ADD PRIMARY KEY (`id_sen_rec`),
  ADD UNIQUE KEY `id_barang` (`id_barang`),
  ADD UNIQUE KEY `id_pengiriman` (`id_pengiriman`),
  ADD UNIQUE KEY `resi` (`resi`);

--
-- Indexes for table `sen_tran`
--
ALTER TABLE `sen_tran`
  ADD PRIMARY KEY (`id_sen_tran`),
  ADD UNIQUE KEY `id_barang` (`id_barang`),
  ADD UNIQUE KEY `resi_barang` (`resi_barang`),
  ADD UNIQUE KEY `id_ekspedisi` (`id_ekspedisi`);

--
-- Indexes for table `superadmin_tabel`
--
ALTER TABLE `superadmin_tabel`
  ADD PRIMARY KEY (`sa_id`);

--
-- Indexes for table `table_admin`
--
ALTER TABLE `table_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `table_cabang`
--
ALTER TABLE `table_cabang`
  ADD PRIMARY KEY (`id_table_cabang`),
  ADD UNIQUE KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `table_karyawan`
--
ALTER TABLE `table_karyawan`
  ADD PRIMARY KEY (`id_table_karyawan`),
  ADD UNIQUE KEY `id_cabang` (`id_karyawan`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rec_exp`
--
ALTER TABLE `rec_exp`
  MODIFY `id_rec_exp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rec_user`
--
ALTER TABLE `rec_user`
  MODIFY `id_rec_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sen_rec`
--
ALTER TABLE `sen_rec`
  MODIFY `id_sen_rec` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sen_tran`
--
ALTER TABLE `sen_tran`
  MODIFY `id_sen_tran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `superadmin_tabel`
--
ALTER TABLE `superadmin_tabel`
  MODIFY `sa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_admin`
--
ALTER TABLE `table_admin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `table_cabang`
--
ALTER TABLE `table_cabang`
  MODIFY `id_table_cabang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `table_karyawan`
--
ALTER TABLE `table_karyawan`
  MODIFY `id_table_karyawan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
