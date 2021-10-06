alter session set "_ORACLE_SCRIPT"  = true;

alter user hr identified by hr;

create user c##scott IDENTIFIED by tiger
default TABLESPACE users
TEMPORARY TABLESPACE temp;

grant connect, resource, dba to c##scott;

--사용자 관리
-- SCOTT, HR ... 오라클 데이터 베이스가 기본 계정으로 제공하는 사용자들이얌

--오라클 데이터베이스 특징
-- 테이블, 인덱스, 뷰 ... 여러가지 객체가 사용자별로 생성이되고 관리가돼

--데이터 베이스 스키마
-- 데이터 간 관계, 데이터 구조, 제약 조건 등 데이터를 저장 및  관리하기 위해 정의한 데이터 베이스 구조의 범위
-- 오라클은 사용자가 스키마다

-- 사용자 생성
create user c##test IDENTIFIED by 12345;
-- 사용자 비밀번호 변경
alter user c##test identified by 54321;

-- 사용자 삭제 (현재 사용자가 만든 모든 객체 같이 삭제)
drop user c##test cascade;

-- 권한 관리
-- 시스템 권한 : 사용자 생성, 정보 수정, 삭제, 데이터베이스 접근, 객체 생성...

-- 상태 : 사용자 c##test는 create session 권한을 가지고 있지 않음; 로그온이 거절되었습니다.
-- 데이터베이스 접속 권한 부여
grant create session to c##test;
grant create table to c##test;

drop user c##test2 cascade;

create user c##test2 identified by 12345
default TABLESPACE users
TEMPORARY TABLESPACE temp;

-- resource : tigger, sequence, table ... 생성권한들이 모여있는 롤

grant resource, create session, create table to c##test2;

-c##test2 에게 users 테이블 공간 2M(특정공간용량 만큼만) 할당
alter user c##test2 quota 2M on users;

drop user c##test2 cascade; 

create user c##java identified by 12345;
alter user c##java quota 30M on users;
grant resource, connect to c##java;