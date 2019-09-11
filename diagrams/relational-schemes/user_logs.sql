CREATE TABLE `users` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `name` varchar(100),
  `account` varchar(255),
  `password` varchar(255),
  `role` int(11),
  `ric` varchar(20),
  `birth_place` varchar(45),
  `birth_date` date,
  `gender` tinyint(1),
  `faith` tinyint(2),
  `notifications` int(11),
  `chat` int(11),
  `last_activity` timestamp,
  `last_latitude` float(10,6),
  `last_longitude` float(10,6),
  `online` tinyint(1)
);

CREATE TABLE `user_logs` (
  `id` bigint(20) PRIMARY KEY NOT NULL,
  `uuid` varchar(36),
  `user` int(11),
  `state` tinyint(1),
  `hidden` tinyint(1)
);

CREATE TABLE `user_roles` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `native` varchar(100),
  `name` varchar(100)
);

ALTER TABLE `users` ADD FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`);

ALTER TABLE `user_logs` ADD FOREIGN KEY (`user`) REFERENCES `users` (`id`);
