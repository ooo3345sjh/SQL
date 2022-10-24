#날짜 : 2022/08/25
#이름 : 서정현
#내용 : 제4장 SQL 고급

create database `java2db`;
##실습 4-1 

#직원 테이블
create table `Member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` char(13) unique not null,
    `pos` varchar(10) default '사원',
    `dep` int,
    `rdate` datetime not null
);

#부서 테이블
create table `Department`(
	`depNO` int primary key,
    `name` varchar(10) not null,
    `tel` char(12) not null
);

#매출 테이블
create table `Sales` (
	`seq` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int not null
);

##실습 4-2

#직원 테이블에 데이터 입력
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

#부서 테이블에 데이터 입력
insert into `Department` values(101, '영업1부', '051-512-1001');
insert into `Department` values(102, '영업2부', '051-512-1002');
insert into `Department` values(103, '영업3부', '051-512-1003');
insert into `Department` values(104, '영업4부', '051-512-1004');
insert into `Department` values(105, '영업5부', '051-512-1005');
insert into `Department` values(106, '영업지원부', '051-512-1006');
insert into `Department` values(107, '인사부', '051-512-1007');

#매출 테이블에 데이터 입력
insert into `Sales` (`uid`, `year`, `month`, `sale`)values('a101', '2018', 1, 98100);
insert into `Sales` set
	`uid`='a102',
    `year`=2018,
    `month`=1,
    `sale`=136000;
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2018, 1, 80100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2018, 1, 78000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2018, 1, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a101', 2018, 2, 23500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2018, 2, 126000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2018, 2, 18500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2018, 2, 19000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2018, 2, 53000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a101', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2019, 1, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2019, 1, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2019, 1, 53500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a107', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2019, 2, 160000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2019, 2, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2019, 2, 43000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2019, 2, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2019, 2, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2020, 1, 201000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2020, 1, 63000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2020, 1, 74000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2020, 1, 122000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a107', 2020, 1, 111000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2020, 2, 120000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2020, 2, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2020, 2, 84000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2020, 2, 180000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a108', 2020, 2, 76000);

##실습 4-3 조건에 일치하는 레코드 조회
select * from `member` where `name` = '김유신';
select * from `member` where `pos`='차장' and `dep`=101;
select * from `member` where `pos`='차장' or `dep`=101;
select * from `member` where `name`!='김춘추';
select * from `member` where `name` <> '김춘추';
select * from `member` where `pos`='사원' or `pos`='대리';
select * from `member` where `pos` in('대리', '사원');
select * from `member` where `deq` in(101, 102, 103);
select * from `member` where `name` like '%신';
select * from `member` where `name` like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '_성_';
select * from `member` where `name` like '정_';
select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` > 50000 and `sale` < 100000 and `month`=1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `year` in(2020);
select * from `sales` where `month` in(1, 2);

##실습 4-4 오름/내림차순으로 정렬
select * from `sales` order by `sale`;
select * from `sales` order by `sale` asc;
select * from `sales` order by `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc;
select * from `member` order by `rdate` asc;
select * from `sales` where `sale` > 50000 order by `sale` desc;
select * from `sales` 
where `sale` > 50000 
order by `year`, `month`, `sale` desc;

