#날짜 : 2022/10/19
#이름 : 서정현
#내용 : 프로젝트 실습_게시판 서비스 테이블 설계

#테이터베이스 생성
CREATE DATABASE `java2_board`;
CREATE USER 'java2_board'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java2_board`.* TO 'java2_board'@'%';
FLUSH PRIVILEGES;

#회원 테이블 생성
CREATE TABLE `board_user` (
	`uid` VARCHAR(20) primary KEY,
	`pass` VARCHAR(255) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	`nick` VARCHAR(20) UNIQUE NOT NULL,
	`eamil` VARCHAR(100) UNIQUE NOT NULL,
	`hp` CHAR(13) UNIQUE NOT NULL,
	`grade` TINYINT DEFAULT 2,
	`zip` CHAR(5),
	`addr1` VARCHAR(255),
	`addr2` VARCHAR(255),
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME NOT NULL
);

#약관 테이블 생성
CREATE TABLE `board_terms` (
	`terms` TEXT,
	`privacy` TEXT
);

#게시물 테이블 생성
CREATE TABLE `board_article` (
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`parent`INT DEFAULT 0,
	`comment` INT DEFAULT 0,
	`cate` VARCHAR(20) DEFAULT 'free',
	`title` VARCHAR(255),
	`content` TEXT NOT NULL,
	`file` TINYINT DEFAULT 0,
	`hit` INT DEFAULT 0,
	`uid` VARCHAR(20) NOT null,
	`regip`VARCHAR(100) NOT null,
	`rdate` DATETIME NOT null
);

#파일 테이블 생성
CREATE TABLE `board_file` (
	`fno`  INT AUTO_INCREMENT PRIMARY key,
	`parent` INT NOT null,
	`newName` VARCHAR(255) NOT null,
	`oriName` VARCHAR(255) NOT null,
	`download` INT DEFAULT 0
);

SELECT MD5('1234');
SELECT SHA1('1234');
SELECT SHA2('abcv', 256);

SELECT * FROM `board_user` WHERE `uid`='sjh940520' and `pass`=SHA2('ewq321!', 256);`order`