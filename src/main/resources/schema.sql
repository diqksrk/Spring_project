<!-- 보드 게시판 테이블 쿼리문 -->

CREATE TABLE BOARD_TABLE (
BNO NUMBER(10,0),
TITLE VARCHAR2(200),
CONTENTS VARCHAR2(1000),
WRITER VARCHAR2(20),
CREATIONDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE);

create sequence seq_board;

alter table board_table add constraint pk_test_board primary key(bno);

alter table board_table add (replycnt number default 0);

update board_table set replycnt = (select count(rno) from tbl_reply
where tbl_reply.bno = board_table.bno);

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

<!-- tbl_attach -->

create table tbl_attach (
    uuid varchar2(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    filetype char(1) default 'I',
    bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno)
references board_table(bno);

drop  table tbl_attach;

create table tbl_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) not null,
      username varchar2(100) not null,
      regdate date default sysdate,
      updatedate date default sysdate,
      enabled char(1) default '1');


create table tbl_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) not null,
     constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);




CREATE TABLE tbl_humor (
BNO NUMBER(10,0),
TITLE VARCHAR2(200),
CONTENTS VARCHAR2(1000),
WRITER VARCHAR2(20),
REPLYCNT NUMBER(10,0) default 0,
CREATIONDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE);


create sequence seq_humor_board;

alter table tbl_humor add constraint pk_humor_board primary key(bno);

insert into tbl_humor (BNO, TITLE, CONTENTS, WRITER) values (seq_humor_board.nextval, 'boo', 'boooo', 'admin00');

insert into tbl_humor (BNO, TITLE, CONTENTS,WRITER) (select seq_humor_board.nextval, title, contents,writer from tbl_humor);


create table tbl_humor_reply (
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_humor_reply;

alter table tbl_humor_reply add constraint pk_humor_reply primary key(rno);

alter table tbl_humor_reply add constraint fk_reply_humor
foreign key (bno) references tbl_humor (bno);

insert into tbl_humor_reply (rno, bno, reply, replyer) values (seq_humor_reply.nextval, 61, 'bdasdsa', 'sdasd');


<!-- notice table query-->
CREATE TABLE tbl_notice (
BNO NUMBER(10,0),
TITLE VARCHAR2(200),
CONTENTS VARCHAR2(1000),
WRITER VARCHAR2(20),
REPLYCNT NUMBER(10,0) default 0,
CREATIONDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE);

create sequence seq_notice_board;

alter table tbl_notice add constraint pk_notice_board primary key(bno);

insert into tbl_notice (BNO, TITLE, CONTENTS, WRITER) values (seq_notice_board.nextval, 'boo', 'boooo', 'admin00');

insert into tbl_notice (BNO, TITLE, CONTENTS,WRITER) (select seq_notice_board.nextval, title, contents,writer from tbl_notice);