##실습 4-5 레코드 수를 제한해서 조회
select * from `sales` limit 3;
select * from `sales` limit 0, 3;
select * from `sales` limit 1, 2;
select * from `sales` limit 5, 3;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales`
where `sale` > 5000
order by `year` desc, `month`, `sale` desc
limit 5;

##실습 4-6 칼럼명을 별명을 사용하기
select sum(`sale`) as `합계` from `sales`;
select avg(`sale`) as `평균` from `sales`;
select max(`sale`) as `최대값` from `sales`;
select min(`sale`) as `최소값` from `sales`;
select count(`seq`) as `갯수` from `sales`;
select count(*) as `갯수` from `sales`;
select max(`seq`) as `갯수` from `sales`;

select substring(`hp`, 10, 4) as `전화번호 끝자리` from `member`;

insert into `member` values ('b101', '을지문덕', '010-5555-1234', '시장', 107, now());

##실습 4-7 2018년 1월 매출의 총합을 구하시오.
select sum(`sale`) as `2018년도 1월 매출총합` from `sales` where `year`=2018 and `month`=1;

##실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select 
	sum(`sale`) as `총합`, 
    avg(`sale`) as `평균` 
from `sales` 
where `year`='2019' and `month`='2' and `sale`>=50000;

##실습 4-9 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오.
select
	min(`sale`) as `2020년 최저 매출`, 
    max(`sale`) as `2020년 최고 매출` 
from `sales` where `year` = 2020;

##실습 4-10 그룹별로 조회
select * from `sales` group by `uid`;
select * from `sales` group by `year`;
select * from `sales` group by `uid`, `year`;
select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
order by `year` asc, `합계` desc;

select 
	`uid`,
    `year`,
    sum(`sale`) as `합계`
from `sales` 
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc;

##실습 4-11 그룹화에 검색조건 설정
select `uid`, sum(`sale`) as `합계` from `sales`
group by `uid`
having sum(`sale`) >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;

##실습 4-12  테이블 합치기
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
update `Sales2` set `year` = `year` + 3;

(select * from `sales`) union (select * from `sales2`);
select * from `sales` 
union
select * from `sales2`;
select `uid`, `year`, `sale` from `sales`
union
select `uid`, `year`, `sale` from `sales2`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `sales2`
group by `uid`, `year`
order by `year` asc, `합계` desc;

##실습 4-13 내부조인(INNER JOIN)
select * from `sales` inner join `member`on `sales`.`uid` = `member`.`uid`;
select * from `member` inner join `department` on `member`.`dep` = `department`.`depNO`;

select * from `sales` as a 
join `member` as b 
on a.uid = b.uid;
select * from `member` as a join `department` as b on a.dep = b.depNO;

select * from `sales` as a, `member` as b where a.uid = b.uid;
select * from `member` as a, `department` as b where a.dep = b.depNO;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `Sales` as a
join `member` as b on a.uid = b.uid; 
select 
	a.`seq`,
    a.`uid`,
    `sale`,
    `name`,
    `pos`
from `sales` as a
join `member` as b
using(`uid`);

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b on a.uid = b.uid
where `sale` >= 100000;
select a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(sale) as `합계` from `sales`as a
join `member` as b on a.uid = b.uid
group by a.`uid`, a.`year` having `합계` >= 100000
order by a.`year` asc, `합계` desc;

select * from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo;
select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo;
select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNO
where `sale` > 100000
order by `sale` desc;


##실습 4-14 외부조인(LEFT, RIGHT JOIN)
select * from `sales` as a
right join `member` as b
on a.uid = b.uid
order by seq;

select * from `sales` as a 
left join `member` as b
on a.uid = b.uid;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
right join `member` as b using(uid);

##실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select 
	`uid`,
    a.`name`,
    `pos`,
    b.`name`
from `member` as a 
join `department` as b
on a.dep = b.depNo;

##실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select sum(sale) as `2019 매출합` from `sales` as a
join `member` as b
on a.uid = b.uid
where `name` = '김유신' and `year` = 2019;

##실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 
##		   직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬
select 
	b.`name`,
    c.`name`,
    b.`pos`,
    a.`year`,
    sum(sale) as `매출합`
from `Sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNO
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
having sum(sale) >= 100000
order by sum(sale) desc;


































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
    `tel` char(12) not null
);

##매출 테이블
create table `Sales` (
	`seq` int primary key auto_increment,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int not null
);

