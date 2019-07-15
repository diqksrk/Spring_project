CREATE TABLE BOARD_TABLE (
RNO INTEGER,
TITLE VARCHAR2(20),
CONTENTS LONG,
CREATION_DATE DATE DEFAULT SYSDATE);

create sequence seq_board;

alter table board_table add constraint pk_test_board primary key(rno);

insert into board_table (RNO, TITLE, CONTENTS) values (seq_board.nextval, 'goo', 'goooo');
insert into board_table (RNO, TITLE, CONTENTS) values (seq_board.nextval, 'boo', 'boooo');