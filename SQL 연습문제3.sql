#날짜 : 2022/08/31
#이름 : 서정현
#내용 : SQL 연습문제3

#실습3-1
create database `java2_College`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on `java2_College`.* to 'java2_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
	`stdNo`varchar(8) primary key, 
    `stdname` varchar(20) not null,
    `stdHp` varchar(13) unique not null,
    `stdYear` int not null,
    `stdAddress` varchar(100) default null
    );
    
create table `Lecture`(
	`lecNo` int primary key, 
    `lecname` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10) default null
    );    

create table `Register`(
	`regStdNo` varchar(8) not null, 
    `regLecNo` int not null,
    `regMidScore` int ,
    `regFinalScore` int DEFAULT 0,
    `regTotalScore` int DEFAULT 0,
    `regGrade` char(1) DEFAULT '-'
    );   
    
    
#실습3-3
insert into `Student` values('20201016', '김유신', '010-1234-1001', 3, null);
insert into `Student` values('20201126', '김춘추', '010-1234-1002', 3, "경상남도 경주시");
insert into `Student` values('20210216', '장보고', '010-1234-1003', 2, "전라남도 완도시");
insert into `Student` values('20210326', '강감찬', '010-1234-1004', 2, "서울시 영등포구");
insert into `Student` values('20220416', '이순신', '010-1234-1005', 1, "부산시 부산진구");
insert into `Student` values('20220521', '송상현', '010-1234-1006', 1, "부산시 동래구");

insert into `Lecture` values(159, '인지행동심리학', 3, 40, "본304");
insert into `Lecture` values(167, '운영체제론', 3, 25, "본B05");
insert into `Lecture` values(234, '중급 영문법', 3, 20, "본201");
insert into `Lecture` values(239, '세법개론', 3, 40, "본204");
insert into `Lecture` values(248, '빅데이터 개론', 3, 20, "본B01");
insert into `Lecture` values(253, '컴퓨터사고와 코딩', 2, 10, "본B02");
insert into `Lecture` values(349, '사회복지 마케팅', 2, 50, "본301");

insert into `Register`VALUES('20201126', 234, 100, 80, 180, 'A');
insert into `Register`VALUES('20201016', 248, 80, 80, 160, 'B');
insert into `Register`VALUES('20201016', 253, 90, 90, 180, 'A');
insert into `Register`VALUES('20201126', 239, 70, 80, 150, 'C');
insert into `Register`VALUES('20210216', 349, 85, 95, 180, 'A');
insert into `Register`values('20210326', 349, 50, 40, 90, 'F');
insert into `Register`VALUES('20201016', 167, 80, 60, 140, 'C');
insert into `Register`values('20220416', 349, 95, 50, 145, 'C');

#실습3-4 강좌를 조회하시오.
select * from `lecture`;

#실습3-5 학생을 조회하시오.
select * from `Student`;

#실습3-6 수강신청 내역을 조회하시오.
select * from `register`;

#실습3-7 3학년 학생을 조회하시오.
select * from `student` where `stdYear` = 3;

#실습3-8 2학점 짜리 강좌를 조회하시오.
select * from `lecture` where `lecCredit` = 2;

#실습3-9 아래와 같이 중간고사, 기말고사 점수를 입력 후 조회하시오.
update `register` set `regMidScore` = 36, `regfinalScore` = 42 
where `regStdNo` = '20201126' and `regLecNo` = 234;
update `register` set `regMidScore` = 24, `regfinalScore` = 62 
where `regStdNo` = '20201016' and `regLecNo` = 248;
update `register` set `regMidScore` = 28, `regfinalScore` = 40 
where `regStdNo` = '20201016' and `regLecNo` = 253;
update `register` set `regMidScore` = 37, `regfinalScore` = 57 
where `regStdNo` = '20201126' and `regLecNo` = 239;
update `register` set `regMidScore` = 28, `regfinalScore` = 68 
where `regStdNo` = '20210216' and `regLecNo` = 349;
update `register` set `regMidScore` = 16, `regfinalScore` = 65 
where `regStdNo` = '20210326' and `regLecNo` =349;
update `register` set `regMidScore` = 18, `regfinalScore` = 38
where `regStdNo` = '20201016' and `regLecNo` = 167;
update `register` set `regMidScore` = 25, `regfinalScore` = 58
where `regStdNo` = '20220416' and `regLecNo` = 349;

