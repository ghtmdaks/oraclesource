-- no 정수형(4), pk, (pk_userTBL)
-- username 가변형문자열(20) null을 허용하지 않음
-- birthYear 정수형(4)
-- addr 가변형문자열(20) null을 허용하지 않음
-- mobile 가변형문자열(20)

create table userTBL(
    no number(4) constraint pk_userTBL primary key,
    username varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(20) not null,
    mobile varchar2(20));
    
-- no : 번호 (순차적인 번호 부여) => 시퀀스 객체
create sequence user_seq;

-- user 삽입
insert into userTBL values(user_seq.nextval, '홍길동', 1985, '서울', '010-1234-5678');
INSERT INTO usertbl VALUES(user_seq.NEXTVAL, '김지우', 1993, '부산', '010-4578-9685');

-- 전체 사용자 조회
select * from userTBL;

-- 특정 사용자 조회
select * from userTBL where no = 1;

-- 특정 사용자 정보 수정
update userTBL
set addr = '인천'
where no = 1;

-- 특정 사용자 삭제
delete from userTBL where no = 3;

commit;