
CREATE TABLE IF NOT EXISTS `peds` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ped` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;