select * from `register`;

#실습3-10 아래와 같이 총점과 등급을 입력 후 조회하시오.
update `register` set 
	`regTotalScore` = `regMidScore` + `regFinalScore`,
	`regGrade` = if(`regTotalScore` >= 90, 'A',
				 if(`regTotalScore` >= 80, 'B',
                 if(`regTotalScore` >=70, 'C',
                 if(`regTotalScore` >= 60, 'D', 'F'))));

select * from `register`;

#실습3-11 점수가 큰 순서로 정렬하시오.
select * from `register` order by `regtotalScore` desc;

#실습3-12 강좌번호가 349번 가운데 총점가 가장 큰 순서로 조회하시오.
select * from `register` where `regLecNo` = 349 order by `regtotalScore` desc;

#실습3-13 30시간 이상인 강좌를 조회하시오.
select * from `lecture` where `lecTime` >= 30;

#실습3-14 강좌명과 강의실을 조회하시오.
select `lecname`, `lecClass` from `lecture`;

#실습3-15 학번과 이름을 조회하시오.
select `stdNo`, `stdName` from `student`;

#실습3-16 주소를 입력하지 않은 학생을 조회하시오.
select * from `Student`where `stdAddress` is null;

#실습3-17 부산에 거주하는 학생을 조회하시오.
select * from `student` where `stdAddress` like '부산%';

#실습3-18 학생과 수강 테이블을 결합하시오. 
# 		 단 수강신청 하지 않아 점수가 없어도 조회 될 것
select * from `student` as a left join
`register` as b on a.stdNo = b.regStdNo;

#실습3-19 아래와 같이 조회하시오.
select 
	`stdNo`, 
    `stdName`, 
    `regLecNo`,
    `regMidScore`,
    `regFinalScore`, 
    `regtotalScore`, 
    `regGrade` 
from `student` as a, `register` as b where a.stdNo = b.regStdNo
order by `stdNo`;

#실습3-20 강좌번호 349를 수강 신청한 학생의 이름과 학번을 조횧하시오.
select distinct`stdName`, `stdNo`, `regLecNo`
from `student` as a
join `register` as b
on a.stdNo = b.regStdNo
where `regLecNo` = 349;

#실습3-21 학생별 수강 신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오.
select 
	`stdNo`, 
    `stdname`,
    Count(`stdNo`) as `수강신청 건수`,
	sum(`regtotalScore`) as `종합점수`,
    sum(`regtotalScore`) / count(`stdno`) as `평균`
from `student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by `stdNo`
order by `수강신청 건수` desc;


#실습3-22 수강 테이블과 강좌 테이블을 결합하시오.
select * from `register` as a
join `lecture` as b on a.regLecNo = b.lecNo;

#실습3-23 아래와 같이 조회하시오.
select
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `register` as a join
`lecture` as b on a.regLecNo = b.lecNo;

#실습3-24 '사회복지 마케팅' 강좌를 신청한 건수와 평균을 조회하시오.
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `register` as a join `lecture` as b
on a.regLecNo = b.lecNo
where `lecNo` = 349;

#실습3-25 'A'등급을 받은 학번과 강좌명을 조회하시오.
select
	`regStdNo`,
    `lecName`
from `register` as a join `lecture` as b 
on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습3-26 학생테이블과 수강테이블 그리고 강좌테이블을 결합하시오.
select * from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
order by `stdyear` desc, `stdname`;

#실습3-27 아래와 같이 조회하시오.
select
	`stdNo`,
    `stdname`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
order by `regGrade` ;

#실습3-28 'F' 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
select
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` = 'F';

#실습3-29 학생별 이수학점을 조회하시오. 단 F등급은 받은 과목은 학점으로 인정되지 않음
select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` <> 'F'
group by `stdNo`
order by `stdNo`;

#실습3-30 신청과목과 이수과목을 조회하시오. 단 F등급은 받은 과목을 이수과목으로 인정 안됨
select
	`stdNo`,
    `stdName`,
    group_concat(`lecName`) as `신청과목`,
    group_concat(if(`regtotalScore` >= 60, `lecName`, null)) as `이수과목`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
group by `stdNo`;


SELECT r.*, s.stdname, l.lecname FROM `register` r join
`student` s ON r.`regStdNo` = s.`stdNo` JOIN
`lecture` l ON r.regLecNo = l.lecNo
WHERE r.regStdNo =  '20220416';