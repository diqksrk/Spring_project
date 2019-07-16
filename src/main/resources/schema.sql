CREATE TABLE BOARD_TABLE (
BNO INTEGER,
TITLE VARCHAR2(20),
CONTENTS VARCHAR2(1000),
CREATION_DATE DATE DEFAULT SYSDATE,
UPDATE_DATE DATE DEFAULT SYSDATE);

create sequence seq_board;

alter table board_table add constraint pk_test_board primary key(bno);

insert into board_table (BNO, TITLE, CONTENTS) values (seq_board.nextval, 'goo', 'goooo');
insert into board_table (BNO, TITLE, CONTENTS) values (seq_board.nextval, 'boo', 'boooo');