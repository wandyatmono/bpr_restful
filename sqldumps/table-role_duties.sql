CREATE TABLE `user_roles` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `native` varchar(100),
  `name` varchar(100)
);

CREATE TABLE `role_duty_classes` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `native` varchar(100),
  `name` varchar(100)
);

CREATE TABLE `role_duties` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `role` int(11),
  `item` int(11)
);

CREATE TABLE `role_duty_list` (
  `id` int(11) PRIMARY KEY NOT NULL,
  `native` varchar(100),
  `name` varchar(100),
  `class` int(11),
  `icon_type` tinyint(1),
  `icon_name` varchar(45)
);

ALTER TABLE `role_duties` ADD FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`);

ALTER TABLE `role_duties` ADD FOREIGN KEY (`item`) REFERENCES `role_duty_list` (`id`);

ALTER TABLE `role_duty_list` ADD FOREIGN KEY (`class`) REFERENCES `role_duty_classes` (`id`);
