CREATE DATABASE IF NOT EXISTS NotesStore;

USE NotesStore;


DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,  
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `email` varchar(64) NOT NULL UNIQUE,
  `branch` varchar(64) DEFAULT NULL,
  `current_year` int(11) DEFAULT NULL,
  `password_hash` varchar(64) NOT NULL,  
  PRIMARY KEY (`user_id`)
);


CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `product_condition` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`product_id`), 
  FOREIGN KEY (`user_id`) REFERENCES user(user_id)
);

