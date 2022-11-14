##날짜 : 2022/08/23
##이름 : 서정현
##내용 : 제2장 테이블 제약조건과 수정

##실습 2-1 테이블을 생성할 때 기본키(Primary key) 지정하기
create table `user2`(
	`uid` varchar(20) primary key,
    `name` varchar(10),
    `hp` char(13),
    `age` tinyint
);

##실습 2-2
insert into `user2` values('a101', '김유신', '010-1234-1001', 25);
insert into `user2` values('a102', '김춘추', '010-1234-1002', 23);
insert into `user2` values('a103', '장보고', '010-1234-1003', 33);
insert into `user2` values('a104', '강감찬', '010-1234-1004', 43);
insert into `user2` values('a105', '이순신', '010-1234-1005', 53);

##실습 2-3 테이블을 생성할 때 고유키(Unique) 지정하기
create table `user3` (
		`uid` varchar(20) primary key,
        `name` varchar(10),
        `hp` char(13) unique,
        `age` tinyint
);

##실습 2-4
insert into `user3` values('a101', '김유신', '010-1234-1001', 25);
insert into `user3` values('a102', '김춘추', '010-1234-1002', 23);
insert into `user3` values('a103', '장보고', '010-1234-1003', 33);
insert into `user3` values('a104', '강감찬', '010-1234-1004', 43);
insert into `user3` values('a105', '이순신', '010-1234-1005', 53);
insert into `user3` values('a205', '이순신', '010-1234-2005', 53);

##실습 2-5 테이블 외래키(Foreign key) 지정하기
create table `Parent` (
	`pid` varchar(10) primary key,
    `name` varchar(10),
    `hp` char(13) unique
);

create table `Child` (
	`cid` varchar(10) primary key,
    `name` varchar(10),
    `hp` char(13) unique,
    `pid` varchar(10),
    foreign key (`pid`) references `parent`(`pid`)
);

##실습 2-6 Parent 테이블에 데이터가 추가되지 않으면 Child 테이블에 데이터를 생성할 수 없다.
insert into `Parent` values('p101', '이성계', '010-1234-1111');
insert into `Child` values('c101', '이방원', '010-1234-1001', 'p101');

select * from `Parent`;
select * from `Child`;

##실습 2-7 테이블을 생성할 때 시퀀스 칼럼 지정
create table `user4`(
	`seq`	 int primary key auto_increment,
	`name` 	 varchar(10),
    `gender` tinyint,
    `age` 	 tinyint, 
    `addr` 	 varchar(255)
);

##실습 2-8
insert into `user4` (`name`, `gender`, `age`, `addr`) values('김유신', 1, 25, '김해시');
insert into `user4` set
						`name`='신사임당',
						`gender`=2, 
						`age`=27,
						`addr`='강릉시';
                        
delete from `user4` where `name`='김유신';

select * from `User4`;

##실습 2-9 Default와 Null값
create table `user5`(
	`name` varchar(10) not null,
    `gender` int,
    `age` tinyint default 1,
    `addr` varchar(10)
);

##실습 2-10
insert into `user5` (`name`) values('김유신');
insert into `user5` set 
					`name`='강감찬',
					`age`= 24, 
                    `addr`='부산시';
                    
select * from `user5`;

##실습 2-11 속성 추가
delete from `User5`;

alter table `User5` add `hp` varchar(20);
alter table `user5` add `birth` char(10) default '0000-00-00' after `name`;
alter table `User5` add `uid` varchar(10) primary key first;

##실습 2-12 속성 자료형 변경
alter table `user5` modify `hp` char(13);
alter table `user5` modify `age` tinyint;

##실습 2-13 속성 이름과 자료형 변경
alter table `user5` change column `addr` `address` varchar(100);

select* from `user5`;

##실습 2-14 속성 삭제
alter table `user5` drop `hp`;
alter table `user5` drop `birth`;

select * from `user5`;

insert into `User5` values('p101', '김유신', 1, 25, '김해시');
insert into `User5` values('p102', '김춘추', 1, 23, '경주시');

##실습 2-15 테이블 복사(데이터는 복사 안됨)
create table `user6` like `User5`;
create table `user7` like `user5`;

select * from `user6`;
select * from `user7`;

##실습 2-16 테이블 데이터 복사
insert into `user6` select * from `User5`;
insert into `user7` (`uid`, `name`, `gender`, `age`) select `uid`, `name`, `gender`, `age` from `user5`;

select * from `user6`;
select * from `user7`;
