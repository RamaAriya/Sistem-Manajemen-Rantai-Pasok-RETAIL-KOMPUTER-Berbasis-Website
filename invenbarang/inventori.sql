-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2022 at 09:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `jumlah`, `tujuan`, `satuan`) VALUES
(6, 'TRK-1222001', '2022-12-25', 'BAR-1222002', 'VGA RTX 2060 TI', '2', 'Malang', 'Unit'),
(7, 'TRK-1222002', '2022-12-25', 'BAR-1222010', 'Seagate Baracuda 2TB', '5', 'Jombang', 'Unit'),
(8, 'TRK-1222003', '2022-12-25', 'BAR-1222010', 'Seagate Baracuda 2TB', '5', 'Banyuwangi', 'Unit');

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `barang_keluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah-new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `pengirim`, `jumlah`, `satuan`) VALUES
(5, 'TRM-1222003', '2022-12-25', 'BAR-1222002', 'VGA RTX 2060 TI', 'Advantech International', '10', 'Unit'),
(6, 'TRM-1222004', '2022-12-25', 'BAR-1222005', 'VGA GTX 1650 Ti', 'Advantech International', '10', 'Unit'),
(7, 'TRM-1222005', '2022-12-25', 'BAR-1222002', 'VGA RTX 2060 TI', 'Advantech International', '20', 'Unit'),
(8, 'TRM-1222006', '2022-12-25', 'BAR-1222006', 'NZXT casing', 'PT. Bina Unggul Bangun Abadi', '15', 'Unit'),
(9, 'TRM-1222007', '2022-12-25', 'BAR-1222003', 'Corsair Vengeance', 'PT. Gosyen Solusindo Cemerlang', '10', 'Unit'),
(10, 'TRM-1222008', '2022-12-25', 'BAR-1222004', 'Processor Intel Core i7-13700K', 'PT. Inti Media Data', '15', 'Unit'),
(11, 'TRM-1222009', '2022-12-25', 'BAR-1222007', 'PSU Corsair CX500M', 'PT. Bina Unggul Bangun Abadi', '20', 'Unit'),
(12, 'TRM-1222010', '2022-12-25', 'BAR-1222008', 'VGA RTX 2070 Super', 'Advantech International', '5', 'Unit'),
(13, 'TRM-1222011', '2022-12-25', 'BAR-1222011', 'Processor Intel Core i5-13600K', 'PT. Inti Media Data', '15', 'Unit'),
(14, 'TRM-1222012', '2022-12-25', 'BAR-1222009', 'ASUS Z170 Pro', 'PT. Gosyen Solusindo Cemerlang', '20', 'Unit'),
(15, 'TRM-1222013', '2022-12-25', 'BAR-1222010', 'Seagate Baracuda 2TB', 'Advantech International', '30', 'Unit'),
(16, 'TRM-1222014', '2022-12-25', 'BAR-1222008', 'VGA RTX 2070 Super', 'PT. Inti Media Data', '5', 'Unit');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah+new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`id`, `kode_barang`, `nama_barang`, `jenis_barang`, `jumlah`, `satuan`) VALUES
(2, 'BAR-1222002', 'VGA RTX 2060 TI', 'Graphic Card', '20', 'Unit'),
(3, 'BAR-1222003', 'Corsair Vengeance', 'Memory', '20', 'Unit'),
(4, 'BAR-1222004', 'Processor Intel Core i7-13700K', 'Processor', '15', 'Unit'),
(5, 'BAR-1222005', 'VGA GTX 1650 Ti', 'Graphic Card', '10', 'Unit'),
(6, 'BAR-1222006', 'NZXT casing', 'Casing PC', '15', 'Unit'),
(7, 'BAR-1222007', 'PSU Corsair CX500M', 'Power Suplay', '20', 'Unit'),
(8, 'BAR-1222008', 'VGA RTX 2070 Super', 'Graphic Card', '10', 'Unit'),
(9, 'BAR-1222009', 'ASUS Z170 Pro', 'Motherboard', '20', 'Unit'),
(10, 'BAR-1222010', 'Seagate Baracuda 2TB', 'Harddisk', '20', 'Unit'),
(11, 'BAR-1222011', 'Processor Intel Core i5-13600K', 'Processor', '15', 'Unit');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `jenis_barang`) VALUES
(8, 'Power Suplay'),
(9, 'Motherboard'),
(10, 'Casing PC'),
(11, 'Harddisk'),
(13, 'Microphone'),
(15, 'Graphic Card'),
(16, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `satuan`) VALUES
(5, 'Unit'),
(7, 'PCS'),
(11, 'Butir');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(100) NOT NULL,
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(10, 'SUP-1219001', 'PT. Bina Unggul Bangun Abadi', 'Jl. Hayam Wuruk, Jakarta Barat', '085546982020'),
(11, 'SUP-1222002', 'PT. Inti Media Data', 'Jl. Merdeka Blok A No. 32 Depok, Jawa Barat', '082233697711'),
(12, 'SUP-1222003', 'Advantech International', 'Jl. TB Simatupang Kav 10 Jakarta Selatan', '081451478551'),
(14, 'SUP-1222005', 'PT. Gosyen Solusindo Cemerlang', 'Jl. Kedondong Harapan Indah TT Bekasi, Jawa Barat', '082257614661');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'member',
  `foto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `alamat`, `telepon`, `username`, `password`, `level`, `foto`) VALUES
(26, '1001', 'Superadmin', '', '08999444000', 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', 'superadmin', 'teacher4.png'),
(27, '10001', '', '', '0986660000', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'fotoadmin.jpg'),
(28, '1', 'Cahyadi', 'tulungagung', '0877777777', 'cahyadi_89', '123', 'superadmin', 'teacher4.png'),
(32, '3578261727', 'Abdul Aziz', '', '082121212121', 'zamik', 'be6a446007b54b2e31e4fc253bef46b6', 'superadmin', 'proses login.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
