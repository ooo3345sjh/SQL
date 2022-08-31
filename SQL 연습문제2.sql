#날짜 : 2022/08/30
#이름 : 서정현
#내용 : SQL 연습문제2

#실습2-1
create database `java2_Bank`;
create user 'java2_admin2'@'%' identified by '1234';
grant all privileges on `java2_bank`.* to 'java2_admin2'@'%';
flush privileges;

#실습2-2 

create table `bank_customer`(
	`c_no` varchar(14) primary key,
    `c_name` varchar(20) not null,
    `c_dist` int not null,
    `c_phone` varchar(20) unique not null,
    `c_addr` varchar(100) default null
    );
    
create table `bank_account`(
	`a_no` varchar(11) primary key default '000-00-0000',
    `a_item_dist` varchar(2) not null,
    `a_item_name` varchar(20) not null,
    `a_c_no` varchar(14) not null,
    `a_balance` int default 0 not null, 
    `a_open_data` date not null
    );
    
    
create table `bank_transaction`(
	`t_no` int auto_increment primary key,
    `t_a_no` varchar(11) not null,
    `t_dist` int not null,
    `t_amount` int default 0 not null,
    `t_datetime` datetime not null
    );   
    
#실습2-3
insert into `bank_customer` values('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
insert into `bank_customer` values('220-82-52237', '(주)힌극전산', 2, '02-134-1045', '서울시 강남구');
insert into `bank_customer` values('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
insert into `bank_customer` values('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
insert into `bank_customer` values('750210=1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
insert into `bank_customer` values('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
insert into `bank_customer` values('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
insert into `bank_customer` values('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
insert into `bank_customer` values('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `bank_account` values('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21');
insert into `bank_account` values('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17');
insert into `bank_account` values('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14');
insert into `bank_account` values('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30');
insert into `bank_account` values('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07');
insert into `bank_account` values('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13');
insert into `bank_account` values('101-13-1005', 'S3', '주책청약예금', '941127-1000006', 720800, '2012-10-15');
insert into `bank_account` values('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25');
insert into `bank_account` values('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11');
insert into `bank_account` values('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-1001', 1, 50000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-1003', 2, 120000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-2001', 2, 300000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-12-1002', 1, 1000000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-1001', 3, 0, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-13-1005', 1, 200000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-1001', 1, 450000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-2002', 2, 32000, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-2003', 3, 0, '2022-08-21 04:26:52');
insert into `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`)values('101-11-1003', 1, 75000, '2022-08-21 04:26:52');

#실습2-4 모든 계좌를 조회하시오.
select * from `bank_account`;

#실습2-5 모든 고객을 조회하시오.
select * from `bank_customer`;

#실습2-6 모든 거래내역을 조회하시오.
select * from `bank_transaction`;

#실습2-7 고객의 이름과, 계좌번호를 조회하시오.
select `c_name`, `c_no` from `bank_customer`;

#실습2-8 모든 계좌의 구분번호와 계좌상품 이름 조회하시오.
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습2-9 모든 계좌의 구분번호와 계좌상품 이름 조회하시오. 단, 중복을 제거하시오.
select distinct`a_item_dist`, `a_item_name` from `bank_account`;

#실습2-10 자유저축예금 계좌 중 잔고액이 100만원 이상을 조회하시오.
select * from `bank_account` where `a_item_name` = '자유저축예금' and `a_balance` >= 1000000;

#실습2-11 경기도에 거주하는 고객을 조회하시오.
select * from `bank_customer` where `c_addr` like '경기도%';

#실습2-12 기업고객을 조회하시오.
select * from `bank_customer` where `c_dist` = 2;

#실습2-13 거래내역 중 입금만 조회하시오.
select * from `bank_transaction` where `t_dist` = 1 ;

#실습2-14 출금액이 가장 큰 순서로 조회하시오.
select * from `bank_transaction` where `t_dist` = 2 order by `t_amount` desc;

#실습2-15 입금액의 총합과 평균을 구하시오.
select 
	sum(t_amount) as `입금총합`, 
    avg(t_amount) as `입금평균`
from `bank_transaction`
where `t_dist` = 1;

#실습2-16 출금액의 가장 큰 금액과 가장 작은 금액을 구하시오.
select max(t_amount) as `큰 금액`, min(t_amount) as `작은 금액`
from `bank_transaction`
where `t_dist` = 2;

#실습2-17 자유저축 예금계좌에서 큰 잔고액 순으로 조회하시오.
select * from `bank_account` where `a_item_name` = '자유저축예금' order by `a_balance` desc;

#실습2-18 가장 많은 잔고를 보유한 자유저축 예금계좌를 조회하시오.
select * from `bank_account` where `a_item_dist` = 'S1'
order by `a_balance` desc limit 1;

#실습2-19 거래내역에서 입금액과 출금액이 각각 큰 순서로 조회하시오.
select * from `bank_transaction` where `t_dist` in(1,2)
order by `t_dist`, `t_amount`desc;

#실습2-20 거래내역에서 입금 건수, 출금 건수, 조회 건수를 조회하시오. (여기서 then 이하는 의미 없음.)
select 
	count(case when `t_dist` = 1 then 1 end) as `입금 건수`, 
    count(if(`t_dist`= 2, 1, null)) as `출금 건수`, 
    count(case when `t_dist` = 3 then 1 end) as `조회 건수`
from `bank_transaction`;

#실습2-21 대출관련 계좌의 구분번호를 모두 조회하시오.
select
	`t_dist`,
	case
		when `t_dist` = 1 then '입금'
		when `t_dist` = 2 then '출금'
		when `t_dist` = 3 then '조회'
	end as `type`, 
	`t_a_no`,
    `t_amount`
from `bank_transaction`;

#실습2-22 각 거래별 카운트를 조회하시오.
select `t_dist`, count(`t_no`) from `bank_transaction` group by `t_dist`;

#실습2-23 입금 거래만 계좌별로 합계를 조회하시오.
select `t_a_no`, `t_dist`, sum(`t_amount`)
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no`
order by `t_a_no`;


#실습2-24 입금 거래만 계좌별로 합계 구하고 10만원 이상만 큰 순서로 조회하시오.
select 
	`t_a_no`,
    `t_dist`,
    sum(`t_amount`) as `합계`
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no`
having sum(`t_amount`) >= 100000
order by `합계` desc;

#실습2-25 계좌 테이블과 고객 테이블을 결합 하시오.
select * from `bank_account` as a
join `bank_customer` as b 
on a.`a_c_no` = b.`c_no`;

#실습2-26 아래 그림과 같이 조회 하시오.
select 
	`a_no` as `계좌번호`, 
	`a_item_name` as `계좌이름`,
    `c_no` as `주민번호(사업자번호)`,
    `c_name` as `고객명`,
    `a_balance` as `현재잔액`
from `bank_account` as a
join `bank_customer` as b
on a.`a_c_no` = b.`c_no`;

#실습2-27 거래 테이블과 계좌 테이블을 결합 하시오.
select * from `bank_transaction` as a
join `bank_account` as b
on a.`t_a_no` = b.`a_no`;

select * from `bank_account`;
select * from `bank_transaction`;

#실습2-28 아래 그림과 같이 조회 하시오.
select 
	`t_no` as `거래번호`,
	`t_a_no` as `계좌번호`,
	`a_c_no` as `고객번호(주민번호)`,
	`t_dist` as `거래구분`,
	`t_amount` as `거래금액`,
	`t_datetime` as `거래일자`
from `bank_account` as a
join `bank_transaction` as b
on a.`a_no` = b.`t_a_no`;

#실습2-29 거래 구분이 입금이고 큰 거래금액 순으로 아래와 같이 데이터가 조회되도록 하시오.
select
	`t_no`,
    `a_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`,
    `t_amount`,
    `t_datetime`
from `bank_transaction` as a
join `bank_account`as b on a.t_a_no = b.a_no 
join `bank_customer` as c on b.a_c_no = c.c_no
where `t_dist` = 1
order by `t_amount` desc;

#실습2-30 거래구분이 입금, 출금이고 개인 고객을 대상으로 거래건수를 아래와 같이 조회 하시오.
#		 단, 거래구분은 작은 순서로 거래건수는 큰순서로 정렬 하시오.
select 
	`t_no`,
    `a_no`,
    `c_no`,
    `t_dist`,
    `a_item_name`,
    `c_name`, count(`c_no`) as `거래건수`
from `bank_transaction` as a
join `bank_account`as b on a.t_a_no = b.a_no 
join `bank_customer` as c on b.a_c_no = c.c_no
where `t_dist` in(1,2) and `c_dist` = 1
group by `c_no`
order by `t_dist`, `거래건수` desc;