##직원 테이블에 데이터 입력
insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, now());
insert into `Member` values('a102', '김유신', '010-1234-1002', '차장', 101, now());
insert into `Member` values('a103', '김춘추', '010-1234-1003', '사원', 101, now());
insert into `Member` values('a104', '장보고', '010-1234-1004', '대리', 102, now());
insert into `Member` values('a105', '강감찬', '010-1234-1005', '과장', 102, now());
insert into `Member` values('a106', '이성계', '010-1234-1006', '차장', 103, now());
insert into `Member` values('a107', '정철', '010-1234-1007', '차장', 103, now());
insert into `Member` values('a108', '이순신', '010-1234-1008', '부장', 104, now());
insert into `Member` values('a109', '허균', '010-1234-1009', '부장', 104, now());
insert into `Member` values('a110', '정약용', '010-1234-1010', '사원', 105, now());
insert into `Member` (`uid`, `name`, `hp`, `dep`, `rdate`)values('a111', '박지원', '010-1234-1011', 105, now());


##부서 테이블에 데이터 입력
insert into `Department` values(101, '영업1부', '051-512-1001');
insert into `Department` values(102, '영업2부', '051-512-1002');
insert into `Department` values(103, '영업3부', '051-512-1003');
insert into `Department` values(104, '영업4부', '051-512-1004');
insert into `Department` values(105, '영업5부', '051-512-1005');
insert into `Department` values(106, '영업지원부', '051-512-1006');
insert into `Department` values(107, '인사부', '051-512-1007');

##매출 테이블에 데이터 입력
insert into `Sales` (`uid`, `year`, `month`, `sale`)values('a101', '2018', 1, 98100);
insert into `Sales` set
	`uid`='a102',
    `year`=2018,
    `month`=1,
    `sale`=136000;
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2018, 1, 80100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2018, 1, 78000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2018, 1, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a101', 2018, 2, 23500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2018, 2, 126000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2018, 2, 18500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2018, 2, 19000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2018, 2, 53000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a101', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2019, 1, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2019, 1, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2019, 1, 53500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a107', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2019, 2, 160000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2019, 2, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2019, 2, 43000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2019, 2, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2019, 2, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2020, 1, 201000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2020, 1, 63000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2020, 1, 74000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a106', 2020, 1, 122000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a107', 2020, 1, 111000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a102', 2020, 2, 120000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a103', 2020, 2, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a104', 2020, 2, 84000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a105', 2020, 2, 180000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values('a108', 2020, 2, 76000);

##조건에 일치하는 레코드 조회
select * from `member` where `name` = '김유신';
select * from `member` where `pos`='차장' and `dep`=101;
select * from `member` where `pos`='차장' or `dep`=101;
select * from `member` where `name` != '김춘추';
select * from `member` where `name` <> '김춘추';
select * from `member` where `pos`='사원' or `pos`='대리';
select * from `member` where `pos` in('사원', '대리');
select * from `member` where `dep` in(101, 102, 103);
select * from `member` where `name` like '%신';
select * from `member` where `name`like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '_성_';
select * from `member` where `name` like '정_';
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` >= 50000 and `sale` < 100000 and `month` = 1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1, 2);

##실습 4-4 오름/내림차순으로 정렬
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` asc;
select * from `sales` order by `sale`desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc;
select * from `member` order by `rdate` asc;
select * from `sales` where `sale` > 50000 order by `sale` desc;
select * from `sales` 
where `sale` > 50000
order by `year`, `month`, `sale` desc;

##레코드 수를 제한해서 조회
select * from `sales` limit 3;
select * from `sales` limit 0, 3;
select * from `sales` limit 1, 2;
select * from `sales` limit 5, 3;
select * from `sales` order by `sale` desc limit 3;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `Sales`
where `sale` > 50000
order by `year` desc, `month`, `sale` desc
limit 5;

##칼럼명을 별명으로 사용하기
select sum(`sale`) as `합계` from `sales`;
select avg(sale) as `평균` from `sales`;
select max(`sale`) as `최댓값` from `sales`;
select min(`sale`) as `최소값` from `sales`;
select count(sale) as `갯수` from `sales`;
select count(*) as `갯수` from `Sales`;

select substring(`hp`, 10, 4) as `전화번호 끝자리` from `member`;


##실습예제
select `year`, `month`, sum(`sale`) as `총합` from `sales` where `year`=2018 and `month` = 1;
select `year`, `month`,sum(`sale`) as 총합, avg(`sale`) as 평균 from `sales` where `sale` >= 50000;
select `year`, min(sale) as `최저 매출`, max(sale) as `최고 매출` from `sales`;

