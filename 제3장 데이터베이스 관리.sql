#날짜 : 2022/08/25
#이름 : 서정현
#내용 : 제3장 데이터베이스 관리

#실습 3-1 계정만들고 데이터베이스에 대한 권한 부여하기
create database `java2_Test_DB`;
create user 'java2_tester'@'%' identified by '1234';
grant all privileges on `java2_test_db`.* to 'java2_tester'@'%';
flush privileges;




#실습 3-2 비밀번호 변경하기
alter user 'java2_tester'@'%' identified by '12345';

drop user 'java2_tester'@'%';
flush privileges;
