insert into `company` values ('그린컴퓨터', '홍길동', '051-111-1001');
insert into `company` values ('꿈나라', '아무개', '031-222-1001');
insert into `company` values ('행복', '홍길동', '051-333-1001');

insert into `book` values ('b101', '소나기', 12000, '그린컴퓨터');
insert into `book` values ('b102', '행복', 9000, '꿈나라');
insert into `book` values ('b103', '겨울왕국', 15000, '행복');

insert into `customer` values ('c101', '홍길동', '010-1234-1001', '경기도 안양시');
insert into `customer` values ('c102', '김유신', '010-1234-1002', '경상만도 밀양시');
insert into `customer` values ('c103', '장보고', '010-1234-1003', '부산시 사하구');
insert into `customer` values ('c104', '김춘추', '010-1234-1004', '부산시 부산진구');
insert into `customer` values ('c105', '강감찬', '010-1234-1005', '경상남도 남해시');
insert into `customer` values ('c106', '손흥민', '010-1234-1006', '서울시 마포구');

insert into `order` values ('o101', 'c102', 'b101', '2022-09-15', 20000);
insert into `order` values ('o102', 'c106', 'b102', '2022-09-12', 9000);
insert into `order` values ('o103', 'c101', 'b101', '2022-09-05', 15000);
insert into `order` values ('o104', 'c103', 'b103', '2022-09-05', 15000);
insert into `order` values ('o105', 'c105', 'b101', '2022-09-05', 20000);
insert into `order` values ('o106', 'c101', 'b102', '2022-09-12', 9000);
insert into `order` values ('o107', 'c105', 'b101', '2022-09-05', 20000);
insert into `order` values ('o108', 'c104', 'b101', '2022-09-15', 20000);
insert into `order` values ('o109', 'c102', 'b102', '2022-09-05', 9000);
insert into `order` values ('o110', 'c103', 'b103', '2022-09-28', 15000);

drop database `java2_md_bookstore`;

select * from `company` as a join
`book` as b on a.`company` = b.`company` join
`order` as c on b.b_id = c.b_id join
`customer` as d on c.c_id = d.c_id;
