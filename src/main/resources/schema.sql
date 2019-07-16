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