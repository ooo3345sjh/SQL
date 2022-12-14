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

#댓글  테이블 생성
CREATE TABLE `board_comment` (
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`parent`INT NOT null,
	`comment` TEXT NOT null,
	`uid` VARCHAR(2board_comment0) NOT null,
	`nick` VARCHAR(20) NOT NULL,
	`regip`VARCHAR(100) NOT NULL,
	`rdate` DATETIME NOT null
);

SELECT MD5('1234');
SELECT SHA1('1234');
SELECT SHA2('abcv', 256);

SELECT * FROM `board_user` WHERE `uid`='sjh940520' and `pass`=SHA2('ewq321!', 256);

INSERT INTO `board_article` (`cate`, `title`,`content`,`uid`,`regip`,`rdate`)
SELECT `cate`,`title`,`content`,`uid`,`regip`,`rdate` FROM `board_article`
WHERE `cate`='market';

SELECT COUNT(`no`) FROM `board_article`;

SELECT a.*, f.fno, f.parent AS pno, f.newName, f.oriName, f.download  FROM `board_article` a LEFT JOIN `board_file` f
ON a.`no` = f.parent;

SELECT *  FROM `board_article` a JOIN `board_file` f
ON a.`no` = f.parent;

UPDATE `board_article``` SET `hit` = `hit` +1 WHERE `no` = 1;

SELECT MAX(`no`) FROM `board_comment`

SELECT a.*, b.nick form `board_article` a
join `board_user` b USING(`uid`)
WHERE `parent` != 0 ORDER BY `no` DESC LIMIT 1;

# 조인해서 삭제하는 방법
DELETE a.*, f.* FROM 
`board_article` AS a
INNER JOIN 
`board_file` AS f
ON a.no = f.parent
WHERE a.`no`= 141  OR a.`parent`= 141;

# comment 개수 뺴기
SELECT * FROM 	`board_article`
WHERE `no` IN (SELECT parent FROM `board_article` WHERE `no`=5164 );

UPDATE `board_article` SET `comment` = `comment` - 1 
WHERE  `no` IN (SELECT t.parent FROM  (SELECT parent FROM `board_article` WHERE `no`=5164 ) AS t);



DELETE FROM `board_file` WHERE `parent` = 5323 AND `oriName` = '삽입 이미지' AND
`newName` IN ('image2022110515452401406218374.jpg', 'image2022110515452401407514215.jpg');

SELECT * FROM
`board_article` AS a 
LEFT JOIN 
`board_comment` AS c  ON a.`no` = c.`parent`  
LEFT JOIN 
`board_file` AS f 
 ON a.`no` = f.`parent`
 WHERE a.`no`= 5396  OR c.`parent`= 5396;
 
 
 # 팜프로젝트 각 카테고리 최신글 가져오기
 (SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`= 'grow' ORDER BY `no` DESC LIMIT 5)
 UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`= 'school' ORDER BY `no` DESC LIMIT 5)
 UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`= 'story' ORDER BY `no` DESC LIMIT 5);