-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "abilities" ------------------------------------
CREATE TABLE `abilities`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "abilities_role" -------------------------------
CREATE TABLE `abilities_role`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`role_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`abilities_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "affiliations" ---------------------------------
CREATE TABLE `affiliations`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `affiliations_name_unique` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------


-- CREATE TABLE "collections" ----------------------------------
CREATE TABLE `collections`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "comments" -------------------------------------
CREATE TABLE `comments`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`post_id` BigInt( 0 ) NOT NULL,
	`body` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------


-- CREATE TABLE "failed_jobs" ----------------------------------
CREATE TABLE `failed_jobs`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`connection` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`queue` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`payload` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`exception` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`failed_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `failed_jobs_uuid_unique` UNIQUE( `uuid` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "files" ----------------------------------------
CREATE TABLE `files`( 
	`id` Int( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`original_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`hash_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`size` Double( 22, 0 ) NOT NULL,
	`file_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`user_id` Int( 0 ) UNSIGNED NOT NULL,
	`deleted_at` Timestamp NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	`uploadable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`uploadable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 65;
-- -------------------------------------------------------------


-- CREATE TABLE "likables" -------------------------------------
CREATE TABLE `likables`( 
	`user_id` Int( 0 ) UNSIGNED NOT NULL,
	`likable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`likable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `user_id`, `likable_id`, `likable_type` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "migrations" -----------------------------------
CREATE TABLE `migrations`( 
	`id` Int( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`migration` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`batch` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 28;
-- -------------------------------------------------------------


-- CREATE TABLE "notifications" --------------------------------
CREATE TABLE `notifications`( 
	`id` Char( 36 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`notifiable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`notifiable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`data` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`read_at` Timestamp NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "password_resets" ------------------------------
CREATE TABLE `password_resets`( 
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "post_tag" -------------------------------------
CREATE TABLE `post_tag`( 
	`post_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`tag_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `post_id`, `tag_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "posts" ----------------------------------------
CREATE TABLE `posts`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) UNSIGNED NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`slug` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`body` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`links` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 115;
-- -------------------------------------------------------------


-- CREATE TABLE "profiles" -------------------------------------
CREATE TABLE `profiles`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`website_url` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`github_url` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`twitter_url` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`user_id` Int( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "role_user" ------------------------------------
CREATE TABLE `role_user`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`user_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`role_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "roles" ----------------------------------------
CREATE TABLE `roles`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "series" ---------------------------------------
CREATE TABLE `series`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "sharables" ------------------------------------
CREATE TABLE `sharables`( 
	`user_id` Int( 0 ) UNSIGNED NOT NULL,
	`sharable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`sharable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `user_id`, `sharable_id`, `sharable_type` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "tags" -----------------------------------------
CREATE TABLE `tags`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`affiliation_id` Int( 0 ) UNSIGNED NULL DEFAULT NULL,
	`email_verified_at` Timestamp NULL DEFAULT NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`experience_points` Int( 0 ) UNSIGNED NOT NULL,
	`remember_token` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `users_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 27;
-- -------------------------------------------------------------


-- CREATE TABLE "videos" ---------------------------------------
CREATE TABLE `videos`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`watchable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`watchable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`url` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- Dump data of "abilities" --------------------------------
BEGIN;

INSERT INTO `abilities`(`id`,`name`,`created_at`,`updated_at`) VALUES 
( '1', 'access_admin', '2021-05-24 10:53:40', '2021-05-24 10:53:40' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "abilities_role" ---------------------------
BEGIN;

INSERT INTO `abilities_role`(`id`,`role_id`,`abilities_id`,`created_at`,`updated_at`) VALUES 
( '1', '1', '1', NULL, NULL );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "affiliations" -----------------------------
BEGIN;

INSERT INTO `affiliations`(`id`,`name`,`created_at`,`updated_at`) VALUES 
( '1', 'Left', '2021-02-18 02:57:50', '2021-02-18 02:57:50' ),
( '2', 'Right', '2021-02-18 02:57:57', '2021-02-18 02:57:57' ),
( '4', 'ipsa', '2021-02-21 07:34:05', '2021-02-21 07:34:05' ),
( '5', 'voluptatem', '2021-03-07 03:34:00', '2021-03-07 03:34:00' ),
( '7', 'recusandae', '2021-03-07 03:36:02', '2021-03-07 03:36:02' ),
( '8', 'veritatis', '2021-03-07 03:36:02', '2021-03-07 03:36:02' ),
( '9', 'molestiae', '2021-03-07 03:38:24', '2021-03-07 03:38:24' ),
( '10', 'sed', '2021-03-07 03:38:24', '2021-03-07 03:38:24' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "collections" ------------------------------
BEGIN;

INSERT INTO `collections`(`id`,`title`,`created_at`,`updated_at`) VALUES 
( '1', 'unde', '2021-02-18 10:14:24', '2021-02-18 10:14:24' ),
( '2', 'dolorem', '2021-02-18 10:14:24', '2021-02-18 10:14:24' ),
( '3', 'et', '2021-02-18 10:14:24', '2021-02-18 10:14:24' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "comments" ---------------------------------
BEGIN;

INSERT INTO `comments`(`id`,`post_id`,`body`,`created_at`,`updated_at`) VALUES 
( '1', '8', 'Ullam atque nemo nesciunt mollitia deserunt aut. Et ipsa et corporis.', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '2', '9', 'Velit explicabo autem praesentium est doloribus. Repellendus et voluptas et tempora delectus sint. Voluptas pariatur est nostrum autem quia laboriosam.', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '3', '10', 'Dolores repellat ut neque officiis atque dolor voluptatibus. Quia nostrum illo alias et. Quo eos sapiente sed exercitationem voluptatem.', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '4', '11', 'Consectetur aut tempora est nobis. Et consequuntur sit deleniti similique voluptas soluta. Ea ut aspernatur suscipit aperiam rerum itaque vitae.', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '5', '12', 'Iure blanditiis quo maxime sunt doloribus corrupti aut sequi. Qui ullam id repudiandae laborum. Molestiae earum corporis itaque reiciendis rerum eaque dolor a.', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '6', '1', 'Modi assumenda eaque ut omnis beatae ut consequatur. Dignissimos libero assumenda laudantium cupiditate quas. Est provident laudantium omnis quam assumenda ea.', '2021-02-18 02:44:17', '2021-02-18 02:44:17' ),
( '7', '1', 'Ipsa earum sed ullam itaque et. Molestiae sequi ratione deleniti voluptate eum et.', '2021-02-18 02:44:17', '2021-02-18 02:44:17' ),
( '8', '1', 'Cumque eveniet id vero tenetur sunt doloremque qui quia. Et est aut dolorem velit quisquam explicabo incidunt. Qui sit vel voluptatum quasi optio nam dolores reiciendis.', '2021-02-18 02:44:17', '2021-02-18 02:44:17' ),
( '9', '1', 'Reiciendis in qui animi ut ut. Ducimus nobis debitis consectetur voluptas voluptas. Modi et perspiciatis eveniet earum harum.', '2021-02-18 02:44:17', '2021-02-18 02:44:17' ),
( '10', '1', 'Quam molestias laudantium nobis reiciendis totam. Adipisci sint sed doloremque molestiae sequi rerum debitis vel. Veniam laboriosam at ipsa.', '2021-02-18 02:44:17', '2021-02-18 02:44:17' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "failed_jobs" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "files" ------------------------------------
BEGIN;

INSERT INTO `files`(`id`,`original_name`,`hash_name`,`size`,`file_type`,`user_id`,`deleted_at`,`created_at`,`updated_at`,`uploadable_type`,`uploadable_id`) VALUES 
( '1', '4CaterpillaEatsTomatoes.jpeg', '4X9y9CXF5BJq6ODwRjYp4sOgoTT1Orpm2EKCCEuu.jpg', '131403', 'jpg', '1', '2021-03-14 10:47:08', '2021-03-10 11:25:25', '2021-03-14 10:47:08', '', '0' ),
( '2', '1Tomatoes.jpeg', 'teQDn7D2UM0F9Us2UxkiI7155nOTsiCplZzT2HLy.jpg', '64419', 'jpg', '1', NULL, '2021-03-10 11:33:18', '2021-03-10 11:33:18', '', '0' ),
( '34', 'TQS_LOGO225.png', 's6zdjvCveejsCxvnaQLlZd3l4wk51JptXAAULB7R.png', '25945', 'png', '1', NULL, '2021-03-13 09:22:00', '2021-03-13 09:22:00', '', '0' ),
( '35', 'SUN_TOKEN_DD.png', '5zxrL7XzmflT1BTVt1t3weNOsr3XxlXMEvI2RVCK.png', '630612', 'png', '1', NULL, '2021-03-13 12:15:28', '2021-03-13 12:15:28', '', '0' ),
( '38', 'Goblins-of-Zarth_WEB_RES_BANNER-2-1024x341.jpg', 'QneIZpftdkDQ4dZA0YzPWngJ489J5pzQPyfjJ6XW.jpg', '120551', 'jpg', '1', NULL, '2021-03-13 12:34:11', '2021-03-13 12:34:11', '', '0' ),
( '39', 'TQS_LOGO225.png', 'zCvmT812OlVWldn93fZGb6G0PLsdwpoLUzJlppLU.png', '25945', 'png', '1', NULL, '2021-03-13 12:36:28', '2021-03-13 12:36:28', '', '0' ),
( '40', 'arcanacon_2020.jpg', '9vaHwAOMsrbZKXIv31D82ryCG9cqJiaYvycDHohs.jpg', '694292', 'jpg', '1', NULL, '2021-03-13 12:40:48', '2021-03-13 12:40:48', '', '0' ),
( '41', 'arcanacon_2020.jpg', 'HXGWCkobYeS2jtDJILbuHRVRbTDzSojGFAkmL5rw.jpg', '694292', 'jpg', '1', NULL, '2021-03-13 12:41:38', '2021-03-13 12:41:38', '', '0' ),
( '42', 'TQS_LOGO225.png', 'F3Qyl17swhdqOosBDkDldZwfDsiO83l4idZOE7Nf.png', '25945', 'png', '1', NULL, '2021-03-13 12:42:51', '2021-03-13 12:42:51', '', '0' ),
( '43', 'chaosium.png', '4MVufmEI8bOXUqcKAOpGMusgq5R9Ih8z7EPhdIEG.png', '26299', 'png', '1', NULL, '2021-03-14 08:08:14', '2021-03-14 08:08:14', '', '0' ),
( '44', 'arcanacon_2020.jpg', 'yMR9c1ainm1T3J3sESOSt4hSt9zXj9S0xe8Bebms.jpg', '694292', 'jpg', '1', NULL, '2021-03-14 09:56:44', '2021-03-14 09:56:44', 'App\\Models\\Post', '67' ),
( '45', 'Goblins-of-Zarth_WEB_RES_BANNER-2-1024x341.jpg', 'Ku1VpH1exLbfDP0B24nsNsjenf0129AtO9WGNNbz.jpg', '120551', 'jpg', '1', NULL, '2021-03-14 09:59:16', '2021-03-14 09:59:16', 'App\\Models\\Post', '67' ),
( '46', 'skidmore_game.jpg', 'oIde0Qa2hWtLt9w9nF6K4DvLX5doMMiS4NMUoVHb.jpg', '812155', 'jpg', '1', NULL, '2021-03-14 10:21:43', '2021-03-14 10:21:43', 'App\\Models\\Post', '1' ),
( '47', 'arcanacon_logo.png', 'o8g2YvydAFt58nvyb2qFaFcge0ddjA3NldvsnC9n.png', '3461', 'png', '1', '2021-03-14 10:51:23', '2021-03-14 10:39:51', '2021-03-14 10:51:23', 'App\\Models\\Tag', '1' ),
( '48', 'arcanacon_logo.png', 'F2EfpOqKTT56DMx5PBmOANVfHILkpRPT6p7Z6aju.png', '3461', 'png', '1', '2021-03-14 10:51:44', '2021-03-14 10:40:08', '2021-03-14 10:51:44', 'App\\Models\\Tag', '1' ),
( '49', 'chaosium.png', 'XqZqj73PZxDhXshFRNo0ZOWEwiGOlTKlq1LN8Nn9.png', '26299', 'png', '1', '2021-03-14 10:53:02', '2021-03-14 10:47:08', '2021-03-14 10:53:02', 'App\\Models\\Tag', '1' ),
( '52', 'arcanacon.png', 'N2tb8nXG4WIROyrUVDwfZ8JXwf6VvngkytNlccO3.png', '4903', 'png', '1', '2021-03-21 02:29:18', '2021-03-14 10:53:02', '2021-03-21 02:29:18', 'App\\Models\\Tag', '1' ),
( '53', 'chaosium.png', 'y9PpdWcvyAnpZHBqDIm4unU4tKlBCHe3LcD6BF3M.png', '26299', 'png', '1', NULL, '2021-03-16 10:50:21', '2021-03-16 10:50:21', 'App\\Models\\Post', '1' ),
( '54', 'chaosium.png', 'TJfa7OmFtXq0HprVycVQBH416iOmL9sWlkKbsdqd.png', '26299', 'png', '1', NULL, '2021-03-16 10:55:29', '2021-03-16 10:55:29', 'App\\Models\\Post', '1' ),
( '55', 'link-solid.svg', 'jCSGZ7fKRsNddBnemMuYIyPmELFJH5fSx78Cqsdc.svg', '1470', 'svg', '1', NULL, '2021-03-21 02:29:18', '2021-03-21 02:29:18', 'App\\Models\\Tag', '1' ),
( '56', 'link-solid.png', 'gIb7cw3Bg2Hq3kfK9pIiDyTwlNOiu0QgFGKX7iGF.png', '1050873', 'png', '1', NULL, '2021-03-21 02:51:45', '2021-03-21 02:51:45', 'App\\Models\\Post', '81' ),
( '64', 'dog.jpg', 'yNugE3QF2gQWnzNV7jwJnrKzRyXL6v0nDRBONbV2.jpg', '212377', 'jpg', '1', NULL, '2021-05-24 11:30:34', '2021-05-24 11:30:34', '', '0' ),
( '65', 'file-code.png', 'Bh7kSVwBoJU2M1ESSmgKJuG5SVSXuvyxte1D7d35.png', '788300', 'png', '1', NULL, '2021-07-20 10:23:11', '2021-07-20 10:23:11', 'App\\Models\\Tag', '8' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "likables" ---------------------------------
BEGIN;

INSERT INTO `likables`(`user_id`,`likable_type`,`likable_id`,`created_at`,`updated_at`) VALUES 
( '1', 'App\\Models\\Comment', '4', '2021-02-20 10:00:05', '2021-02-20 10:00:05' ),
( '2', 'App\\Models\\Comment', '1', '2021-02-20 08:25:16', '2021-02-20 08:25:16' ),
( '2', 'App\\Models\\Comment', '2', '2021-02-20 09:24:10', '2021-02-20 09:24:10' ),
( '2', 'App\\Models\\Post', '12', '2021-02-20 10:17:34', '2021-02-20 10:17:34' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "migrations" -------------------------------
BEGIN;

INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES 
( '1', '2014_10_12_000000_create_users_table', '1' ),
( '2', '2014_10_12_100000_create_password_resets_table', '1' ),
( '3', '2019_08_19_000000_create_failed_jobs_table', '1' ),
( '4', '2021_02_17_074259_create_profiles_table', '1' ),
( '5', '2021_02_17_105946_create_posts_table', '1' ),
( '13', '2021_02_18_000536_create_comments_table', '2' ),
( '14', '2021_02_18_002346_create_tags_table', '2' ),
( '16', '2021_02_18_004607_create_post_tag_table', '3' ),
( '17', '2021_02_18_025107_create_affiliations_table', '4' ),
( '18', '2021_02_18_025308_update_users_table_add_affiliation', '4' ),
( '19', '2021_02_18_095641_create_videos_table', '5' ),
( '20', '2021_02_18_100024_create_series_table', '5' ),
( '21', '2021_02_18_100413_create_collections_table', '5' ),
( '22', '2021_02_20_070831_create_likables_table', '6' ),
( '25', '2021_02_21_082335_create_sharables_table', '7' ),
( '26', '2021_03_14_074304_update_tags_add_description', '8' ),
( '27', '2021_03_14_075629_update_files_include_morphs_remove_post_id', '9' ),
( '28', '2021_04_17_015115_create_notifications_table', '10' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "notifications" ----------------------------
BEGIN;

INSERT INTO `notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) VALUES 
( '1364af62-cd77-4aa0-ae89-2201b93385a1', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-10-19 10:11:14', '2021-10-19 10:11:14' ),
( '13b6e70b-200c-415e-add7-e00a4d5db09d', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-07-20 10:41:13', '2021-07-20 10:41:13' ),
( '281385a4-d4d7-475d-ab25-7e0dec7d6322', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-10-20 06:52:15', '2021-10-20 06:52:15' ),
( '4ee56bb9-b3ba-4a58-a62c-8d4e182c7c83', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-04-17 02:24:38', '2021-04-17 02:24:38' ),
( '5133a886-9bb0-4abf-8adc-6ee6654fb07d', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-05-24 10:44:47', '2021-05-24 10:44:47' ),
( '7e20d88e-8278-437e-82e6-58351a1feced', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-04-17 02:03:08', '2021-04-17 02:03:08' ),
( '81e860e2-c31c-4ec5-bc3a-bcd04325ba5d', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-10-20 06:53:32', '2021-10-20 06:53:32' ),
( 'bb751468-9d41-49f5-8feb-07af1af9a05b', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-07-20 10:27:02', '2021-07-20 10:27:02' ),
( 'ca46a759-c991-4af7-bfc0-d1e5077d1ee9', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-04-17 02:04:39', '2021-04-17 02:04:39' ),
( 'cb8ba1d8-8e4c-4421-8590-6a7658ba2e38', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-10-19 10:12:46', '2021-10-19 10:12:46' ),
( 'cc9f6bbd-344e-4479-b4bc-eacc4d2b03f1', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-07-20 10:31:56', '2021-07-20 10:31:56' ),
( 'd10398c9-2a9b-4d07-86be-d809f067daa3', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-05-24 10:48:04', '2021-05-24 10:48:04' ),
( 'decb18af-0091-4697-917a-453a7cb77c1e', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-04-17 02:11:30', '2021-04-17 02:11:30' ),
( 'e08bbc26-df1c-4acb-a785-c91bfec0ac3a', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-10-20 06:52:35', '2021-10-20 06:52:35' ),
( 'e43f3708-83df-4211-8442-ebafd8ec42c1', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-05-24 10:46:04', '2021-05-24 10:46:04' ),
( 'e75afdde-a256-4701-bf92-88ff4b55ca4b', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-05-24 10:46:57', '2021-05-24 10:46:57' ),
( 'fc6df1fd-0469-4796-874e-6a3b8c6bfb19', 'App\\Notifications\\PostContentAdded', 'App\\Models\\User', '1', '[]', NULL, '2021-04-17 02:12:34', '2021-04-17 02:12:34' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "password_resets" --------------------------
-- ---------------------------------------------------------


-- Dump data of "post_tag" ---------------------------------
BEGIN;

INSERT INTO `post_tag`(`post_id`,`tag_id`,`created_at`,`updated_at`) VALUES 
( '81', '1', '2021-03-17 10:26:04', '2021-03-17 10:26:04' ),
( '85', '1', '2021-03-17 10:46:02', '2021-03-17 10:46:02' ),
( '87', '1', '2021-03-21 06:48:29', '2021-03-21 06:48:29' ),
( '88', '1', '2021-03-21 06:51:59', '2021-03-21 06:51:59' ),
( '89', '1', '2021-03-21 06:58:12', '2021-03-21 06:58:12' ),
( '90', '1', '2021-03-21 07:05:41', '2021-03-21 07:05:41' ),
( '91', '9', '2021-04-13 22:02:10', '2021-04-13 22:02:10' ),
( '92', '9', '2021-04-13 22:05:56', '2021-04-13 22:05:56' ),
( '93', '9', '2021-04-14 10:15:42', '2021-04-14 10:15:42' ),
( '94', '9', '2021-04-14 10:19:45', '2021-04-14 10:19:45' ),
( '107', '7', '2021-05-24 10:38:47', '2021-05-24 10:38:47' ),
( '108', '7', '2021-05-24 10:45:49', '2021-05-24 10:45:49' ),
( '109', '7', '2021-05-24 10:46:42', '2021-05-24 10:46:42' ),
( '110', '7', '2021-05-24 10:47:49', '2021-05-24 10:47:49' ),
( '111', '8', '2021-07-20 10:24:04', '2021-07-20 10:24:04' ),
( '112', '8', '2021-07-20 10:27:53', '2021-07-20 10:27:53' ),
( '113', '8', '2021-07-20 10:36:38', '2021-07-20 10:36:38' ),
( '114', '10', '2021-10-19 10:08:50', '2021-10-19 10:08:50' ),
( '115', '10', '2021-10-19 10:16:17', '2021-10-19 10:16:17' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "posts" ------------------------------------
BEGIN;

INSERT INTO `posts`(`id`,`user_id`,`title`,`slug`,`body`,`links`,`created_at`,`updated_at`) VALUES 
( '81', '1', 'One To One', 'one-to-one', '{"time":1616321964555,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;For this relationship, we have two tables which are related through a foriegn key. In this code base we have 2 entities User and Profile. A Profile can only have one User and vice versa. &lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;The Profile table has a reference to the User table through a foriegn key &lt;code&gt;user_id&lt;/code&gt;&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;Bearing this in mind, the Profile model then belongsTo() a User. We can set up this connection with:&lt;/p&gt;&lt;div&gt;&lt;code&gt; //Profile Model&lt;br&gt;public function user(){&lt;br&gt;        return $this-&gt;belongsTo(Profile::class);&lt;br&gt;    }&lt;/code&gt;&lt;/div&gt;&lt;p&gt;A User hasOne() Profile which it connects to through which effectively is querying the Profile table with a  &lt;code&gt;user_id&lt;/code&gt; that is equals the User id column.&lt;/p&gt; <br>&lt;code&gt;//Profile modelcpublic function profile(){&lt;br&gt;        return $this-&gt;hasOne(Profile::class);&lt;br&gt;    }&lt;/code&gt;&nbsp;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laracasts2","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#one-to-one"}]}', '2021-03-17 10:26:04', '2021-03-21 10:19:27' ),
( '85', '1', 'One To Many', 'one-to-many', '{"time":1616309182553,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;In this code base we have various one to many relations. For example, we have a User which can have many Posts. Another example is a Post can have many Comments. &lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;On the posts table, we have a reference to a user through &lt;code&gt;user_id&lt;/code&gt;. With this in mind we can use hasOne() on the Post model for a User and a User hasMany() Posts on the User model.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"    &lt;code&gt;//Post model&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    public function user(){&lt;br&gt;"}},{"type":"paragraph","data":{"text":"            return $this-&gt;hasOne(User::class);&lt;br&gt;"}},{"type":"paragraph","data":{"text":"        }&lt;/code&gt;&lt;br&gt;&lt;br&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"    &lt;code&gt;//User model&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    public function posts(){&lt;br&gt;"}},{"type":"paragraph","data":{"text":"            return $this-&gt;hasMany(Post::class);&lt;br&gt;"}},{"type":"paragraph","data":{"text":"        }&lt;/code&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laravel Documentation","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#one-to-many"}]}', '2021-03-17 10:36:15', '2021-03-21 06:46:28' ),
( '87', '1', 'Many To Many', 'many-to-many', '{"time":1616309414112,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;In this code base we have Post which can have many Tags and we have Tags which can have many Posts. Neither of these tables relates to the other through a FKey.&lt;/p&gt;&lt;p&gt;For this relationship to work, a pivot table is required. In this case we have made a posts_tags table which follows the naming convention for weak entities. Usually this table includes a composite primary key of the entities it relates to. This is so there are no duplicate combinations for Posts/Tags. It also includes FKeys\\\\\'s for each table respectively. See the migration for the posts_tags table below:&lt;/p&gt;&lt;code&gt;$table-&gt;primary([\\\\\'post_id\\\\\', \\\\\'tag_id\\\\\']);&lt;br&gt;$table-&gt;foreignId(\\\\\'post_id\\\\\')-&gt;constrained()-&gt;onDelete(\\\\\'cascade\\\\\');&lt;br&gt;$table-&gt;foreignId(\\\\\'tag_id\\\\\')-&gt;constrained()-&gt;onDelete(\\\\\'cascade\\\\\');&lt;br&gt;&lt;br&gt;&lt;/code&gt;&lt;p&gt;The Post and Tag models each have a belongsTo() relationship which connects it to the other Model.&lt;/p&gt;&lt;div&gt;&lt;code&gt;//Post model&lt;br&gt;    public function tags(){&lt;br&gt;        return $this-&gt;belongsToMany(Tag::class)-&gt;withTimestamps();&lt;br&gt;        }&lt;/code&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;code&gt;//Tag model&lt;br&gt;    public function posts(){&lt;br&gt;        return $this-&gt;belongsToMany(Post::class)-&gt;withTimestamps();&lt;br&gt;        }&lt;/code&gt;&lt;br&gt;&lt;/div&gt;&lt;p&gt;Note: withTimestamps() will save timestamp details to the pivot table.&lt;/p&gt;<br>&lt;p&gt;We can test this connection be attaching the oposite model using tinker. The following will find a post with an id of 12 and add tags with an id of 1, 2 and 3. This will be saving in the posts_tags table:&lt;/p&gt;&lt;code&gt; App\\\\Models\\\\Post::find(12)-&gt;tags()-&gt;attach([1, 2, 3]);&lt;/code&gt;&lt;p&gt;Note: The inverse is also an option where we can detatch and thereby remove items from the posts_tags table.&lt;/p&gt;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laravel Documentation","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#many-to-many"},{"name":"Laracasts","url":"https:\\/\\/laracasts.com\\/series\\/eloquent-relationships\\/episodes\\/3"}]}', '2021-03-21 06:48:29', '2021-03-21 06:51:17' ),
( '88', '1', 'Morph To Morph Many', 'morph-to-morph-many', '{"time":1616309532680,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;This type of Polymorphic relation allows a model to have a relationship with many models.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;In this project we have Videos which morphs to either a Series or a Collection model or any other Model we choose.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;In order to set Videos to a morphMany() relationship we need to add &lt;code&gt;morphs(keyword)&lt;/code&gt; to the Video migration.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"&lt;code&gt;"}},{"type":"paragraph","data":{"text":"$table-&gt;morphs(\\\\\'watchable\\\\\');  &lt;br&gt;"}},{"type":"paragraph","data":{"text":"$table-&gt;string(\\\\\'title\\\\\');&lt;br&gt;"}},{"type":"paragraph","data":{"text":"...;&lt;/code&gt;&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;Note: the morphs() method creates 2 columns using the string passed in as a prefix. In this case watchable_type (which will be a reference to the model which it morphs to eg App\\\\Models\\\\Post) and watchable_id (which is the id of the Post Model we want to relate a Video to). See screenshot of the videos table below:&lt;/p&gt;"}},{"type":"paragraph","data":{"text":" &lt;img src=\\"/images/videos_morphto_table.png\\" /&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;In the Video model, we need to tell Laravel that it is a morphTo() relationship type. &lt;b&gt;Note:&lt;/b&gt; The method name needs to be the same as the keyword stored in the database for the morphs columns eg (wathchable)."}},{"type":"paragraph","data":{"text":"&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"    &lt;code&gt;"}},{"type":"paragraph","data":{"text":"    public function watchable(){&lt;br&gt;"}},{"type":"paragraph","data":{"text":"        return $this-&gt;morphTo();&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    }&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    &lt;/code&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;&lt;b&gt;Note:&lt;/b&gt; We can use a different method name but the &lt;code&gt;morphs(keyword)&lt;/code&gt; name needs to be included in the morphTo() method.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"    &lt;code&gt;public function views(){&lt;br&gt;"}},{"type":"paragraph","data":{"text":"        return $this-&gt;morphTo(\\\\\'watchable\\\\\');&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    }&lt;/code&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;Then on any Model we want to have the polymorphic relation with Videos, we add the morphMany() method.&lt;b&gt;Note:&lt;/b&gt; Rembember to add the name for the &lt;code&gt;morphs(keyword)&lt;/code&gt;.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;"}},{"type":"paragraph","data":{"text":"    &lt;code&gt;"}},{"type":"paragraph","data":{"text":"        public function videos(){&lt;br&gt;"}},{"type":"paragraph","data":{"text":"            return $this-&gt;morphMany(Video::class, \\\\\'watchable\\\\\');&lt;br&gt;"}},{"type":"paragraph","data":{"text":"        }&lt;br&gt;"}},{"type":"paragraph","data":{"text":"    &lt;/code&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;In summary this type of polymorphic relationship allows a Model of any type to have a Video using the morph() keyword \\"watchable\\". See an example of how a Post entity can be attached to and creates a Video model below in tinker:&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;code&gt;"}},{"type":"paragraph","data":{"text":"$p3 = App\\\\Models\\\\Post::find(3);&lt;br&gt;"}},{"type":"paragraph","data":{"text":"$p3-&gt;videos()-&gt;create([ \\\\\'title\\\\\' =&gt; \\\\\'Test title\\\\\', \\\\\'description\\\\\' =&gt; \\\\\'Test desc\\\\\', \\\\\'url\\\\\' =&gt; \\\\\'test.com\\\\\']);&lt;br&gt;"}},{"type":"paragraph","data":{"text":"&lt;/code&gt;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laravel Documentation","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#one-to-many-polymorphic-relations"},{"name":"Laracasts","url":"https:\\/\\/laracasts.com\\/series\\/eloquent-relationships\\/episodes\\/5"}]}', '2021-03-21 06:51:59', '2021-03-21 06:52:41' ),
( '89', '1', 'Has Many Through', 'has-many-through', '{"time":1616309907216,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;In this code base we have an User entity which is connected to an Affiliation through a FKey &lt;code&gt;affiliation_id&lt;/code&gt;.&lt;/p&gt;<br>&lt;p&gt;If a visitor wants to view content by an author/user who has a certain Affiliation we can use the hasManyThrough() relationship for this.&lt;/p&gt;<br>&lt;p&gt;We use the hasManyThrough on the Affiliation entity to get all of the Posts a User with a specific Affiliation has.&lt;/p&gt;&lt;div&gt;&lt;code&gt;//Affiliation Model&lt;br&gt;//If a User has an affiliation, get thier Posts. &lt;br&gt;    public function posts(){&lt;br&gt;        //return $this-&gt;hasManyThrough($related, $through, $firstKey, $secondKey); &lt;br&gt;        return $this-&gt;hasManyThrough(Post::class, User::class, \\\\\'affiliation_id\\\\\', \\\\\'user_id\\\\\'); &lt;br&gt;    } &lt;/code&gt;&lt;/div&gt;<br>&lt;p&gt;Note: There is no &lt;code&gt;post_id&lt;/code&gt; column on Affiliates, but there is on the User model. We can connect the tables through the Users table and get their Posts which equates to doing an inner join.&lt;/p&gt;&lt;p&gt;We can test this inner join using tinker:&lt;/p&gt;&lt;code&gt;App\\\\Models\\\\Affiliation::find(1)-&gt;posts;&lt;/code&gt;&lt;p&gt;By using the &lt;code&gt;DB::enableQueryLog();&lt;/code&gt; we can view the SQL output of the above tinker using &lt;code&gt;DB:getQueryLog();&lt;/code&gt;. This will output a query like so:&lt;/p&gt;<br>&lt;code&gt;\\"query\\" =&gt; \\"select `posts`.*, `users`.`affiliation_id` as `laravel_through_key` from `posts` inner join `users` on `users`.`id` = `posts`.`user_id` where `users`.`affiliation_id` = 1\\",&lt;/code&gt;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laravel Documentation","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#has-many-through"},{"name":"Laracasts","url":"https:\\/\\/laracasts.com\\/series\\/eloquent-relationships\\/episodes\\/4"}]}', '2021-03-21 06:58:12', '2021-03-21 06:58:56' ),
( '90', '1', 'Morph Many to Many', 'morph-many-to-many', '{"time":1616322435188,"blocks":[{"type":"paragraph","data":{"text":"&lt;p&gt;This type of relationship allows a Polymorphic Model to have any other Model we define. The inverse of the MorphTo() relationship.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;In this project we have Likables Model which can have Posts, Comments, Affiliations or any Model we want to be Likable.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;To set this up we need a likables pivot table which uses the morhps() method to set the keyword, like in the morph-to-morph-to-many example. A user creates a like so that is set as part of the PKey and is set as a column as well.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;&lt;code&gt;$table-&gt;primary([\\\\\'user_id\\\\\', \\\\\'likable_id\\\\\', \\\\\'likable_type\\\\\']);&lt;br&gt;$table-&gt;unsignedInteger(\\\\\'user_id\\\\\');&lt;br&gt;$table-&gt;morphs(\\\\\'likable\\\\\');&lt;br&gt;&lt;/code&gt;&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"<br>&lt;p&gt;At this point we can connect any model we want to have a Likeable option. Because this code will need to be added to any Model, we should created a trait so it remains DRY.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;div&gt;&lt;code&gt;trait Likables { &lt;br&gt;    //Morph to Many&lt;br&gt;    public function like($user = null){&lt;br&gt;        $user = $user ?: auth()-&gt;user();&lt;br&gt;        //this will set the user_id and the Model reference to the likeables table&lt;br&gt;        return $this-&gt;likes()-&gt;attach($user);&lt;br&gt;    }&lt;br&gt;&lt;br&gt;<br>    public function likes(){&lt;br&gt;        //$this-&gt;morphToMany($related, $name, $table, $fkeyPivotKey);&lt;br&gt;        return $this-&gt;morphToMany(User::class, \\\\\'likable\\\\\')-&gt;withTimestamps();&lt;br&gt;    }&lt;br&gt;}&lt;/code&gt;&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;Then we can include this trait in any model which we want to have a likeable option.&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;We can test this out with a Comments model in tinker:&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;code&gt;App\\\\Models\\\\Comment::find(4)-&gt;like(App\\\\Models\\\\User::first());&lt;/code&gt;"}},{"type":"paragraph","data":{"text":"&lt;p&gt;This will create a new database record in the Likeables table which points to the Comments table. See screenshot below:&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;img src=\\"/images/morph_to_many_likables.png\\" /&gt;<br>&lt;p&gt;We can gather all the liked Comments or any other Model from a User model with a morphedByMany() method like the following:&lt;/p&gt;"}},{"type":"paragraph","data":{"text":"&lt;code&gt;    public function likedComments(){&lt;br&gt;         return $this-&gt;morphedByMany(Comment::class, \\\\\'likable\\\\\');&lt;br&gt;    }&lt;br&gt;<br>&lt;/code&gt;"}}],"version":"2.19.1"}', '{"links":[{"name":"Laravel Documentation","url":"https:\\/\\/laravel.com\\/docs\\/8.x\\/eloquent-relationships#many-to-many-polymorphic-relations"},{"name":"Laracasts","url":"https:\\/\\/laracasts.com\\/series\\/eloquent-relationships\\/episodes\\/6"}]}', '2021-03-21 07:05:41', '2021-03-21 10:27:20' ),
( '91', '1', 'Setup mail setting in .env', 'set-up-mail-settings', '{"time":1618566247506,"blocks":[{"type":"paragraph","data":{"text":"Make sure in the .env we have the following:"}},{"type":"code","data":{"code":"MAIL_MAILER=smtp\\n\\nMAIL_HOST=smtp.mailtrap.io\\n\\nMAIL_PORT=2525\\n\\nMAIL_USERNAME=e5cc977ef4e623\\n\\nMAIL_PASSWORD=9bcabceb27506c\\n\\nMAIL_ENCRYPTION=null\\n\\nMAIL_FROM_ADDRESS=”${APP_NAME}@gmail.com”\\n\\nMAIL_FROM_NAME=\\"Test user\\""}},{"type":"code","data":{"code":""}},{"type":"paragraph","data":{"text":"Setup info <a href=\\"https://medium.com/@christianjombo/setting-up-mailtrap-for-laravel-development-313133bb800c\\">here</a>."}},{"type":"paragraph","data":{"text":"If the environment is using Laravel sail or Laradock, use the following settings in the link from Dev.io.<br>"}},{"type":"paragraph","data":{"text":"We can preview sent mail templates with mailtrap.io"}},{"type":"paragraph","data":{"text":"<br>"}}],"version":"2.19.1"}', '{"links":[{"name":"Medium","url":"https:\\/\\/medium.com\\/@christianjombo\\/setting-up-mailtrap-for-laravel-development-313133bb800c"},{"name":"Dev.io","url":"https:\\/\\/dev.to\\/dendihandian\\/mailhog-in-laradock-1ej6"}]}', '2021-04-13 22:02:09', '2021-04-16 09:44:23' ),
( '92', '1', 'Mail classes', 'mail-classes', '{"time":1618351576380,"blocks":[{"type":"paragraph","data":{"text":"If we want to send mail to a user when a certain action is taken we can set up a mailable class which comes with boilerplate code for convenience."}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">php artisan make:mail ProjectCreated -m \\"mail.new-project\\"</code>"}},{"type":"paragraph","data":{"text":"m&nbsp; = markdown flag for the mailable, the parameters added in the inverted commas is the view template directory location and filename eg<code class=\\"inline-code\\"> mail/new-project.blade.php</code>"}},{"type":"paragraph","data":{"text":"We can fire off an email in our controller by importing the mail class we just registered:"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">use App\\\\Mail\\\\ProjectCreated;...\\\\Mail::to(EMAIL ADDRESS)-&gt;send(&nbsp;&nbsp;&nbsp; new ProjectCreated($project))</code>"}},{"type":"paragraph","data":{"text":"We can set up a constructor in the ProjectCreated class to accept details about a project. This can then be passed through to the template (mail.new-project) as those values are available from that class."}}],"version":"2.20.1"}', NULL, '2021-04-13 22:05:56', '2021-04-13 22:06:23' ),
( '93', '1', 'Notifications', 'notifications', '{"time":1618395401834,"blocks":[{"type":"paragraph","data":{"text":"Notifications are used to send messages to users when certain actions are triggered. According to the Laravel Docs: <i>Notifications should be short, informational messages that notify users of something that occurred in your application.</i>"}},{"type":"paragraph","data":{"text":"These could inform users to confirm their email, change their password, when payment has failed, trial subscriptions have ended etc."}},{"type":"paragraph","data":{"text":"They don\'t necessarily need to be triggered by user interactions like form submission."}},{"type":"paragraph","data":{"text":"We can also choose different notification methods instead of just email which is only supported with Mailables. Notifications can be sent via sms, email, and we can store DB entries as well.&nbsp;&nbsp;"}},{"type":"paragraph","data":{"text":"A list of the options can be seen <a href=\\"https://laravel.com/docs/7.x/notifications\\">here</a>."}},{"type":"paragraph","data":{"text":"To create a notification run:"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">php artisan make:notification SubscriptionRenewalFailed</code>"}},{"type":"paragraph","data":{"text":"The class generated has a method called via which provides an array of contact options. The default being ‘mail’. A toMail method&nbsp; is used to prepare the sending of mail. We can create other methods depending on the channel we wish to send a notification."}},{"type":"paragraph","data":{"text":"For each of our models that we want to have notifications attached to, the use Notifiable class is included. EG"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">class User extends Authenticatable<br>{<br>&nbsp;&nbsp; use Notifiable;</code>"}}],"version":"2.20.1"}', NULL, '2021-04-14 10:15:42', '2021-04-14 10:16:48' ),
( '94', '1', 'Customizing Notifications / Mailables', 'customizing-notifications-mailables', '{"time":1618625543153,"blocks":[{"type":"paragraph","data":{"text":"To include content in the notification, we have various options which are set in the Illuminate/Notifications/Messages/SimpleMessage.php class that can be used to create a custom message:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">return (new MailMessage)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>-&gt;subject(\'Your subscription Renewal has failed\')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>-&gt;greeting(\'G\\\\\'Day Person,\') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>-&gt;line(\'We\\\\\'ve noticed your subscription is out of date for the following reason.\')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;error()&nbsp;&nbsp;&nbsp; //changes the color of the action <br> -&gt;action(\\"Your bank card expired\\", url(\'/\'))<br>-&gt;line(\'Please rectify this issue to use our application...\')<br>-&gt;salutation(\'Have a nice day.\');</code>"}},{"type":"paragraph","data":{"text":"Sending notifications with data"}},{"type":"paragraph","data":{"text":"To store notifications, we can add another item to the via array ‘database’, then create the associated table and migrate it using:"}},{"type":"paragraph","data":{"text":"Php artisan notifications:table"}},{"type":"paragraph","data":{"text":"Now when we send a notification, a database record will be stored along with the email with data we add in the toDatabase method. More info <a href=\\"https://laravel.com/docs/7.x/notifications#database-notifications\\">here</a>."}},{"type":"paragraph","data":{"text":"<a href=\\"https://medium.com/@christianjombo/customizing-laravels-default-notification-email-template-adding-a-logo-and-changing-ff6f107dd640\\">Modifying the mail template</a>"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">php artisan vendor:publish --tag=laravel-notifications</code>"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">php artisan vendor:publish --tag=laravel-mail</code>"}},{"type":"paragraph","data":{"text":"Running this command will expose the email template structure in the views/vendor dir including the css."}}],"version":"2.19.1"}', NULL, '2021-04-14 10:19:45', '2021-04-17 02:12:34' ),
( '107', '1', 'Setup Roles / Abilities', 'setup-roles-abilities', '{"time":1621853064452,"blocks":[{"type":"paragraph","data":{"text":"Models"}},{"type":"paragraph","data":{"text":"We create 2 models Role and Ability both with $fillable name and label columns."}},{"type":"paragraph","data":{"text":"There are 4 tables which need to be created to assign users to a role with certain specific abilities:"}},{"type":"list","data":{"style":"ordered","items":["Roles","Abilities","Ability_role (pivot)","Role_user (pivot)"]}},{"type":"paragraph","data":{"text":"Roles and Abilities has a name and nullable label columns."}},{"type":"paragraph","data":{"text":"Ability_role and Role_user are weak entities or pivot tables which reference the above respective tables and the user table is used only in the role_user table.&nbsp;"}},{"type":"paragraph","data":{"text":"Ability_role has 2 fk’s role_id and ability_id which reference their respective tables"}},{"type":"paragraph","data":{"text":"Role_user also has 2fk’s which references role and the user tables."}}],"version":"2.19.1"}', '{"links":[{"name":"Laracasts","url":"https:\\/\\/laracasts.com\\/series\\/laravel-6-from-scratch\\/episodes\\/54?autoplay=true"}]}', '2021-05-24 10:38:47', '2021-05-24 10:44:43' ),
( '108', '1', 'Setup Eloquent Relationships for Roles / Abilities', 'setup-eloquent-roles-abilities', '{"time":1621853158008,"blocks":[{"type":"paragraph","data":{"text":"The Role model has a belongsToMany abilities() method.&nbsp;"}},{"type":"paragraph","data":{"text":"It also has and allowTo($ability) method which takes an $ability object:"}},{"type":"paragraph","data":{"text":"public function allowTo($ability){"}},{"type":"paragraph","data":{"text":"$this-&gt;abilities()-&gt;sync($ability, false);"}},{"type":"paragraph","data":{"text":"}"}},{"type":"paragraph","data":{"text":"The Ability model has a belongsToMany role() method."}},{"type":"paragraph","data":{"text":"The Users model has a belongsToMany roles() method. This model also has 2 other methods for this relationship.&nbsp;"}},{"type":"paragraph","data":{"text":"The assignRole($role) method:"}},{"type":"paragraph","data":{"text":"//if there was an assignment, replace all pivot table values using sync method"}},{"type":"paragraph","data":{"text":"$this-&gt;roles()-&gt;sync($role, false);"}},{"type":"paragraph","data":{"text":"And the abilities() method:"}},{"type":"paragraph","data":{"text":"return $this-&gt;roles-&gt;map-&gt;abilities-&gt;flatten()-&gt;pluck(\'name\')-&gt;unique();"}}],"version":"2.19.1"}', NULL, '2021-05-24 10:45:49', '2021-05-24 10:45:59' ),
( '109', '1', 'Tinker the ability to add a Role and assign a Role to a User', 'setup-tinker-roles-abilities', '{"time":1621853211765,"blocks":[{"type":"paragraph","data":{"text":"We can assign various roles and abilities to individual user model instances."}},{"type":"paragraph","data":{"text":"$user1 = User::find(1);"}},{"type":"paragraph","data":{"text":"//admin role who can access admin"}},{"type":"paragraph","data":{"text":"$admin = App\\\\Role::firstOrCreate([\'name\' =&gt; \'admin\']);"}},{"type":"paragraph","data":{"text":"$access_admin =App\\\\Ability::firstOrCreate([\'name\' =&gt; \'access_admin\']);"}},{"type":"paragraph","data":{"text":"$admin-&gt;allowTo($access_admin)"}},{"type":"paragraph","data":{"text":"$user1-&gt;assignRole($admin);"}},{"type":"paragraph","data":{"text":"//moderator role who can access articles"}},{"type":"paragraph","data":{"text":"$moderator = App\\\\Role::firstOrCreate([\'name\' =&gt; ‘moderator’]);"}},{"type":"paragraph","data":{"text":"$access_articles =App\\\\Ability::firstOrCreate([\'name\' =&gt; \'access_articles\']);"}},{"type":"paragraph","data":{"text":"$moderator&gt;allowTo($access_articles)"}},{"type":"paragraph","data":{"text":"$user1-&gt;assignRole($moderator);"}},{"type":"paragraph","data":{"text":"<br><br>Assign role by name instead of object<br>"}},{"type":"paragraph","data":{"text":"In the user model we update the assignRole() method to check for string values with the request:<br>if(is_string($role)){"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;$role = Role::whereName($role)-&gt;firstOrFail();"}},{"type":"paragraph","data":{"text":"}"}}],"version":"2.19.1"}', NULL, '2021-05-24 10:46:42', '2021-05-24 10:46:53' ),
( '110', '1', 'AuthServiceProvider, @can and protected setup', 'setup-authserviceprovider-@can', '{"time":1621853277440,"blocks":[{"type":"paragraph","data":{"text":"Within the AuthServiceProvider class (which controls if a user is authorised) we can add a hook to fire before authentication runs to check which user has specific abilities(). The following is added within the boot() method:"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gate::before( function($user, $ability){"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//user is authenticate at this stage"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//check the user ability and return result of true or false"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ($user-&gt;abilities()-&gt;contains($ability)) {"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return true;"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});"}},{"type":"paragraph","data":{"text":"Now we can add the @can() conditional in our blades to show and hide access to users eg:&nbsp;"}},{"type":"paragraph","data":{"text":"@can(access_admin)"}},{"type":"paragraph","data":{"text":"&lt;div class=\\"top-left links\\"&gt;"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;&lt;a href=\\"/admin\\"&gt;Edit app&lt;/a&gt;"}},{"type":"paragraph","data":{"text":"&lt;/div&gt;"}},{"type":"paragraph","data":{"text":"@endcan"}},{"type":"paragraph","data":{"text":"We can then add middleware to the routes we want to protect with the specific ability:"}},{"type":"paragraph","data":{"text":"Route::get(\'/admin\', function () {"}},{"type":"paragraph","data":{"text":"&nbsp;&nbsp;&nbsp;return Admin;"}},{"type":"paragraph","data":{"text":"})-&gt;middleware(\'can:access_admin\');"}}],"version":"2.19.1"}', NULL, '2021-05-24 10:47:49', '2021-05-24 10:47:59' ),
( '111', '1', 'Core Concepts', 'core-concepts', '{"time":1626776765487,"blocks":[{"type":"paragraph","data":{"text":"To demonstrate how a Service Container works, we can create a class Container which accepts a bind method to add other classes to it. This will allow us to retrieve those classes using a resolve method. For the purposes of this demo we have 2 classes; a Container and an Example class:"}},{"type":"code","data":{"code":" class Container\\n{\\n   public $bindings;   \\n   public function bind($key, $value)\\n   {\\n       $this->bindings[$key] = $value;\\n   }\\n   public function resolve($key)\\n   {\\n       if(key_exists($key, $this->bindings)){\\n           return call_user_func($this->bindings[$key]); // allows us to call methods on the bound class\\n       }\\n       return \\"The $key is not found...\\";\\n   }\\n}\\n \\nclass Example {\\n   public function go()\\n   {\\n       return \\"Go Go Go!\\";\\n   }\\n}\\n"}},{"type":"paragraph","data":{"text":"For testing this out we can create a route to new up a Container and bind the example class to it."}},{"type":"code","data":{"code":"Route::get(\'/container\', function(){\\n   $container = new \\\\App\\\\Container();\\n   $container->bind(\'example\', function(){\\n       return new \\\\App\\\\Example();\\n   });\\n   $example = $container->resolve(\'examples\');\\n   ddd($example->go());\\n});\\n"}},{"type":"paragraph","data":{"text":"With the container object, we can reference the bound class by the key value we assigned it."}}],"version":"2.19.1"}', '{"links":[{"name":"Laracasts - Service Container Fundamentals","url":"https:\\/\\/laracasts.com\\/series\\/laravel-6-from-scratch\\/episodes\\/38"}]}', '2021-07-20 10:24:04', '2021-07-20 10:26:56' ),
( '112', '1', 'The Service Layer', 'the-service-layer', '{"time":1626777014953,"blocks":[{"type":"paragraph","data":{"text":"The entire Laravel application can be referenced through the app() method."}},{"type":"paragraph","data":{"text":"This app() method allows us to add to its service layer container for retrieval. For example, we can bind a custom class to the application to be used at our disposal:"}},{"type":"code","data":{"code":"app()->bind(\'example\', function(){\\n   return new App\\\\Example;\\n});\\n"}},{"type":"paragraph","data":{"text":"We can retrieve this class from app() by calling the key ‘example’ from the app() method:"}},{"type":"code","data":{"code":"Route::get(\'/\', function(){\\n  dd(app(\'example\'), app(\'example\'));\\n  // \'PagesController@home\';\\n});\\n"}},{"type":"paragraph","data":{"text":"The above will return 2 instances of the example class."}},{"type":"paragraph","data":{"text":"If we wanted to return a single instance instead, we can use the singleton() method instead of the bind() method."}},{"type":"paragraph","data":{"text":"We can also add a reference to a class from the app() method and Laravel will use a reflectionResolve auto resolving function to return the class without explicitly binding it to the service layer:"}},{"type":"code","data":{"code":"dd(app(\'App\\\\Example\'));\\n"}},{"type":"paragraph","data":{"text":"Using the app() key word; Laravel will look into the service container for a key passed into the app() method; if it can’t find it, then it will look for a class reference instead. It will use this as the order of precedence e.g., key value then resolve the classname."}},{"type":"paragraph","data":{"text":"<b>Note</b>: &nbsp;We can also use the resolve() method to do the same thing."}},{"type":"paragraph","data":{"text":"The key takeaway is, we can add a key to the service layer so it returns a class or something we want to produce. We can alternatively add a path to a class and Laravel will be able to resolve that path and return an instance of it."}}],"version":"2.19.1"}', '{"links":[{"name":"Laracasts - Automatically Resolve Dependencies","url":"https:\\/\\/laracasts.com\\/series\\/laravel-6-from-scratch\\/episodes\\/39?autoplay=true"}]}', '2021-07-20 10:27:53', '2021-07-20 10:31:51' ),
( '113', '1', 'App Service Providers', 'app-service-providers', '{"time":1626777634104,"blocks":[{"type":"paragraph","data":{"text":"The laravel system uses many service providers which can be viewed in App\\\\Config\\\\app.php under the aliases array. At the bottom of this array is a list of the App service providers we can use:"}},{"type":"code","data":{"code":" /** Application Service Providers...*/\\n       App\\\\Providers\\\\AppServiceProvider::class,\\n       App\\\\Providers\\\\AuthServiceProvider::class,\\n       // App\\\\Providers\\\\BroadcastServiceProvider::class,\\n       App\\\\Providers\\\\EventServiceProvider::class,\\n       App\\\\Providers\\\\RouteServiceProvider::class,"}},{"type":"paragraph","data":{"text":"Within App\\\\Providers\\\\AppServiceProviders.php the register() method allows us to bind() or resolve()&nbsp; service layers to our application rather than in the routes file like in the previous section."}},{"type":"paragraph","data":{"text":"The register() method is going to fire for every service file added to the aliases array."}},{"type":"paragraph","data":{"text":"The boot() method runs after the register() method and loops over each of the service layer items again. This method allows us to hook into the system."}},{"type":"paragraph","data":{"text":"In some circumstances, it makes sense to create our own service provider and Laravel has a helper command for that purpose:"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">php artisan make:provider SocialServiceProvider</code>"}},{"type":"paragraph","data":{"text":"Then within this class\'s register() method, we bind the key to our application."}},{"type":"code","data":{"code":"   public function register()\\n   {\\n       app()->singleton(Twitter::class, function(){\\n           return new Twitter(\'api-key\'); //usually load keys through .env\\n       });\\n   }\\n"}},{"type":"paragraph","data":{"text":"Then in a route file we can pass a Twitter instance."}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">Route::get(\'/\', function(Twitter $twitter){ dd($twitter)</code>"}},{"type":"paragraph","data":{"text":"<b>Note</b>: Writing Twitter::class is the same as writing App\\\\Service\\\\Twitter"}},{"type":"paragraph","data":{"text":"This shorthand will only work in some scenarios, eg it will not work when type hinting in a function parameter."}},{"type":"paragraph","data":{"text":"<b>Accessing global settings</b>"}},{"type":"paragraph","data":{"text":"To pass in global values to classes we instantiate in our service layer, we need to register those in the config/services.php file."}},{"type":"code","data":{"code":"  \'twitter\' => [\\n       \'key\' => \'public-key\',\\n       \'secret\' => \'secret-key-yo\'\\n   ]\\n"}},{"type":"paragraph","data":{"text":"Then within our register method where the class is instantiated, we can reference this setting using dot notation.<code class=\\"inline-code\\">&nbsp;&nbsp;&nbsp;&nbsp;</code>"}},{"type":"paragraph","data":{"text":"<code class=\\"inline-code\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return new Twitter(config(\'services.twitter.secret\'));&nbsp;</code>"}}],"version":"2.19.1"}', NULL, '2021-07-20 10:36:38', '2021-07-20 10:41:08' ),
( '114', '1', 'The Resource Class', 'resource-class', '{"time":1634638358277,"blocks":[{"type":"paragraph","data":{"text":"<b>We can create a <a href=\\"https://laravel.com/docs/7.x/eloquent-resources#introduction\\">‘Resource’</a> to format the data returned from the article endpoints.&nbsp; Laravel\'s resource classes allow you to expressively and easily transform your models and model collections into JSON. We can add or remove items stored on the model or rename elements to match business logic.</b>"}},{"type":"code","data":{"code":"php artisan make:resource Article\\n\\n"}},{"type":"paragraph","data":{"text":"An example API for users and their associated posts can be viewed in this project from the endpoint here:&nbsp;"}},{"type":"paragraph","data":{"text":"<a href=\\"http://127.0.0.1:8000/api/users\\">http://127.0.0.1:8000/api/users</a>"}}],"version":"2.19.1"}', '{"links":[{"name":"API Resources","url":"https:\\/\\/laravel.com\\/docs\\/7.x\\/eloquent-resources#introduction"}]}', '2021-10-19 10:08:50', '2021-10-19 10:12:40' ),
( '115', '1', 'Retrieving Single Resource Items', 'retreiving-single-resource-items', '{"time":1634712788967,"blocks":[{"type":"paragraph","data":{"text":"For single item requests we can reference the Resource class and pass in the request parameter. In this case we are requesting a single Article"}},{"type":"code","data":{"code":"  return new App\\\\Http\\\\Resources\\\\Article(\\n       App\\\\Article::find(1)\\n   );\\n"}},{"type":"paragraph","data":{"text":"Then in the resource class we define what the output should be:"}},{"type":"code","data":{"code":"public function toArray($request)\\n   {\\n    return [\\n            \'name\' => $this->name,\\n            \'email\' => $this->email,\\n            \'posts\' => PostResource::collection($this->posts),\\n        ];\\n   }\\n"}},{"type":"paragraph","data":{"text":"If we want to add other arrays to the resource we can define a with() method:"}},{"type":"code","data":{"code":"  public function with($request)\\n   {\\n       return [\\n           \'foo\' => \'barr\',\\n       ];\\n   }\\n"}},{"type":"paragraph","data":{"text":"And the output will look like this:"}},{"type":"code","data":{"code":"{\\n\\"data\\": {\\n\\"name\\": \\"Madonna Labadie\\",\\n\\"email\\": \\"braden05@example.net\\",\\n\\"posts\\": []\\n},\\n\\"foo\\": \\"barr\\"\\n}"}},{"type":"paragraph","data":{"text":"We can remove the “data” key wrapper from the JSON data by editing AppServiceProvider.php.&nbsp; More info <a href=\\"https://laravel.com/docs/7.x/eloquent-resources#data-wrapping\\">here.</a>"}}],"version":"2.19.1"}', '{"links":[{"name":"Google notes","url":"https:\\/\\/docs.google.com\\/document\\/d\\/1uaqX6hF1lKarREREPy4_VCvQ5kfJgWbzqAqwUkmq1lg\\/edit"}]}', '2021-10-19 10:16:17', '2021-10-20 06:53:14' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "profiles" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "role_user" --------------------------------
BEGIN;

INSERT INTO `role_user`(`id`,`user_id`,`role_id`,`created_at`,`updated_at`) VALUES 
( '1', '1', '1', NULL, NULL );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "roles" ------------------------------------
BEGIN;

INSERT INTO `roles`(`id`,`name`,`created_at`,`updated_at`) VALUES 
( '1', 'admin', '2021-05-24 10:52:51', '2021-05-24 10:52:51' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "series" -----------------------------------
BEGIN;

INSERT INTO `series`(`id`,`title`,`description`,`created_at`,`updated_at`) VALUES 
( '1', 'dolores', 'Ut minima quibusdam officiis.', '2021-02-18 10:14:41', '2021-02-18 10:14:41' ),
( '2', 'qui', 'Iure architecto quaerat beatae.', '2021-02-18 10:14:41', '2021-02-18 10:14:41' ),
( '3', 'sed', 'Voluptatum aliquid consequatur.', '2021-02-18 10:14:41', '2021-02-18 10:14:41' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "sharables" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "tags" -------------------------------------
BEGIN;

INSERT INTO `tags`(`id`,`name`,`description`,`created_at`,`updated_at`) VALUES 
( '1', 'Eloquent', 'Reference material related to the frequently used Eloquent relationships.', '2021-02-18 01:44:47', '2021-03-14 22:14:00' ),
( '7', 'Authentication', NULL, '2021-03-14 05:52:31', '2021-03-14 07:50:57' ),
( '8', 'Service Layer', 'Autoload classes to Laravels app() system.', '2021-03-14 07:51:21', '2021-07-20 10:20:28' ),
( '9', 'Mailables', 'Laravels system for working with email services.', '2021-04-13 21:59:55', '2021-04-13 21:59:55' ),
( '10', 'Resource Classes', 'Laravel\'s resource classes allow you to expressively and easily transform your models and model collections into JSON.', '2021-10-19 10:07:10', '2021-10-19 10:07:10' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
BEGIN;

INSERT INTO `users`(`id`,`name`,`email`,`affiliation_id`,`email_verified_at`,`password`,`experience_points`,`remember_token`,`created_at`,`updated_at`) VALUES 
( '1', 'Mark Condello', 'test@test.com', '1', '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'ReiQTgnSH35sDTxk5eHUn8M7kV5WKhUX2qwxaXKBRPXHsNaL775sDADuPPPR', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '2', 'Alden Fritsch', 'gprice@example.com', '2', '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '9b6KLMUoJ1', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '3', 'Madonna Labadie', 'braden05@example.net', NULL, '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'j5knUIeI2K', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '4', 'Nels Powlowski', 'homenick.weldon@example.com', NULL, '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'LN73ylULNG', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '5', 'Norris Schoen', 'thurman27@example.org', NULL, '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '1jtha0PsIw', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '6', 'Nayeli Fadel', 'alycia66@example.org', NULL, '2021-02-17 23:51:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'pXxvSMffzv', '2021-02-17 23:51:54', '2021-02-17 23:51:54' ),
( '7', 'Madelynn Gusikowski PhD', 'jacynthe.mosciski@example.net', NULL, '2021-02-18 02:43:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '5xKLzKjuKp', '2021-02-18 02:43:16', '2021-02-18 02:43:16' ),
( '8', 'Mr. Danny Gutmann', 'okeefe.richie@example.com', NULL, '2021-02-18 02:43:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'zFI9HPi9HR', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '9', 'Prof. Edward Hackett MD', 'william.nader@example.com', NULL, '2021-02-18 02:43:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'jnFuwiDWWS', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '10', 'Caitlyn Veum', 'lawrence.dickinson@example.net', NULL, '2021-02-18 02:43:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'RfXfMQ716B', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '11', 'Ms. Gia Eichmann Jr.', 'boehm.palma@example.com', NULL, '2021-02-18 02:43:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'OLjoqE6NNS', '2021-02-18 02:43:17', '2021-02-18 02:43:17' ),
( '12', 'Jacey Gutmann', 'wrunte@example.com', NULL, '2021-02-18 02:43:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'NiwnFCtcSj', '2021-02-18 02:43:58', '2021-02-18 02:43:58' ),
( '13', 'Shanie Schmitt', 'joannie.okuneva@example.org', NULL, '2021-02-18 02:43:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'XaUPcVdeG4', '2021-02-18 02:43:58', '2021-02-18 02:43:58' ),
( '14', 'Trinity Koepp', 'metz.kraig@example.com', NULL, '2021-02-18 02:43:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'By5wavMYWV', '2021-02-18 02:43:58', '2021-02-18 02:43:58' ),
( '15', 'Albertha Bradtke Jr.', 'ezequiel88@example.com', NULL, '2021-02-18 02:43:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '1BfLTPBoWC', '2021-02-18 02:43:58', '2021-02-18 02:43:58' ),
( '16', 'Maurice West', 'ward.quigley@example.org', NULL, '2021-02-18 02:43:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'r3xJZ3orl8', '2021-02-18 02:43:58', '2021-02-18 02:43:58' ),
( '17', 'Shany Jaskolski', 'bwisozk@example.org', '3', '2021-02-18 03:06:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'Z62jGVpJI4', '2021-02-18 03:06:04', '2021-02-18 03:06:04' ),
( '18', 'Luella O\'Conner', 'jonas62@example.net', '1', '2021-02-18 03:07:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '82uTFW5QJ1', '2021-02-18 03:07:06', '2021-02-18 03:07:06' ),
( '19', 'Dr. Orion Bailey', 'joel46@example.net', '1', '2021-02-18 03:07:09', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'F7ywzwHnY1', '2021-02-18 03:07:09', '2021-02-18 03:07:09' ),
( '20', 'Felicity Runolfsdottir', 'nikita.king@example.org', '2', '2021-02-18 03:07:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'E4kO6ie7M1', '2021-02-18 03:07:12', '2021-02-18 03:07:12' ),
( '21', 'Brandt Prosacco', 'roob.elyse@example.com', '2', '2021-02-18 03:07:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'rlnDRQN0U9', '2021-02-18 03:07:33', '2021-02-18 03:07:33' ),
( '22', 'Lourdes Zboncak', 'hope.mraz@example.org', '4', '2021-02-21 07:34:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '4NvmxXPcuR', '2021-02-21 07:34:05', '2021-02-21 07:34:05' ),
( '23', 'Benny Ferry', 'bcremin@example.net', '5', '2021-03-07 03:34:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'in3umUD5Hi', '2021-03-07 03:34:00', '2021-03-07 03:34:00' ),
( '24', 'Dr. Tristin Ferry MD', 'walker.raleigh@example.com', '7', '2021-03-07 03:36:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', '5r3GNHl87w', '2021-03-07 03:36:02', '2021-03-07 03:36:02' ),
( '25', 'Torrey Smith', 'bahringer.malachi@example.net', '8', '2021-03-07 03:36:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'jHYWB9e4oK', '2021-03-07 03:36:02', '2021-03-07 03:36:02' ),
( '26', 'Miss Lilla Ondricka', 'genevieve85@example.com', '9', '2021-03-07 03:38:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'Zb5CwuC9tD', '2021-03-07 03:38:24', '2021-03-07 03:38:24' ),
( '27', 'Tyler Tromp DVM', 'chammes@example.net', '10', '2021-03-07 03:38:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123', 'PG0w5qqvAb', '2021-03-07 03:38:24', '2021-03-07 03:38:24' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "videos" -----------------------------------
BEGIN;

INSERT INTO `videos`(`id`,`watchable_type`,`watchable_id`,`title`,`description`,`url`,`created_at`,`updated_at`) VALUES 
( '1', 'App\\Models\\Series', '1', 'Parkour madness', 'Dazzling stunts in European cities.', 'youtube.com', '2021-02-18 10:09:21', NULL ),
( '2', 'App\\Models\\Collection', '1', 'Learn to code in Laravel', 'Jeoffry Way\'s Elloquent Series', 'laracasts.com', '2021-02-18 10:11:03', NULL ),
( '3', 'App\\Models\\Post', '1', 'Lorem Ipsum Dolor', 'Dummy text description', 'posts.com', '2021-02-18 23:26:12', NULL ),
( '4', 'App\\Models\\Post', '3', 'Test title', 'Test desc', 'test.com', '2021-02-21 08:10:26', '2021-02-21 08:10:26' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "abilities_role_abilities_id_foreign" ----------
CREATE INDEX `abilities_role_abilities_id_foreign` USING BTREE ON `abilities_role`( `abilities_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "abilities_role_role_id_foreign" ---------------
CREATE INDEX `abilities_role_role_id_foreign` USING BTREE ON `abilities_role`( `role_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "files_uploadable_type_uploadable_id_index" ----
CREATE INDEX `files_uploadable_type_uploadable_id_index` USING BTREE ON `files`( `uploadable_type`, `uploadable_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "likables_likable_type_likable_id_index" -------
CREATE INDEX `likables_likable_type_likable_id_index` USING BTREE ON `likables`( `likable_type`, `likable_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "notifications_notifiable_type_notifiable_id_index" 
CREATE INDEX `notifications_notifiable_type_notifiable_id_index` USING BTREE ON `notifications`( `notifiable_type`, `notifiable_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "password_resets_email_index" ------------------
CREATE INDEX `password_resets_email_index` USING BTREE ON `password_resets`( `email` );
-- -------------------------------------------------------------


-- CREATE INDEX "post_tag_tag_id_foreign" ----------------------
CREATE INDEX `post_tag_tag_id_foreign` USING BTREE ON `post_tag`( `tag_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "role_user_role_id_foreign" --------------------
CREATE INDEX `role_user_role_id_foreign` USING BTREE ON `role_user`( `role_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "role_user_user_id_foreign" --------------------
CREATE INDEX `role_user_user_id_foreign` USING BTREE ON `role_user`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "sharables_sharable_type_sharable_id_index" ----
CREATE INDEX `sharables_sharable_type_sharable_id_index` USING BTREE ON `sharables`( `sharable_type`, `sharable_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "videos_watchable_type_watchable_id_index" -----
CREATE INDEX `videos_watchable_type_watchable_id_index` USING BTREE ON `videos`( `watchable_type`, `watchable_id` );
-- -------------------------------------------------------------


-- CREATE LINK "abilities_role_abilities_id_foreign" -----------
ALTER TABLE `abilities_role`
	ADD CONSTRAINT `abilities_role_abilities_id_foreign` FOREIGN KEY ( `abilities_id` )
	REFERENCES `abilities`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "abilities_role_role_id_foreign" ----------------
ALTER TABLE `abilities_role`
	ADD CONSTRAINT `abilities_role_role_id_foreign` FOREIGN KEY ( `role_id` )
	REFERENCES `roles`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "post_tag_post_id_foreign" ----------------------
ALTER TABLE `post_tag`
	ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY ( `post_id` )
	REFERENCES `posts`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "post_tag_tag_id_foreign" -----------------------
ALTER TABLE `post_tag`
	ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY ( `tag_id` )
	REFERENCES `tags`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "role_user_role_id_foreign" ---------------------
ALTER TABLE `role_user`
	ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY ( `role_id` )
	REFERENCES `roles`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "role_user_user_id_foreign" ---------------------
ALTER TABLE `role_user`
	ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY ( `user_id` )
	REFERENCES `users`( `id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


