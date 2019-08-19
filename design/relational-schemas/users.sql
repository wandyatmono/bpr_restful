CREATE TABLE `users`
(
  `id` int(11) PRIMARY KEY NOT NULL,
  `name` varchar(100),
  `account` varchar(255),
  `password` varchar(255),
  `role` int(11),
  `ric` varchar(20),
  `birth_place` varchar(45),
  `birth_date` date,
  `gender` tinyint(4),
  `faith` tinyint(4)
);

CREATE TABLE `user_roles`
(
  `id` int(11) PRIMARY KEY NOT NULL,
  `native` varchar(100),
  `name` varchar(100)
);

CREATE TABLE `user_avatars`
(
  `id` int(11) PRIMARY KEY NOT NULL,
  `user` int(11),
  `photo` varchar(255),
  `actived` tinyint(4)
);

CREATE TABLE `user_religions`
(
  `id` tinyint(4) PRIMARY KEY NOT NULL,
  `native` varchar[45],
  `name` varchar(45)
);

CREATE TABLE `user_gender`
(
  `id` tinyint(4) PRIMARY KEY NOT NULL,
  `native` varchar(10),
  `name` varchar(10)
);

ALTER TABLE `users` ADD FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`);

ALTER TABLE `user_avatars` ADD FOREIGN KEY (`user`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`faith`) REFERENCES `user_religions` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`gender`) REFERENCES `user_gender` (`id`);

