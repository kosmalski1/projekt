-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Maj 2023, 15:20
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
  `namememe` text NOT NULL,
  `userId` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `namememe`, `userId`, `removed`) VALUES
(20, '2023-03-29 14:15:30', 'img/86b835b247136ceac93e270f4f6cd7d12fab44001954a77f0f7b47f4eeac1eaa.webp', 'rthyetrh', 2, 0),
(21, '2023-03-29 14:18:56', 'img/444d1792f5ba496be28f4f6e4c60bfeb866da6447c5c9e18e6622bafe4e0f105.webp', 'rthyetrh', 2, 0),
(22, '2023-03-29 14:20:16', 'img/2e9c1197278d77bd1178861cc708f5f91e59cba55faa674b32f1c6da9aa1512a.webp', 'rthyetrh', 2, 0),
(23, '2023-03-29 14:24:57', 'img/f902bbd3a6ff847a3624770194220f7117dc0986ae6055134d20c921eb596d91.webp', 'rthyetrh', 2, 0),
(24, '2023-03-29 14:24:57', 'img/2cee55f1613a121f3a5adec1626d3b463b19156cd9e3916bed5f1361a29c5028.webp', 'rthyetrh', 2, 0),
(25, '2023-03-29 14:29:33', 'img/52c3b98f03688a8a2ee394b28ff0b383dc982c4c1ff9dd23bd3e67a6d55f1cab.webp', 'sxdd', 2, 1),
(26, '2023-03-29 14:30:32', 'img/620920ee7d227da84e5e974b76ccb7aba4a226b63127e7d9d305aa81fe7ac90b.webp', 'sxdd', 2, 1),
(27, '2023-04-26 14:14:29', 'img/1a1f5987ce8e240048a50b69e108c8878658e9fbd20681104f8884f868a15be9.webp', 'gggggg', 2, 0),
(28, '2023-04-26 14:39:27', 'img/a97b2f43d51e980630d73a08d7e5399e7907e50942540c5c61d00b1ff644770d.webp', 'kurwa', 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rating`
--

INSERT INTO `rating` (`id`, `post_id`, `score`, `user_id`) VALUES
(1, 28, -1, 2),
(2, 28, 1, 2),
(3, 28, 1, 2),
(4, 28, 1, 2),
(5, 27, -1, 2),
(6, 23, 1, 2),
(7, 24, 1, 2),
(8, 28, 1, 2),
(9, 28, 1, 2),
(10, 22, -1, 2),
(11, 27, 1, 2),
(12, 23, -1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'aaa@bbb.pl', '$argon2i$v=19$m=65536,t=4,p=1$N2tmU0poSG1BdktiRk5MNw$TOuHeFdVMlvvEzfasb0k8ZkwBVGD8fm13BhW0JqKOZo'),
(2, 'chuj@kutas.cum', '$argon2i$v=19$m=65536,t=4,p=1$c2lqLy5vZy9GZFEvWWN4Tw$Np0BrK2aC3I1I0vILpkBa/lMTJ+/EcnoaW4t7+g8JBw'),
(3, 'chuj@kutas.cum', '$argon2i$v=19$m=65536,t=4,p=1$LkxJSHpXbWNORkdSYXQ3Wg$fSeqjQe+rtN1YMxvgJR3rNiwKrF0PCKluXb8eYQr9u4'),
(4, 'chuj@kutas.cum', '$argon2i$v=19$m=65536,t=4,p=1$bGxnUGdvT1dIeTZDZ1kuWg$b0FOo62fe9YFZe3rcqVzKy5vb4ImG8Y1EOTeKnKU1ZE');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `post_id_2` (`post_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT dla tabeli `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
