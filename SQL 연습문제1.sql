#날짜 : 2022/08/29
#이름 : 서정현
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_Shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

DROP USER 'java2_admin'@'%';

#실습 1-2
create table `Customer` (
				`custid` varchar(10) primary key,
				`name` varchar(10) not null,
				`hp` char(13) default null, 
				`addr` varchar(100) default null, 
				`rdate` date not null
 );
 
 create table `Product` (
				`prodNo` int auto_increment primary key,
				`prodName` varchar(10) not null,
				`stock` int not null default 0, 
				`price` int default null, 
				`company` varchar(20) not null
 );
 
 
  create table `Order` (
				`orderNo` int auto_increment primary key,
				`orderId` varchar(10) not null,
				`orderProduct` int not null, 
				`orderCount` int default 1, 
				`orderDate` datetime not null
 );
 
#실습 1-3 
#고객 테이블에 데이터 추가
insert into `Customer` values('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `Customer` values('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` values('c105', '이성계', null, null, '2022-01-05');
insert into `Customer` values('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` values('c107', '허준', null, null, '2022-01-07');
insert into `Customer` values('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

#제품 테이블에 데이터 추가
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('새우깡', 5000, 1500, '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('초코파이', 2500, 2500, '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('포카칩', 3600, 1700, '오리온');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('양파링', 1250, 1800, '농심');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('죠리퐁', 2200, null, '크라운');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('마카렛트', 3500, 3500, '롯데');
insert into `Product` (`prodName`, `stock`, `price`, `company`)values('뿌셔뿌셔', 1650, 1200, '오뚜기');

#주문 테이블에 데이터 추가
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)values('c107', 6, 1, '2022-07-05 14:21:03');

#실습 1-4 고객 테이블에 존재하는 모든 속성을 조회 하시오.
select * from `customer`;

#실습 1-5 고객 테이블에서 고객 아이디, 이름, 휴대폰 번호를 조회 하시오.
select `custId`, `name`, `hp` from `customer`;

#실습 1-6 제품 테이블에 존재하는 모든 속성을 조회 하시오.
select * from `product`;

#실습 1-7 제품 테이블에서 제조업체를 조회 하시오.
select `company` from `product`;

#실습 1-8 제품 테이블에서 제조업체를 중복 없이 조회 하시오.
select distinct(company) from `product`;

#실습 1-9 제품 테이블에서 제품명과 단가를 조회 하시오.
select `prodName`, `price` from `product`;

#실습 1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 `조정단가`로 출력하시오.
select `prodName`, `price` + 500 as `조정단가` from `product`;

#실습 1-11 제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가를 조회하시오.
select `prodName`, `stock`, `price` from `product` where `company` = '오리온';

#실습 1-12 주문 테이블에서 'c102'고객이 주문한 주문제품, 수량, 주문일자를 조회하시오.
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습 1-13 주문 테이블에서 'c102' 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회하시오.
select `orderProduct`,  `orderCount`, `orderDate` from `Order` 
where `orderId` = 'c102' and `orderCount` >= 2;

#실습 1-14 제품 테이블에서 단가가 1,000원 이상 2,000원 이하인 제품을 조회하시오.
select * from `product` where price between 1000 and 2000;

 
#실습 1-15 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오.
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '김%';

#실습 1-16 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오.
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '__';

#실습 1-17 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객을 조회하시오.
select * from `customer` where `hp` is null;

#실습 1-18 고객 테이블에서 주소가 입력된 고객을 조회하시오.
select * from `customer` where `addr` is not null;

#실습 1-19 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객을 조회하시오.
select * from `customer` order by `rdate` desc;

#실습 1-20 주문 테이블에서 수량이 3개 이상인 주문내용을 조회하시오. 단 주문 수량으로 내림차순 정렬하고,
#		  수량이 같으면 제품번호를 기준으로 오름차순으로 정렬하시오.
select * from `Order`
where `orderCount` >= 3 
order by `orderCount` desc, `orderProduct` asc;
 
#실습 1-21 제품 테이블에서 모든 제품의 단가 평균을 조회하시오.
select avg(price) from `product`;

#실습 1-22 '농심'에서 제조한 제품의 제고량 합계를 조회하시오.
select sum(stock) as `재고량 합계` from `product` where `company` = '농심';

#실습 1-23 고객 테이블에 고객이 몇 명 등록되어 있는지 조회하시오.
select count(*) as `고객수` from `customer`;

#실습 1-24 제품 테이블에서 제조업체의 수를 조회하시오.
select count(distinct(`company`)) as `제조업체 수` from `product`;

#실습 1-25 주문 테이블에서 주문제품별 수량의 합계를 조회하시오.
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order`
group by `orderProduct`
order by `orderProduct`;

#실습 1-26 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오.
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `product`
group by `company`
order by `company`;

#실습 1-27 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오.
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `product`
group by `company`
having count(*) >= 2;

#실습 1-28 주문 테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 조회하시오.
select `orderProduct`, `orderId`, sum(orderCount) as `총 주문수량` from `Order`
group by `orderProduct`, `orderId`
order by `orderProduct`;

#실습 1-29 'c102' 고객이 주문한 제품의 이름을 조회하시오.
select `orderId`, `prodName` from `Order` as a
join `product` as b on a.`orderProduct` = b.`prodNo`
where `orderId` = 'c102';

#실습 1-30 주문일자가 7월 3일인 고객의 아이디, 이름, 상품명 그리고 주문 날짜시간을 조회하시오.
select `custId`, `name`, `prodName`, `orderDate` from `customer` as a
join `order` as b on a.`custId` = b.`orderId`
join `product` as c on b.`orderProduct` = c.`prodNo`
where Month(`orderDate`) = '07' and DAY(`orderDate`) = '03';
# where substr(`orderDate`, 1, 10) = '2022-07-03';

select o.orderNo, c.name, p.prodName, o.orderCount, o.orderDate from `order` as o 
join `customer` as c on o.orderid = c.custid
join `product` as p on o.orderProduct = p.prodNo;

INSERT INTO `order` SET
		`orderId`='c101', 	
		       `orderProduct`=2, 	
		       `orderCount`=3, 	
		       `orderDate`= NOW();

UPDATE `product` SET `stock`=`stock`- (Select `orderCount` from `order` order by orderDate desc limit 1)   WHERE `prodNo`= 2; 

Select `orderCount` from `order` order by orderDate desc limit 1;