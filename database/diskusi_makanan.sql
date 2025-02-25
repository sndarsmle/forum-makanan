-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2023 pada 06.10
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diskusi_makanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `isi_diskusi`
--

CREATE TABLE `isi_diskusi` (
  `id_diskusi` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul` varchar(225) NOT NULL,
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `isi_diskusi`
--

INSERT INTO `isi_diskusi` (`id_diskusi`, `user_id`, `judul`, `tanggal`, `isi`) VALUES
(21, 7, 'Hayo siapa yang doyan rengginang?', '2023-12-01', 'Mengapa rengginang sangat populer padahal rasanya tidak enak? '),
(22, 9, 'Pencinta seafood kumpul sini !!', '2023-12-01', 'Apa alasan kalian menyukai seafood padahal kan harga seafood relatif cukup mahal?'),
(23, 9, 'Rekomendasi tempat kuliner jogja', '2023-12-02', 'yang orang jogja, spill tempat kulineran kalian dongg'),
(24, 10, 'Rendang makanan terenak didunia', '2023-12-02', 'Berikan pendapatmu mengenai masakan dari tanah sumatera yang satu ini'),
(25, 8, 'gudeng yu djum di jogja gudeg terenak yang pernah aku cicipi', '2023-12-02', 'drop warung gudeg kesukaan kalian dong gaess'),
(27, 13, 'a', '2023-12-02', 'b');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `diskusi_id` int(11) NOT NULL,
  `id_reply` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `isi_komen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `user_id`, `diskusi_id`, `id_reply`, `tanggal`, `isi_komen`) VALUES
(52, 8, 21, 0, '2023-12-01 19:28:56', 'Tergantung selera sih itu, tidak bisa kamu langsung memberi label tidak enak pada suatu makanan karena kamu tidak suka'),
(53, 9, 21, 52, '2023-12-01 19:29:49', 'Setuju, selera orang itu berbeda beda '),
(54, 11, 21, 0, '2023-12-01 19:32:09', 'Kalo menurut kamu, rengginang tidak enak, mungkin kamu pernah mencoba rengginang yang kwalitas nya kurang baik, jadi kecewa. Karena di pasaran, memang banyak sekali orang yang berjualan rengginang dengan rasa & kwalitas yang berbeda. Faktanya, banyak kok orang yang sangat menyukai camilan renyah ini, apalagi kalau bentuknya kecil² mirip popcorn, jadi memang di bikin untuk sekali masuk mulut/ suapan, sehingga sisa remahan nya tidak ambyar kemana mana. '),
(55, 10, 21, 54, '2023-12-01 19:35:57', 'Betull kawann '),
(56, 9, 21, 54, '2023-12-01 19:36:48', 'top komennn'),
(57, 8, 22, 0, '2023-12-02 05:01:05', 'buat saya, rasanya seafood itu unik dan berbeda dari jenis makanan lainnya. Ada sensasi gurih dan segar yang sulit ditemukan di makanan lain.'),
(58, 8, 22, 57, '2023-12-02 05:01:31', 'Dan jangan lupakan aroma khas seafood yang bikin selera makan naik tinggi! Saya rasa, keunikan aroma inilah yang membuat saya ketagihan.'),
(59, 7, 22, 57, '2023-12-02 05:02:18', 'Setuju banget! Seafood itu juga punya variasi rasa yang kaya. Mulai dari gurih udang, manis kepiting, sampai gurih asin cumi. Varietynya membuat setiap suap menjadi petualangan rasa.'),
(60, 7, 23, 0, '2023-12-02 05:28:29', 'Mie ayam bu tumini porsinya mantap polll'),
(62, 7, 22, 0, '2023-12-02 06:12:50', 'Meskipun harganya mahal, tapi menurut saya, makan seafood itu bikin saya merasa berkelas. Cocok untuk acara khusus atau momen spesial. Jadi, ada unsur eksklusivitasnya gitu '),
(64, 8, 21, 55, '2023-12-02 10:37:39', 'bener bangettt'),
(65, 13, 23, 0, '2023-12-02 10:48:19', 'mie ayam depan upn');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(7, 'ageng', '123'),
(8, 'akbar', '123'),
(9, 'sandar', '123'),
(10, 'ariffianto', '123'),
(11, 'rizki', '123'),
(12, 'entintas_tidak_diketahui', '123'),
(13, 'adit', '123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `isi_diskusi`
--
ALTER TABLE `isi_diskusi`
  ADD PRIMARY KEY (`id_diskusi`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `diskusi_id` (`diskusi_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `isi_diskusi`
--
ALTER TABLE `isi_diskusi`
  MODIFY `id_diskusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `isi_diskusi`
--
ALTER TABLE `isi_diskusi`
  ADD CONSTRAINT `isi_diskusi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`diskusi_id`) REFERENCES `isi_diskusi` (`id_diskusi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
