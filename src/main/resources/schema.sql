<!-- 보드 게시판 테이블 쿼리문 -->

CREATE TABLE BOARD_TABLE (
BNO NUMBER(10,0),
TITLE VARCHAR2(200),
CONTENTS VARCHAR2(1000),
CREATIONDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE);

create sequence seq_board;

alter table board_table add constraint pk_test_board primary key(bno);

insert into board_table (BNO, TITLE, CONTENTS) values (seq_board.nextval, 'goo', 'goooo');
insert into board_table (BNO, TITLE, CONTENTS) values (seq_board.nextval, 'boo', 'boooo');

<!-- 댓글 처리를 위한 테이블 관련 쿼리문 -->
create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key (bno) references board_table (bno);

<!-- insert example -->
insert into tbl_reply (rno, bno, reply, replyer) values (seq_reply.nextval, 1048616, 'bzxc', 'dasdas');