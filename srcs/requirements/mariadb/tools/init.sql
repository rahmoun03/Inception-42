-- create database
CREATE DATABASE IF NOT EXISTS wordpress;

-- create table
USE wordpress;
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- create and grant privileges
CREATE USER IF NOT EXISTS 'ayoub'@'%' IDENTIFIED BY 'ayoub0330';
GRANT ALL PRIVILEGES ON wordpress.* TO 'ayoub'@'%';
FLUSH PRIVILEGES;
