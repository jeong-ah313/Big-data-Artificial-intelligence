use company;
show tables;

select * from employee;
select fname, lname, bdate from employee where adress like '%Houston%';
#저는 address테이블을 adress 테이블로 잘못 입력했는데 고치게 되면 너무 복잡해질 거 같아서
#그냥 adress로 사용중입니다!

### employee 테이블에 생일이 1900년~1999년 사이에 1월에 출생한 사원의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee where 1900-01-01 < bdate
union		#교집합
select fname, lname, bdate from employee where bdate < 1999-12-30 ;

### employee 테이블에서 사원들의 급여를 중복없이 검색하기
select distinct salary from employee where salary;

### 일반 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee
where dnumber in (select dnumber from dept_locations where dnumber =5);

### exists 연산자를 사용하는 상관 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기


### 일반 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기


### 상관 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기


### 내부 조인을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기
select fname, lname from employee, dependent where ssn=essn;

### 왼쪽 outer join을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기


### 사원들이 근무하는 (소속된) 부서 번호별로 사원들의 숫자와 평균 급여를 검색하기


### 2명 이상의 사원이 근무하는 부서에 대해, 부서 이름별로 사원들의 숫자와 평균 급여를 검색하기


### 아래와 같은 뷰를 생성하기
create view works_info as (select fname, lname, pname, dname, hours 
from employee, department, project, works_on where ssn=essn and dnumber=dnum
and pnumber=pno)

### works_info 뷰에서, 각 사원의 이름과 사원이 참여하는 프로젝트 이름 및 참여 시간(hours)를 검색하기


### 프로젝트 이름별로, 참여하는 사원들의 인원수와 참여 시간의 합계를 검색하기