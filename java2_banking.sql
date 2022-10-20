
#날짜 : 2022/10/06
#이름 : 서정현


#CUSTOMER 테이블 데이터 삽입
insert into `customer` values('760121-1234567', '정우성', '서울', '1976-01-21', 'jung@gmail.com' , '010-1101-7601', '배우');
insert into `customer` values('750611-1234567', '이정재', '서울', '1975-06-11', 'lee@gmail.com' , '010-1102-7506', '배우');
insert into `customer` values('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com' , '010-1103-8905', '자영업');
insert into `customer` values('790413-1234567', '이나영', '대전', '1979-04-13', 'leeg@naver.com' , '010-2101-7904', '회사원');
insert into `customer` values('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net' , '010-2104-6609', '배우');
insert into `customer` values('790728-1234567', '장동건', '대구', '1979-07-28', 'jang@naver.com' , '010-3101-7907', '배우');
insert into `customer` values('840615-1234567', '고소영', '대구', '1984-06-15', 'goso@daum.net' , '010-4101-8406', '회사원');
insert into `customer` values('651021-1234567', '김연아', '대구', '1965-10-21', 'yuna@daum.net' , '010-5101-6510', '운동선수');
insert into `customer` values('721128-1234567', '유재석', '부산', '1972-11-28', 'yu@gmail.com' , '010-6101-7211', '개그맨');
insert into `customer` values('920907-1234567', '강호동', '부산', '1992-09-07', 'kang@gmail.com' , '010-7103-9209', '개그맨');
insert into `customer` values('891209-1234567', '조민성', '광주', '1989-12-09', 'join@gmail.com' , '010-7104-8912', '배우');
insert into `customer` values('770314-1234567', '강동원', '광주', '1977-03-14', 'dong@naver.com' , '010-8101-7703', '배우');

#ACCOUT 테이블 데이터 삽입
insert into `accounts` values('101-11-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2020-01-21', '정우성');
insert into `accounts` values('101-11-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2020-06-11', '전지현');
insert into `accounts` values('101-11-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30', '이나영');
insert into `accounts` values('101-11-1004', '660912-1234567', '자유입출금', 1000000, 'Y', '2020-04-13', '원빈');
insert into `accounts` values('101-11-1005', '840615-1234567', '자유입출금', 820000, 'Y', '2020-09-12', '고소영');
insert into `accounts` values('101-11-1006', '651021-1234567', '자유입출금', 3520000, 'Y', '2020-07-28', '김연아');
insert into `accounts` values('101-11-1007', '721128-1234567', '자유입출금', 7620500, 'Y', '2020-06-15', '유재석');
insert into `accounts` values('101-11-1008', '920907-1234567', '자유입출금', 3400000, 'Y', '2020-10-21', '강호동');
insert into `accounts` values('101-11-1009', '891209-1234567', '자유입출금', 1763000, 'Y', '2020-11-28', '조인성');
insert into `accounts` values('101-11-1010', '770314-1234567', '자유입출금', 1080000, 'Y', '2020-09-07', '강동원');

#CARDS 테이블 데이터 삽입
insert into `cards` values('1011-1001-1001', '760121-1234567', '101-11-1001', '2020-01-21', 1000000 , '2020-02-10', 'check');
insert into `cards` values('1011-1001-1002', '890530-1234567', '101-11-1002', '2020-06-11', 3000000 , '2020-06-15', 'check');
insert into `cards` values('1011-1001-1003', '790413-1234567', '101-11-1003', '2020-05-30', 5000000 , '2020-06-25', 'credit');
insert into `cards` values('1011-1001-1004', '660912-1234567', '101-11-1004', '2020-04-13', 1000000 , '2020-05-10', 'credit');
insert into `cards` values('1011-1001-1005', '840615-1234567', '101-11-1005', '2020-09-12', 1500000 , '2020-10-10', 'check');
insert into `cards` values('1011-1001-1006', '651021-1234567', '101-11-1006', '2020-07-28', 10000000 , '2020-08-15', 'check');
insert into `cards` values('1011-1001-1007', '721128-1234567', '101-11-1007', '2020-06-15', 2000000 , '2020-07-25', 'credit');
insert into `cards` values('1011-1001-1008', '920907-1234567', '101-11-1008', '2020-10-21', 5000000 , '2020-11-15', 'credit');
insert into `cards` values('1011-1001-1009', '891209-1234567', '101-11-1009', '2020-11-28', 1000000 , '2020-12-10', 'check');
insert into `cards` values('1011-1001-1010', '770314-1234567', '101-11-1010', '2020-09-07', 1000000 , '2020-10-10', 'credit');

#ACC_TRADES 테이블 데이터 삽입
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1001', '입금', '2월 정기급여', 3500000, 4160000 , '2020-02-10 12:36:12');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1003', '출금', 'ATM 출금', 300000, 1200000 , '2020-02-10 12:37:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1008', '입금', '2월 급여', 2800000, 3200000 , '2020-02-10 12:38:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1006', '출금', '2월 공과금', 116200, 3120000 , '2020-02-10 12:39:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1005', '출금', 'ATM 출금', 50000, 820000 , '2020-02-10 12:40:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1006', '입금', '홍길동 이체', 400000, 3520000 , '2020-02-10 12:41:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1007', '출금', '2월 관리비', 145000, 7620500 , '2020-02-10 12:42:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1008', '입금', '홍길동 입금', 200000, 3400000 , '2020-02-10 12:43:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1009', '입금', '연말정산 환급', 112000, 1763000 , '2020-02-10 12:44:21');
insert into `acc_trades` (`acc_id`, `acc_class`, `acc_contents`, `trade_money`, `acc_balance`, `imp_exp_date`) values('101-11-1010', '출금', 'ATM 출금', 30000, 1080000 , '2020-02-10 12:45:21');

# 1) 고객 테이블을 조회하시오.
select * from `customer`;

# 2) 카드 테이블을 조회하시오.
select * from `cards`;

# 3) 예금계좌 테이블을 조회하시오.
select * from `accounts`;

# 4) 예금계좌거래내역 테이블을 조회하시오.
select * from `acc_trades`;

# 5) 카드종류가 신용카드인 고객에 대한 모든 정보(고객명, 고객주소, 고객생년월일, 고객이메일, 고객전화번호, 고객직업)을 조회하시오.
select a.`cust_name`, a.`cust_addr`, a.`cust_birth`, a.`cust_email`, a.`cust_phnum`, a.`cust_job` 
from `customer` as a join `cards` as b 
on a.`cust_jumin` = b.`cust_jumin` and b.`card_type` = 'credit';

# 6) 예금잔고가 4,000,000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소를 조회하시오.
select a.`cust_name`, a.`cust_jumin`, a.`cust_phnum`, a.`cust_addr`
from `customer` as a join `accounts` as b 
on a.`cust_jumin` = b.`cust_jumin` and b.`acc_balance` >= 4000000;



