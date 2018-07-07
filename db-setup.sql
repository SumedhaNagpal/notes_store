CREATE DATABASE IF NOT EXISTS NotesStore;

USE NotesStore;

DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,  
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `email` varchar(64) NOT NULL UNIQUE,
  `branch` varchar(64) DEFAULT NULL,
  `current_year` int(11) DEFAULT NULL,
  `password_hash` varchar(64) NOT NULL,
  `photo` mediumblob,  
  PRIMARY KEY (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `product_condition` varchar(64) DEFAULT NULL,
  `product_semester` tinyint DEFAULT NULL,
  `product_type` varchar(64) DEFAULT NULL,
 `pic` mediumblob,  
  PRIMARY KEY (`product_id`), 
  FOREIGN KEY (`user_id`) REFERENCES user(user_id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `from_id` varchar(64) NOT NULL,
  `message_text` text DEFAULT NULL,
  PRIMARY KEY (`message_id`), 
  FOREIGN KEY (`to_id`) REFERENCES user(user_id),
  FOREIGN KEY (`from_id`) REFERENCES user(user_id)
);

CREATE TABLE `room` (
  `room_id` varchar(64) NOT NULL AUTO_INCREMENT,
  `person1` int(11) NOT NULL,
  `person2` int(11) NOT NULL,
  PRIMARY KEY (`room_id`), 
  FOREIGN KEY (`person1`) REFERENCES user(user_id),
  FOREIGN KEY (`person2`) REFERENCES user(user_id)
);