##그룹별로 조회하기
select * from `sales` group by `uid`;
select * from `sales` group by `year`;
select * from `sales` group by `uid`, `year`; 
select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(`sale`)
from `sales` 
group by `uid`, `year`;

select `uid`, `year`, sum(`sale`) as `합계`
from `sales`
group by `uid`, `year`
order by `year` asc, `합계` desc;

##그룹화에 검색조건 설정
select `uid`, sum(`sale`) as `합계` from `sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계` 
from `sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계`>= 200000
order by `합계` desc;

##테이블 합치기
create table `Sales2` like `sales`;
insert into `Sales2` select * from `sales`;
update `sales2` set `year` = `year`+3;
select * from `sales2`;

create table `Sales3` like `sales`;
insert into `Sales3` select * from `sales`;

select * from `sales2` union select *  from `sales3`;
(select * from `sales2`) union (select * from `sales3`);
select `uid`, `year`, `sale` from `sales2` 
union
select `uid`, `year`, `sale` from `sales3`;

select `uid`, `year`, sum(`sale`) as `합계`
from `sales2`
group by `uid`, `year`
union
select `uid`, `year`, sum(`sale`) as `합계`  
from `sales3`
group by `uid`, `year`
order by `year` asc, `합계` desc;



##테이블 결합
#내부 조인(INNER JOIN)
select * from `sales` inner join `member` on `sales`.uid = `member`.uid;
select * from `member` inner join `department` on `member`.dep = `department`.depNO;

select * from `sales` as `a` join `member` as `b` on a.uid = b.uid;
select * from `member` as `a` join `department` as `b` on a.dep = b.depNO;

select * from `sales` as a, `member` as b where a.uid = b.uid;
select * from `member` as a, `department` as b where a.dep = b.depNo;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b on a.`uid` = b.`uid`;
select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b using (uid);

#USING()으로 조인을 할 경우 두테이블의 칼럼이 중복되서 나오지 않고 하나만 나온다.
select * from `sales` as a
join `member` as b using (uid); 

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b on a.`uid` = b.`uid`;

select a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(sale) as `합계` from `sales` as a
join `member` as b on a.`uid` = b.`uid`
group by a.`uid`, a.`year` having `합계` >= 100000
order by a.`year` asc, `합계` desc;

select * from `sales` as a
join `member` as b on a.`uid` = b.`uid`
join `department` as c on b.`dep` = c.`depNO`;
select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name`from `sales` as a
join `member` as b on a.`uid` = b.`uid`
join `department` as c on b.`dep` =  c.depNO;
select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` from `sales` as a
join `member` as b on a.`uid` = b.`uid`
join `department` as c on b.`dep` = c.`depNO`
where `sale` > 100000
order by `sale` desc; 

#외부 조인(INNER JOIN)
select * from `sales` as a left join `member` as b on a.`uid` = b.`uid`;
select * from `sales` as a right join `member` as b on a.`uid` = b.`uid`;
select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
left join `member` as b using(uid);

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
right join `member` as b using(uid);

##실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select a.`uid`, a.`name`, a.`pos`, b.`name` from `member` as a 
join `department` as b on a.`dep` = b.`depNo`;

##실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select `name`, `year`, sum(sale) as `매출합계` from `member` as a 
join `sales` as b on a.`uid` = b.`uid`
group by `year`, `name`
having `name` = '김유신' and `year` = 2019; 

##실습 4-16 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 
##         부서명, 직급, 년도 매출 합을 조회하시오. (단, 매출 합이 큰 순서부터 정렬)
select b.`name`, c.`name`, b.`pos`, sum(`sale`) as `매출 합계`
from `sales` as a 
join `member` as b on a.`uid` = b.`uid` 
join `department` as c on b.`dep` = c.`depNO`
where a.`sale` >= 50000 and `year` = 2019
group by a.`uid`
having sum(a.`sale`) >= 100000
order by sum(a.`sale`) desc;















































