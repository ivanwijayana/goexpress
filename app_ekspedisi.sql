-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2022 at 02:36 PM
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
  `nama_cabang_sebelum` varchar(25) NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi` int NOT NULL,
  `id_ekspedisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nama_barang` varchar(25) NOT NULL,
  `nama_cabang_asal` varchar(20) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi_barang` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rec_user`
--

INSERT INTO `rec_user` (`id_rec_user`, `id_barang`, `nama_barang`, `nama_cabang_asal`, `nama_pengirim`, `nama_penerima`, `kota`, `alamat`, `waktu_penerimaan`, `resi_barang`) VALUES
(1, 1, 'percobaan', 'Bandung', 'Gani', 'ivan', 'Jakarta', 'Jalan Alun-Alun No. 196', '2021-10-28 18:30:30', 907483),
(3, 222222, 'Kasur', 'Semarang', 'Irpan', 'Ivan', 'Bandung', 'Jl. Cibiru No. 111', '2021-10-09 09:00:12', 324244),
(5, 122132, 'Kursi', 'Aceh', 'Agus', 'Ighna', 'Cimahi', 'Jl. Paranya No. 823', '2020-11-12 19:30:12', 235326);

-- --------------------------------------------------------

--
-- Table structure for table `sen_rec`
--

CREATE TABLE `sen_rec` (
  `id_sen_rec` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) NOT NULL,
  `kota` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `waktu_pengiriman` datetime NOT NULL,
  `resi` int NOT NULL,
  `id_pengiriman` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sen_rec`
--

INSERT INTO `sen_rec` (`id_sen_rec`, `id_barang`, `id_admin`, `nama_admin`, `kota`, `alamat`, `waktu_pengiriman`, `resi`, `id_pengiriman`) VALUES
(1, 433333333, 1233213, 'Gani', 'Bandung', 'Jl. Paranya No. 823', '2002-12-30 20:09:00', 2353262, 333333321);

-- --------------------------------------------------------

--
-- Table structure for table `sen_tran`
--

CREATE TABLE `sen_tran` (
  `id_sen_tran` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_cabang_asal` int NOT NULL,
  `nama_cabang_asal` varchar(35) NOT NULL,
  `id_admin` int NOT NULL,
  `nama_admin` varchar(35) NOT NULL,
  `id_cabang_penerima` int NOT NULL,
  `nama_cabang_penerima` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `waktu_penerimaan` datetime NOT NULL,
  `resi_barang` int NOT NULL,
  `id_ekspedisi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sen_tran`
--

INSERT INTO `sen_tran` (`id_sen_tran`, `id_barang`, `id_cabang_asal`, `nama_cabang_asal`, `id_admin`, `nama_admin`, `id_cabang_penerima`, `nama_cabang_penerima`, `waktu_penerimaan`, `resi_barang`, `id_ekspedisi`) VALUES
(1, 2313213, 23213, 'Irian', 12321, 'Gilang', 12312, 'Maluku', '2020-02-14 10:19:20', 324242, 21321);

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
  MODIFY `id_rec_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sen_rec`
--
ALTER TABLE `sen_rec`
  MODIFY `id_sen_rec` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sen_tran`
--
ALTER TABLE `sen_tran`
  MODIFY `id_sen_tran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
