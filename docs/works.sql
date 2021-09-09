-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Wrz 2021, 13:24
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `work_time`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `works`
--

CREATE TABLE `works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_working` timestamp NULL DEFAULT NULL,
  `end_working` timestamp NULL DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `works`
--

INSERT INTO `works` (`id`, `name`, `start_working`, `end_working`, `completed`, `created_at`, `updated_at`) VALUES
(3, 'Czytanie dokumentacji', '2020-09-07 07:51:12', '2020-09-07 09:51:15', 1, '2021-09-06 15:51:02', '2021-09-07 07:51:15'),
(15, 'Instalacja oprogramowania', '2021-04-30 08:43:18', '2021-04-30 09:30:20', 1, '2021-09-07 08:36:49', '2021-09-07 08:43:20'),
(17, 'Umieszczanie projektu na GitHubie', '2021-09-07 14:22:48', '2021-09-07 14:35:02', 1, '2021-09-07 08:46:31', '2021-09-08 16:22:02'),
(19, 'Implementacja wyszukiwarki', '2021-09-08 12:25:39', '2021-09-09 06:22:39', 1, '2021-09-08 12:25:34', '2021-09-09 06:22:39'),
(20, 'Testy aplikacji', '2021-09-08 16:22:26', '2021-09-09 06:22:48', 1, '2021-09-08 16:22:14', '2021-09-09 06:22:48'),
(26, 'Ostatnie szlify', '2021-09-09 07:29:37', '2021-09-09 07:30:53', 1, '2021-09-09 07:29:19', '2021-09-09 07:30:53'),
(27, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '2021-09-09 08:06:51', NULL, 0, '2021-09-09 08:06:40', '2021-09-09 08:06:51'),
(28, 'Analiza', '2021-09-09 08:21:28', NULL, 0, '2021-09-09 08:07:51', '2021-09-09 08:21:28'),
(29, 'Przygotowanie dokumentacji', NULL, NULL, 0, '2021-09-09 08:21:49', '2021-09-09 08:21:49'),
(30, 'Nowe zadanie', NULL, NULL, 0, '2021-09-09 08:28:23', '2021-09-09 08:28:23');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `works`
--
ALTER TABLE `works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
