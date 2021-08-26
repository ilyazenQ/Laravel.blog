-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 26 2021 г., 13:08
-- Версия сервера: 5.7.29
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Кат1', 'kat1', '2021-06-13 20:55:20', '2021-06-13 20:55:20'),
(2, 'Кат2', 'kat2', '2021-06-13 20:55:25', '2021-06-13 20:55:25'),
(3, 'perspiciatis', 'perspiciatis', '2021-06-22 19:41:10', '2021-06-22 19:41:10'),
(4, 'delectus', 'delectus', '2021-06-22 19:41:10', '2021-06-22 19:41:10'),
(5, 'id', 'id', '2021-06-22 19:41:10', '2021-06-22 19:41:10'),
(6, 'cum', 'cum', '2021-06-22 19:41:10', '2021-06-22 19:41:10'),
(7, 'Rfntujhbz 23', 'rfntujhbz-23', '2021-07-04 23:06:54', '2021-07-04 23:06:54');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(4, '123123213', 6, 2, 1, '2021-07-04 01:29:09', '2021-07-04 01:31:09'),
(5, '123123123123', 1, 2, 1, '2021-07-04 01:41:38', '2021-07-04 01:41:48');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(35, '2014_10_12_000000_create_users_table', 1),
(36, '2014_10_12_100000_create_password_resets_table', 1),
(37, '2021_05_28_042437_create_categories_table', 1),
(38, '2021_05_28_043205_create_tags_table', 1),
(39, '2021_05_28_043403_create_comments_table', 1),
(40, '2021_05_28_043428_create_posts_table', 1),
(41, '2021_05_28_043501_create_subscriptions_table', 1),
(42, '2021_05_28_044456_create_posts_tags_table', 1),
(43, '2021_06_10_095350_add_avatar_column_to_users', 1),
(44, '2021_06_12_053352_make_password_nullable', 2),
(45, '2021_06_14_055911_add_date_to_posts', 3),
(46, '2021_06_14_061437_add_image_to_posts', 4),
(47, '2021_06_23_035927_add_description_to_posts', 5),
(48, '2021_07_02_053047_add_description_to_users', 6),
(49, '2019_08_19_000000_create_failed_jobs_table', 7);

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
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `is_featured` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `category_id`, `user_id`, `status`, `views`, `is_featured`, `created_at`, `updated_at`, `date`, `image`, `description`) VALUES
(1, 'Title', '123', '<p>    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et praesentium, magnam, distinctio id nostrum sapiente illo repellendus placeat laboriosam fugit dignissimos hic, in assumenda eligendi facilis nemo labore cumque eaque.\r\n    Blanditiis, officiis ex? Blanditiis, libero inventore? Sunt eaque, ipsum nesciunt consequuntur quasi harum odit totam repellat recusandae minima incidunt fugit maxime praesentium aliquid? Non architecto autem modi veniam, obcaecati quod.\r\n    Fugiat dicta vero doloribus, dolores quod nihil in, a possimus placeat et maxime quos deleniti veniam optio perferendis similique recusandae corporis eos consequuntur fuga unde suscipit reprehenderit! Repudiandae, earum quae.\r\n<img src =\"https://swedbyte.ru/wp-content/uploads/2020/10/maxresdefault.jpg\">\r\n<h2 class=\"h2\">ArticleSubTitle</h2>\r\n    Voluptatum aliquid numquam ratione sequi, nulla deleniti eaque itaque culpa. Quisquam dolores ad dolore ratione possimus adipisci modi ipsa tempore, minus autem harum odio delectus. Perferendis quis esse illo! Eveniet.\r\n    Ad vitae, sit tempore modi ea molestias quos dolorum totam asperiores facere illum cumque quis animi esse ab fuga voluptates. Optio porro sapiente ratione sit, blanditiis amet cumque eligendi alias!</p>', 1, 1, 1, 0, 1, '2021-06-13 22:01:31', '2021-08-17 20:38:30', '2001-06-21', 'AsKGkgEa8d.png', 'Description'),
(3, '123', '123-2', '<p>1321</p>', 1, 1, 1, 0, 0, '2021-06-13 22:17:48', '2021-07-03 00:41:59', '2021-06-01', NULL, NULL),
(4, '3213123', '3213123', '<p>123123</p>', 1, 1, 1, 0, 1, '2021-06-13 22:35:09', '2021-08-17 20:30:59', '2021-07-01', 'VpqwW2QE8y.jpeg', 'asfsdfsdgafasfdsdfafaf'),
(5, 'Atque eos temporibus ut magnam id nostrum officiis nostrum.', 'atque-eos-temporibus-ut-magnam-id-nostrum-officiis-nostrum', 'Voluptas eius a eos nam nesciunt neque veritatis.', 1, 1, 1, 225, 0, '2021-06-22 19:47:06', '2021-07-03 00:42:01', '2003-02-01', 'photo1.png', NULL),
(6, 'Consequatur et error eligendi explicabo animi voluptas.', 'consequatur-et-error-eligendi-explicabo-animi-voluptas', 'Dolores accusamus nesciunt eius aut quisquam.', 1, 1, 1, 50, 0, '2021-06-22 19:47:06', '2021-07-03 00:42:03', '2003-02-01', 'photo1.png', NULL),
(7, 'Laudantium et beatae voluptas aliquam nesciunt tenetur.', 'laudantium-et-beatae-voluptas-aliquam-nesciunt-tenetur', 'Ea doloremque vel eos esse nulla delectus.', 1, 1, 1, 44, 0, '2021-06-22 19:47:06', '2021-07-03 00:42:15', '2003-02-01', 'photo1.png', NULL),
(8, 'Voluptas itaque ut suscipit et ex ut vero.', 'voluptas-itaque-ut-suscipit-et-ex-ut-vero', 'Autem error aut est ab rerum voluptatibus qui saepe.', 1, 1, 1, 357, 0, '2021-06-22 19:47:06', '2021-07-03 00:42:06', '2003-02-01', 'photo1.png', NULL),
(9, 'cnfnmz', 'cnfnmz', '<p>321</p>', 1, 1, 1, 0, 1, '2021-07-01 21:22:32', '2021-07-03 00:42:09', '2021-07-14', NULL, '<p>123</p>'),
(10, 'Cnfnmz 123', 'cnfnmz-123', '<p>123123123</p>', 1, 1, 1, 0, 0, '2021-07-02 23:58:39', '2021-07-03 00:42:13', '2021-07-06', NULL, '<p>312312313</p>'),
(11, 'Гость Статья', 'gost-statya', '123123123123123123ГОСТЬ', 3, 6, 1, 0, 0, '2021-07-04 02:28:12', '2021-07-04 02:34:13', '2021-06-01', NULL, '3123123ГОСТЬ'),
(12, 'Cnfnmz ujcnm', 'cnfnmz-ujcnm', 'sdvdfbdfbdfb', 4, 6, 1, 0, 0, '2021-07-04 02:37:41', '2021-07-04 02:38:54', '2021-07-14', NULL, 'asdasdac'),
(14, 'Новый пост', 'novyy-post', '<h2 class=\"h2\">NEWPOST SUB TITLE</h2>\r\n<p class=\"h3\">Mauris libero velit, condimentum ullamcorper rhoncus at, dictum non sapien. Cras ultricies sapien non cursus sagittis. Pellentesque gravida porttitor ornare. Nullam cursus placerat viverra. Nunc sollicitudin vel turpis vitae tincidunt. Donec at massa ornare, ultricies elit eget, fringilla lorem. Curabitur vel finibus est. Donec elementum vestibulum gravida. Maecenas non leo et dui imperdiet volutpat. Mauris eget dui laoreet, euismod nunc vel, tincidunt diam. Ut imperdiet libero quis sodales placerat. Integer ultricies condimentum porttitor. Suspendisse blandit, mauris eget molestie ultricies, nunc ante faucibus augue, eget sagittis magna nisl nec urna.</p>\r\n<img src=\"https://www.rspectr.com/files/news/google-76517_1280-7ff42dbd35d19605ec7a2802cb63b7e4-ac391ae57dbcec44558d43b3e5d8fa35.png\">\r\n<p>Mauris libero velit, condimentum ullamcorper rhoncus at, dictum non sapien. Cras ultricies sapien non cursus sagittis. Pellentesque gravida porttitor ornare. Nullam cursus placerat viverra. Nunc sollicitudin vel turpis vitae tincidunt. Donec at massa ornare, ultricies elit eget, fringilla lorem. Curabitur vel finibus est. Donec elementum vestibulum gravida. Maecenas non leo et dui imperdiet volutpat. Mauris eget dui laoreet, euismod nunc vel, tincidunt diam. Ut imperdiet libero quis sodales placerat. Integer ultricies condimentum porttitor. Suspendisse blandit, mauris eget molestie ultricies, nunc ante faucibus augue, eget sagittis magna nisl nec urna.</p>', 1, 1, 1, 0, 0, '2021-07-08 23:24:23', '2021-08-17 20:40:54', '2021-07-19', 'hSt1pRQySG.png', '<p>NEWPOSTDESCR</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL),
(2, 3, 2, NULL, NULL),
(3, 4, 2, NULL, NULL),
(4, 9, 3, NULL, NULL),
(5, 10, 3, NULL, NULL),
(6, 10, 4, NULL, NULL),
(7, 10, 5, NULL, NULL),
(8, 11, 2, NULL, NULL),
(9, 11, 3, NULL, NULL),
(10, 12, 2, NULL, NULL),
(11, 12, 3, NULL, NULL),
(12, 12, 4, NULL, NULL),
(13, 13, 2, NULL, NULL),
(14, 13, 3, NULL, NULL),
(15, 13, 6, NULL, NULL),
(16, 14, 2, NULL, NULL),
(17, 14, 3, NULL, NULL),
(18, 14, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Тег1', 'teg1', '2021-06-13 20:55:36', '2021-06-13 20:55:36'),
(2, 'Тег2', 'teg2', '2021-06-13 20:55:42', '2021-06-13 20:55:42'),
(3, 'praesentium', 'praesentium', '2021-06-22 19:46:59', '2021-06-22 19:46:59'),
(4, 'mollitia', 'mollitia', '2021-06-22 19:46:59', '2021-06-22 19:46:59'),
(5, 'occaecati', 'occaecati', '2021-06-22 19:46:59', '2021-06-22 19:46:59'),
(6, 'exercitationem', 'exercitationem', '2021-06-22 19:46:59', '2021-06-22 19:46:59');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `status`, `remember_token`, `created_at`, `updated_at`, `avatar`, `description`) VALUES
(1, 'admin', 'admin@email.com', NULL, '$2y$10$3WiWKFOjoc0UQwgSqfjdReCHxoSOcgJboIX88GxkZwNvuqODujIgm', 1, 0, 'ns27CvFibo7LbKN67K7AdRKd4AFxssJ6QDB615ZnVsRqsfVwS5wpd5LrHnjU', '2021-06-28 21:29:58', '2021-07-01 21:41:37', NULL, 'descriptions123'),
(2, 'name123', 'name3432@email.com', NULL, '$2y$10$psKmp1fqHB8Z.bxYQ.TmrO68MjsFYIS6zG6HlWGQE.65wzQqSBM9W', 0, 0, NULL, '2021-06-10 02:03:02', '2021-06-11 21:42:29', 'n1y44gG9aV.jpeg', NULL),
(3, '123', 'name321@email.com', NULL, '$2y$10$7Kle5jo9x.jNfkf6W/brYO.4FPngZ6uFiOq4KPCwr9zNpXfKoys2i', 0, 0, NULL, '2021-06-10 02:08:51', '2021-06-10 02:08:51', '0gd0xX3DlF.jpeg', NULL),
(4, 'NameReg', 'NameReg@email.com', NULL, '$2y$10$JGQNMDwv0UbuHX3/cq/nqe9khyi4qaMo3MkDCWEvAtdPvmKB2aAWy', 0, 0, NULL, '2021-06-26 21:11:25', '2021-06-26 21:11:26', NULL, NULL),
(5, 'NameReg', 'NameReg321@email.com', NULL, '$2y$10$wezuwiKsptKzUjF9ru/JvuZY1svxHkRyCbm5p6/LkjiThP5YDQGKi', 0, 0, NULL, '2021-06-26 21:11:40', '2021-06-26 21:11:40', NULL, NULL),
(6, '3213', '123@email.ru', NULL, '$2y$10$anChNWjui549EjFBY7wYIOtmBq3bLg80c1ipuDmAD661avFjUiwQi', 0, 0, NULL, '2021-06-27 21:28:30', '2021-06-30 21:15:33', '8dWuMgPyWn.jpeg', NULL),
(7, '323', '321@email.ru', NULL, '$2y$10$93a89U6jyfTQpUdVA/CaHuznznPP2ieqNP3vbNfZxNCb5SLpjDdKW', 0, 0, NULL, '2021-06-27 21:29:44', '2021-06-27 21:29:44', NULL, NULL),
(9, '123', 'name3123123@email.com', NULL, '$2y$10$Tkvc6OEjiSr0ESQi9hUQ8.KzSpCIEerVKToXESPkRBCn5/Z4Wmd2W', 0, 0, NULL, '2021-07-01 21:23:40', '2021-07-01 21:23:41', NULL, NULL),
(10, '3123123', '12123123133@email.ru', NULL, '$2y$10$21GbqT655Xtki/5AOiFYdesKFck1efsymmkRxxazOb2t/XHv3qQLe', 0, 0, NULL, '2021-07-01 21:45:52', '2021-07-01 21:45:53', NULL, '123123123123'),
(11, 'asdasdas', 'asdasdasdasd@emddasil.vb', NULL, '$2y$10$.Pbn7kR0V/qAdB8HqsVxqes8yEEK4O0tBVWDtF8V7QU8eYh6i8Qm2', 0, 0, NULL, '2021-07-08 23:50:31', '2021-07-08 23:50:31', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
