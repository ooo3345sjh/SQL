ALTER TABLE	`board_user` ADD `sessId` VARCHAR(100) UNIQUE;
ALTER TABLE	`board_user` ADD `sessLimitDate` DATETIME;

ALTER TABLE	`board_user` DROP COLUMN `sessId`
ALTER TABLE	`board_user` DROP COLUMN `sessLimitDate`

UPDATE `board_user` SET	`sessId`=?, `sessLimitDate` = DATE_ADD(NOW(),INTERVAL 3 DAY) WHERE `uid`=?;

SELECT * FROM `board_user` WHERE	`sessId` = '쿠키로 받은 아이디' AND `sessLimitDate` > NOW();
