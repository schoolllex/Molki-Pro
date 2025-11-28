SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS trainingparty_infra;
USE trainingparty_infra;

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `PP` varchar(255) NOT NULL,
  `score` int(11) DEFAULT 0,
  `isToPlay` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `shots` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `turn_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `shot_quilles` (
  `id` int(11) NOT NULL,
  `shot_id` int(11) NOT NULL,
  `quille` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `shots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);
ALTER TABLE `shot_quilles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shot_id` (`shot_id`);
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3446;
ALTER TABLE `shots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;
ALTER TABLE `shot_quilles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;
ALTER TABLE `shots`
  ADD CONSTRAINT `shots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `game` (`id`);
ALTER TABLE `shot_quilles`
  ADD CONSTRAINT `shot_quilles_ibfk_1` FOREIGN KEY (`shot_id`) REFERENCES `shots` (`id`);
COMMIT;

