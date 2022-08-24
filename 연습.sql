
##테이블 생성
##직원 테이블
create table `Member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` char(13) not null unique,
    `pos` varchar(10) not null default '사원',
    `dep` int default null,
    `rdate` datetime not null
);

##부서 테이블
create table `Department`(
	`depNO` int primary key,
    `name` varchar(10) not null,
    `tel` int not null
);

##매출 테이블
create table `Sales` (
	`seq` int primary key auto_increment,
    `uid`varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int not null
);

##직원 테이블에 데이터 입력
insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
insert into `Member` values('a102', '김유신', '010-1234-1002', '차장', 101, '2022-11-19 11:39:48');
insert into `Member` values('a103', '김춘추', '010-1234-1003', '사원', 101, '2022-11-19 11:39:48');
insert into `Member` values('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
insert into `Member` values('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
insert into `Member` values('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48');
insert into `Member` (`uid`, `name`, `hp`, `dep`, `rdate`)values('a111', '박지원', '010-1234-1011', 105, '2020-11-19 11:39:48');

##부서 테이블에 데이터 입력
insert into `Department` values(101, '영업1부', '051-512-1001');
insert into `Department` values(102, '영업2부', '051-512-1002');
insert into `Department` values(103, '영업3부', '051-512-1003');
insert into `Department` values(104, '영업4부', '051-512-1004');
insert into `Department` values(105, '영업5부', '051-512-1005');
insert into `Department` values(106, '영업지원부', '051-512-1006');
insert into `Department` values(107, '인사부', '051-512-1007');

select * from `department`;


