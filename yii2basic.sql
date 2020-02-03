-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 24 Mei 2018 pada 08.15
-- Versi Server: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2basic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `no_anak` int(12) NOT NULL,
  `no_ibu` varchar(12) NOT NULL,
  `anak_ke` varchar(2) NOT NULL,
  `nama_anak` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tgl_meninggal` date NOT NULL,
  `penyebab` text NOT NULL,
  `beratbayi` varchar(12) NOT NULL,
  `punya_KMS` enum('ya','tidak') NOT NULL,
  `penolong_persalinan` enum('bidan','dokter') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anak`
--

INSERT INTO `anak` (`no_anak`, `no_ibu`, `anak_ke`, `nama_anak`, `tgl_lahir`, `jk`, `tgl_meninggal`, `penyebab`, `beratbayi`, `punya_KMS`, `penolong_persalinan`) VALUES
(1, '1', '30', 'aaa', '0000-00-00', 'L', '0000-00-00', 'ddrfr', '2323', 'ya', 'bidan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `historyanak`
--

CREATE TABLE `historyanak` (
  `no_anak` int(12) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `historyanak`
--

INSERT INTO `historyanak` (`no_anak`, `tanggal`, `waktu`) VALUES
(1, '0000-00-00', '12:31:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `historyibu`
--

CREATE TABLE `historyibu` (
  `no_ibu` int(12) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ibu`
--

CREATE TABLE `ibu` (
  `no_ibu` int(12) NOT NULL,
  `nama_ibu` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_posyandu` varchar(12) NOT NULL,
  `nama_suami` varchar(25) NOT NULL,
  `tgllahir_ibu` date NOT NULL,
  `tglibu_meninggal` date NOT NULL,
  `penyebab_meninggal` text NOT NULL,
  `keadaan_ibu` enum('hamil','pasca hamil') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ibuhamil`
--

CREATE TABLE `ibuhamil` (
  `no_ibu` int(12) NOT NULL,
  `pelayanan` enum('cek rutin','vaksinasi','persalinan') NOT NULL,
  `tgl_pelayanan` date NOT NULL,
  `umur_kehamilan` float NOT NULL,
  `resiko_kehamilan` enum('rendah','tinggi','tinggi sekali') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(50) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `authKey` varchar(50) DEFAULT NULL,
  `accessToken` varchar(50) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `authKey`, `accessToken`, `role`) VALUES
(1, 'mursit', 'bismillah', 'mursit-12345', 'mumu2937412912zzzz', 'Admin'),
(2, 'alvin', 'aaa', 'sss', 'www', 'pegawai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `no_petugas` int(50) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `jabatan` enum('kader','bidan','petugas','dokter') NOT NULL,
  `Kecamatan` varchar(50) NOT NULL,
  `Kelurahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`no_petugas`, `nama_petugas`, `jabatan`, `Kecamatan`, `Kelurahan`) VALUES
(2, 'nni', 'kader', 'jnji', 'jnjink');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensipetugas`
--

CREATE TABLE `presensipetugas` (
  `no_presensipetugas` int(50) NOT NULL,
  `no_petugas` int(50) NOT NULL,
  `no_posyandu` int(50) NOT NULL,
  `tgl_presensi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabelposyandu`
--

CREATE TABLE `tabelposyandu` (
  `no_posyandu` int(50) NOT NULL,
  `nama_posyandu` varchar(50) NOT NULL,
  `no_kecamatan` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktuimunisasi`
--

CREATE TABLE `waktuimunisasi` (
  `no_anak` int(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `hari_tanggal` date NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`no_anak`,`no_ibu`);

--
-- Indexes for table `historyanak`
--
ALTER TABLE `historyanak`
  ADD PRIMARY KEY (`no_anak`);

--
-- Indexes for table `historyibu`
--
ALTER TABLE `historyibu`
  ADD PRIMARY KEY (`no_ibu`);

--
-- Indexes for table `ibu`
--
ALTER TABLE `ibu`
  ADD PRIMARY KEY (`no_ibu`);

--
-- Indexes for table `ibuhamil`
--
ALTER TABLE `ibuhamil`
  ADD PRIMARY KEY (`no_ibu`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`no_petugas`);

--
-- Indexes for table `presensipetugas`
--
ALTER TABLE `presensipetugas`
  ADD PRIMARY KEY (`no_petugas`,`no_posyandu`);

--
-- Indexes for table `tabelposyandu`
--
ALTER TABLE `tabelposyandu`
  ADD PRIMARY KEY (`no_posyandu`,`no_kecamatan`);

--
-- Indexes for table `waktuimunisasi`
--
ALTER TABLE `waktuimunisasi`
  ADD PRIMARY KEY (`no_anak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `no_petugas` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `historyanak`
--
ALTER TABLE `historyanak`
  ADD CONSTRAINT `historyanak_ibfk_1` FOREIGN KEY (`no_anak`) REFERENCES `anak` (`no_anak`);

--
-- Ketidakleluasaan untuk tabel `historyibu`
--
ALTER TABLE `historyibu`
  ADD CONSTRAINT `historyibu_ibfk_1` FOREIGN KEY (`no_ibu`) REFERENCES `ibu` (`no_ibu`);

--
-- Ketidakleluasaan untuk tabel `ibuhamil`
--
ALTER TABLE `ibuhamil`
  ADD CONSTRAINT `ibuhamil_ibfk_1` FOREIGN KEY (`no_ibu`) REFERENCES `ibu` (`no_ibu`);

--
-- Ketidakleluasaan untuk tabel `presensipetugas`
--
ALTER TABLE `presensipetugas`
  ADD CONSTRAINT `presensipetugas_ibfk_1` FOREIGN KEY (`no_petugas`) REFERENCES `petugas` (`no_petugas`);

--
-- Ketidakleluasaan untuk tabel `waktuimunisasi`
--
ALTER TABLE `waktuimunisasi`
  ADD CONSTRAINT `waktuimunisasi_ibfk_1` FOREIGN KEY (`no_anak`) REFERENCES `anak` (`no_anak`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
