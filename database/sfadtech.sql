-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 04 2023 г., 18:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sfadtech`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_07_073808_create_sessions_table', 1),
(6, '2023_01_07_151010_create_offers_table', 1),
(7, '2023_01_07_151132_create_subscribes_table', 1),
(8, '2023_01_07_151340_create_redirs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `offers`
--

CREATE TABLE `offers` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subjects` text COLLATE utf8mb4_unicode_ci,
  `advertiser_id` bigint UNSIGNED DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `offers`
--

INSERT INTO `offers` (`id`, `created_at`, `updated_at`, `name`, `subjects`, `advertiser_id`, `url`, `price`, `active`) VALUES
(1, '2023-07-13 08:22:25', '2023-07-13 08:22:25', 'Доставка пицы', 'Доставляем пицу, пироги, торты', 4, 'sergadvr.ozon.ru', '0.80', 1),
(2, '2023-07-13 08:29:53', '2023-07-13 08:29:53', 'Ремонт электронной техники', 'Ремонт электронной техники: компьютеров, смартфонов, планшетов', 5, 'NickAdvrWmr.ya.ru', '0.90', 1),
(3, '2023-07-13 08:37:50', '2023-07-13 08:37:50', 'Web дизайн студия', 'Web дизайн студия: создание сайтов и приложений', 8, 'http://siebellab.ru/', '0.80', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(77, 'App\\Models\\User', 1, 'admin', 'd778e9b9571e150c10ad8478e1ade3cf87651f61701e07689dda733c8f79760d', '[\"*\"]', '2023-07-24 08:39:29', '2023-07-24 08:39:28', '2023-07-24 08:39:29'),
(133, 'App\\Models\\User', 6, 'Sophy', '95e42e9818e10b625241c296b5cb2753b78fa3ef2b55515f72bd679c4d669a34', '[\"*\"]', '2023-07-31 09:57:54', '2023-07-31 09:57:53', '2023-07-31 09:57:54');

-- --------------------------------------------------------

--
-- Структура таблицы `redirs`
--

CREATE TABLE `redirs` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offer_id` bigint UNSIGNED NOT NULL,
  `webmaster_id` bigint UNSIGNED DEFAULT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'переход по ссылке осуществлен',
  `accept` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ссылка предоставлена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `redirs`
--

INSERT INTO `redirs` (`id`, `created_at`, `updated_at`, `offer_id`, `webmaster_id`, `success`, `accept`) VALUES
(1, '2023-07-25 09:24:58', '2023-07-25 09:24:58', 3, 6, 0, 1),
(2, '2023-07-25 09:47:03', '2023-07-25 09:47:03', 2, 6, 0, 1),
(3, '2023-07-25 09:47:58', '2023-07-25 09:47:58', 3, 6, 0, 1),
(4, '2023-07-26 06:49:17', '2023-07-26 06:49:17', 3, 6, 0, 1),
(5, '2023-07-31 04:24:47', '2023-07-31 04:24:47', 2, 6, 0, 1),
(6, '2023-07-31 04:25:02', '2023-07-31 04:25:02', 3, 6, 0, 1),
(7, '2023-07-31 04:25:13', '2023-07-31 04:25:13', 3, 6, 0, 1),
(8, '2023-07-31 04:26:27', '2023-07-31 04:26:27', 3, 6, 0, 1),
(9, '2023-07-31 04:27:36', '2023-07-31 04:27:36', 2, 6, 0, 1),
(10, '2023-07-31 07:16:36', '2023-07-31 07:16:36', 3, 6, 0, 1),
(11, '2023-07-31 07:33:04', '2023-07-31 07:33:04', 3, 6, 0, 1),
(12, '2023-07-31 09:55:22', '2023-07-31 09:55:22', 3, 6, 1, 1),
(13, '2023-07-31 09:56:44', '2023-07-31 09:56:44', 2, 6, 1, 1),
(14, '2023-07-31 09:57:54', '2023-07-31 09:57:54', 3, 6, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offer_id` bigint UNSIGNED NOT NULL,
  `webmaster_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subscribes`
--

INSERT INTO `subscribes` (`id`, `created_at`, `updated_at`, `offer_id`, `webmaster_id`) VALUES
(1, '2023-07-13 08:45:54', '2023-07-13 08:45:54', 3, 6),
(2, '2023-07-13 10:47:20', '2023-07-13 10:47:20', 2, 6),
(3, '2023-07-14 04:44:37', '2023-07-14 04:44:37', 3, 6),
(4, '2023-07-19 04:38:15', '2023-07-19 04:38:15', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_level` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `advertiser` tinyint(1) NOT NULL DEFAULT '0',
  `webmaster` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `access_level`, `advertiser`, `webmaster`, `admin`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 2, 0, 0, 1, 'admin@example.com', NULL, '$2y$10$rLFtQgFe/LqWwio50u38h.BjpE7Dt6A5Fz.Py7F0qKqnKW6/jA7GK', '69fRFYY0HLAxzBMyF6mh6Rktp5MBOIfTavoD94zgjfWQzYvxiUpuA11hRjl2', NULL, NULL),
(2, 'advertiser', 2, 1, 0, 0, 'advertiser@example.com', NULL, '$2y$10$5CLWFkBXtvLe7qZm1pxD3.qXGdALMPfKO3W1ECcYLx9eUUtA19imO', NULL, NULL, NULL),
(3, 'webmaster', 2, 0, 1, 0, 'webmaster@example.com', NULL, '$2y$10$RXf40KjWAK5HXOqMcfnCFueEjoBiyBMQ9IzFcbVgOgXVomb838usO', NULL, NULL, NULL),
(4, 'SergAdvr', 2, 1, 0, 0, 'SergAdvr@example.com', NULL, '$2y$10$YyFJJVqF739MjnerixnH/u.YEXwF3//Var70GYxStwB2oY/IH3yB6', NULL, '2023-07-13 07:05:24', '2023-07-13 07:05:55'),
(5, 'NickAdvrWmr', 2, 1, 1, 0, 'NickAdvrWmr@example.com', NULL, '$2y$10$/umVHvBzqnxzCBo4.YCONevVwFMeNhaBvi43CDNH7.Oje4aYEUG7i', NULL, '2023-07-13 07:07:57', '2023-07-13 07:17:08'),
(6, 'Sophy', 2, 0, 1, 0, 'Sophy@example.com', NULL, '$2y$10$gOhPB1F6Mu7NPBTSu.3Olu/Ei04QGD.O6AMfYmWe1dx48bQCb.RvO', NULL, '2023-07-13 07:10:17', '2023-07-13 07:10:36'),
(7, 'AlexWmr', 2, 0, 1, 0, 'AlexWmr@example.com', NULL, '$2y$10$ZcwXPf7vkq4Khvh7kcPiI.fS.DIUPsEvL8iWD0HYWpDUsZ/WYdCl.', NULL, '2023-07-13 07:12:05', '2023-07-13 07:12:31'),
(8, 'Mike', 2, 1, 1, 1, 'Mike@example.com', NULL, '$2y$10$HcdaDjn/2zECQegKW9TdReE1jXLLZUifnYjyZ7yqTTNH5c2u88/o.', NULL, '2023-07-13 07:13:59', '2023-07-13 07:16:33');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offers_name_unique` (`name`),
  ADD KEY `offers_advertiser_id_foreign` (`advertiser_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `redirs`
--
ALTER TABLE `redirs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `redirs_offer_id_foreign` (`offer_id`),
  ADD KEY `redirs_webmaster_id_foreign` (`webmaster_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribes_offer_id_foreign` (`offer_id`),
  ADD KEY `subscribes_webmaster_id_foreign` (`webmaster_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT для таблицы `redirs`
--
ALTER TABLE `redirs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_advertiser_id_foreign` FOREIGN KEY (`advertiser_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `redirs`
--
ALTER TABLE `redirs`
  ADD CONSTRAINT `redirs_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `redirs_webmaster_id_foreign` FOREIGN KEY (`webmaster_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subscribes`
--
ALTER TABLE `subscribes`
  ADD CONSTRAINT `subscribes_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribes_webmaster_id_foreign` FOREIGN KEY (`webmaster_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
