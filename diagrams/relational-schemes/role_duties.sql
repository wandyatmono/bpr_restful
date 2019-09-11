CREATE TABLE `user_roles` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `native` varchar(100),
  `name` varchar(100)
);

CREATE TABLE `role_duty_groups` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `native` varchar(100),
  `name` varchar(100)
);

CREATE TABLE `role_duties` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role` int(11),
  `item` int(11),
  `right` varchar(2)
);

CREATE TABLE `role_duty_list` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `native` varchar(100),
  `name` varchar(100),
  `group` int(11),
  `icon` varchar(45)
);

ALTER TABLE `role_duties` ADD FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`);

ALTER TABLE `role_duties` ADD FOREIGN KEY (`item`) REFERENCES `role_duty_list` (`id`);

ALTER TABLE `role_duty_list` ADD FOREIGN KEY (`group`) REFERENCES `role_duty_groups` (`id`);
