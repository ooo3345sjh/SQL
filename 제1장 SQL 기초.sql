#날짜 : 2022/08/22
#이름 : 서정현
#내용 : 제1장 SQL 기초

#실습1-1 데이터베이스 생성 및 제거
create database `UserDB`;
drop database `UserDB`;
create database `java2dB`;
drop database `java2dB`;

#실습1-2 테이블 생성 및 제거
create table `user1` (
	`uid`	varchar(10),
    `name`	varchar(10),
    `hp`	char(13),
    `age`	int
);

drop table `User1`;

#실습1-3 테이블에 데이터 추가
insert into `user1`values ('A101', '김유신', '010-1234-1111', 25);
insert into `user1` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `user1` values ('A103', '장보고', '010-1234-3333', 32);
insert into `user1` (`uid`, `name`, `age`)values ('A104', '강감찬', 45);
insert into `user1` set
					`uid`='A105',
                    `name`='이순신',
                    `hp`='010-1234-5555';

#실습1-4 테이블에 데이터 조회
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name` = '김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >= 30;
select `uid`, `name`, `age` from `User1`;

#실습1-5 테이블에 데이터 수정
update `User1` set `hp`='010-1234-4444' where `uid`='A104';
update `User1` set `age`='51' where `uid`='A105';
update `User1` set 
					`hp`='010-1234-1001', 
                    `age`=27 
				where 
					`uid`='A101';

#실습1-6 테이블에 데이터 삭제
delete from `User1` where `uid`= 'A101';
delete from `User1` where `uid`='A102' and `age`=23;
delete from `User1` where `age`>=30;

#실습1-7
create table `tblUser` (
		`userId` varchar(10), 
		`userName` varchar(10), 
        `userHp` char(13), 
        `userAge` tinyint,
        `userAddr` varchar(20)
);

create table `tblProduct` (
		`proCode` int, 
		`proName` varchar(10), 
        `proPrice` int, 
        `proAmount` int,
        `proCompany` varchar(10),
        `proMakeDate` date
);

#실습1-8
insert into `tblUser` values('P101', '김유신', '010-1234-1001', 25, '서울시 중구');
insert into `tblUser` values('P102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
insert into `tblUser` (`userId`, `userName`, `userAge`, `userAddr`) values('P103', '장보고', 31, '경기도 광주군');
insert into `tblUser` set
				`userId`='P104',
                `userName`='강감찬',
                `userAddr`='경남 창원시';
insert into `tblUser` set
				`userId`='P1-5',
                `userName`='이순신',
                `userHp`='010-1234-1005',
                `userAge`=50;
                
insert into `tblproduct` values(1,'냉장고', 800, 10, 'LG', '2022-01-06');
insert into `tblproduct` values(2, '노트북', 1200, 20, '삼성', '2022-01-06');
insert into `tblproduct` values(3, 'TV', 1400, 6, 'LG', '2022-01-06');
insert into `tblproduct` values(4, '세탁기', 1000, 8, 'LG', '2022-01-06');
insert into `tblproduct` set
				`proCode`= 5,
                `proName`='컴퓨터',
                `proPrice`= 1100,
                `proAmount`= 0;
insert into `tblproduct` set
				`proCode`= 6,
                `proName`='휴대폰',
                `proPrice`= 900,
                `proAmount`= 102,
                `proCompany`= '삼성',
                `proMakeDate`='2022-01-06';

#실습1-9
select * from `tbluser`;
select `userName` from `tbluser`;
select `userName`, `userHp` from `tbluser`;
select * from `tbluser` where `userId`='p102';
select * from `tbluser` where `userId`='p104' or `userId`='p105';
select * from `tbluser` where `userAddr`='신라';
select * from `tbluser` where `userAge`> 30;
select * from `tbluser` where `userHp` is null;
update `tbluser` set `userAge`=42 where `userId`='p104';
update `tbluser` set `userAddr`='경남 김해시' where `userId`='p105';

select * from `tblproduct`;
select `proname` from `tblproduct`;
select `proname`, `proprice` from `tblproduct`;
select * from `tblproduct` where `proCompany`='LG';
select * from `tblproduct` where `proCompany`='삼성';

update `tblproduct` set 
						`proCompany`='삼성',
                        `proMakeDate`='2021-01-01'
					where 
						`proCode`='5';
java2dbuser2