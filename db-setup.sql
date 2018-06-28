CREATE DATABASE IF NOT EXISTS NotesStore;

USE NotesStore;

DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `branch` varchar(64) DEFAULT NULL,
  `password_hash` varchar(64) NOT NULL,
  `current_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(64) NOT NULL,
  `condition` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`product_id`), 
  FOREIGN KEY (`user_id`) REFERENCES user(user_id)
);

