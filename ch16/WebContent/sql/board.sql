create table board(
    num number primary key, -- primary key
    writer varchar2(20) not null, --작성자
    subject varchar2(50) not null,-- 제목
    content varchar2(500) not null,--내용
    email varchar2(30),--이메일
    readcount number default 0, --읽은 횟수
    password varchar2(20) not null,--암호
    ref number not null, -- 답변글 끼리 그룹
    re_step number not null, -- ref내의 순서
    re_level number not null, -- 들여쓰기
    ip varchar2(30) not null, --작성 ip
    reg_date date default sysdate -- 작성일
);

select * from board;