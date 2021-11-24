use company;
set sql_safe_updates = 0;
show tables;

### dept_locations 테이블에 애트리뷰트 phone을 추가하기
select * from dept_locations; 
alter table dept_locations add column phone char(15);
select * from dept_locations;

### dept_locations 테이블에 있는 5개 튜플의 phone 애트리뷰트 값을 임의의 값으로 수정한 후 결과 확인하기 
update dept_locations set phone='010-1234-5678' where  dnumber=1;
update dept_locations set phone='010-2345=6789' where  dnumber=4;
update dept_locations set phone='010-3456-7890' where  dnumber=5;
update dept_locations set phone='010-4567-8901' where  dnumber=5;
update dept_locations set phone='010-5678-9012' where  dnumber=5;
select * from dept_locations;

### project 테이블에 금액 이라는 이름의 애트리뷰트를 추가하기. 데이터 타입은 int로 할 것.
alter table project add column money int(15);
select * from project;

### project 테이블에 있는 6개 튜플의 금액 애트리뷰트 값을 임의의 값으로 수정하기.
update project set money=20 where  pnumber=1;
update project set money=30 where  pnumber=2;
update project set money=40 where  pnumber=3;
update project set money=50 where  pnumber=10;
update project set money=60 where  pnumber=20;
update project set money=70 where  pnumber=30;
select * from project;

### department 테이블에 아래 2개의 튜플을 추가하기
insert into department values('영업부', 7, '333445555', '1990-01-01');
insert into department values('비서실', 8, '999887777', '2010-01-01');
select * from department;

### dept_locations 테이블에 7번 부서의 위치 3개를 추가하기. 애트리뷰트 값은 임의로 부여함.
select * from dept_locations;
alter table dept_locations add column location varchar(15);
insert into dept_locations values(7, 'Houston','010-1111-1111' , 'Chuncheon');
insert into dept_locations values(7, 'Stafford','010-1111-1111' , 'Seoul');
insert into dept_locations values(7, 'Bellaire','010-1111-1111' , 'busan');
select * from dept_locations;

### employee 테이블에 7번 부서에 근무하는 사원 3명을 추가하기. 애트리뷰트 값은 임의로 부여함.
select * from employee;
insert into employee value('jeong','B','Smith','123456799',
'1965-02-05','723 Foundrein, Houston, TX', 'M', 90000, '333445566',7);
insert into employee value('seong','B','Smith','223456799',
'1995-02-05','823 Foundrein, Houston, TX', 'M', 10000, '333445666',7);
insert into employee value('gun','T','Smith','223356788',
'1995-02-05','823 Foundrein, Houston, TX', 'M', 70000, '339845666',7);
select * from employee;

### works_on 테이블에 튜플 5개를 추가함. 애트리뷰트 값은 참조 무결성 조건을 만족하는 임의의 값을 부여함.
select * from works_on;
insert into works_on values('999887777',20,40.5);
insert into works_on values('123456789',30,50.0);
insert into works_on values('888665555',20,20.0);
insert into works_on values('453453453',10,25.0);
insert into works_on values('888665555',10,10.0);
select * from works_on;

### 30000 이상의 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, lname, bdate from employee where salary>30000;

###  5번 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname,lname, bdate from employee where dno=5 and salary>30000;

### 'Research' 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, lname, bdate from employee, department 
where dname='Research' and salary>30000 and dno=dnumber;


### 'Research' 부서에 근무하는 사람들의 ssn과 그 사람이 참여하는 프로젝트 번호를 검색하기.
select ssn, pno from employee, works_on, department
where dname='Research' and dno=dnumber and ssn=essn;

### 'Research' 부서에 근무하는 사람들의 이름과 그 사람이 참여하는 프로젝트의 이름을 검색하기.
select fname, lname, pname from employee, project, department, works_on
where dname='Research' and dno=dnumber and ssn=essn and pno=pnumber;

### department 테이블에서 '영업부'의 부서번호, 관리자 사원번호(mgr_ssn)를 검색하기.
select dnumber, mgr_ssn from department where dname='영업부';

### '영업부'가 위치한 위치의 위치(dlocation)과 전화번호(phone)을 검색하기.
select dlocation, phone from department, dept_locations where dname='영업부';

### 사원의 이름(fname, lname)과 그 사원의 감독자(멘토)의 이름(fname, lname)을 검색하기.
select fname, lname from employee;

### 사원의 소속부서와 그 사원의 감독자(멘토)의 소속부서가 서로 다른 사원의 이름과 감독자(멘토)의 이름을 검색하기
select fname, lname from employee,department where (fname|lname)!=dname;	#이건 잘 모르겠어요..