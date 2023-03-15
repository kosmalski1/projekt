-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Mar 2023, 14:11
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `baza_moja`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `filename` varchar(96) NOT NULL,
  `namememe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `namememe`) VALUES
(1, '2023-02-15 14:30:28', '7570b0c8c45924bc2bbe8309fde05380fd9bdc01406882f5dd9a7b2d7de925e4', ''),
(2, '2023-02-15 14:30:42', '7570b0c8c45924bc2bbe8309fde05380fd9bdc01406882f5dd9a7b2d7de925e4', ''),
(3, '2023-02-15 15:08:43', '7570b0c8c45924bc2bbe8309fde05380fd9bdc01406882f5dd9a7b2d7de925e4', ''),
(4, '2023-03-01 14:33:42', 'img/c19dae4899be3e86cd8fb3f505a1f07d8c24dd34d52ae7bbe7fb31800812c0eb.webp', ''),
(5, '2023-03-01 14:35:19', 'img/b62135e9d77abdb60eb2522c31f80d942231081c79708070392334b3598ae578.webp', ''),
(6, '2023-03-01 14:35:24', 'img/4476dd35126a9887ded06433ad8eeb5e20e0d7553c61095ca0be096d661fb9dd.webp', ''),
(7, '2023-03-01 14:53:13', 'img/3d9a51f4bc70ad83e77b0eac1f1640608942307003c7dc197e830dc897a123d5.webp', ''),
(8, '2023-03-01 14:53:20', 'img/e101c0e14a13a00340ecf307f58e11ee2f3bab8dfa3b3fbdb9551335448c5474.webp', ''),
(9, '2023-03-01 14:54:30', 'img/cb852430bc3fabeccc0c89a858be46e62eb4d60cef1978c6c60e831423adb859.webp', ''),
(10, '2023-03-01 14:56:49', 'img/de139f1c64993c27f75e1d7abac458509c3bccf1139564a44bbf84e1c3f50678.webp', ''),
(11, '2023-03-01 15:17:11', 'img/8575e5eb6d311ef109c7c52307ae68367c57868e11c871094ad250e97decb47d.webp', ''),
(12, '2023-03-01 15:18:41', 'img/b5b7fab384063a32747980042e6cc25ec4b5b6e6f0fafa1d6d69e08916373f07.webp', ''),
(13, '2023-03-01 15:19:30', 'img/ba981c1f59f75c4066010cb130c6f0e6721887cc252745f801713632bd9ed2e9.webp', ''),
(14, '2023-03-01 15:20:05', 'img/2003661f89114adac6152716e588ba7e96eecc7e6019f1219462910a3b5fab91.webp', ''),
(15, '2023-03-01 15:21:14', 'img/040d5b5801602b7e03ff219b768a94851e75d5d889623ae92cfd9e08ba4c8683.webp', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
