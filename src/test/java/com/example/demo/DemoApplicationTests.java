package com.example.demo;

import com.example.demo.controller.PageController;
import com.example.demo.domain.BoardVO;
import com.example.demo.mapper.FBoardMapper;
import com.example.demo.service.BoardService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log4j2
public class DemoApplicationTests {

    @Setter(onMethod_ = @Autowired)
    private PageController pg;

    @Autowired
    BoardService service;

    @Autowired
    private FBoardMapper fBoardMapper;

//    @Test
//    public void testGetDes() {
//        log.info(pg.getDesString());
//    }

//    @Test
//    public void testGetList() {
//        fBoardMapper.getList().forEach(board->log.info(board));
//    }

//    @Test
//    public void testInsert(){
//        TitleDTO board=new TitleDTO();
//        board.setTitle("새글");
//        board.setContents("새내용");
//
//        fBoardMapper.insert(board);
//
//        log.info(board);
//    }

//    @Test
//    public void testRead(){
//        TitleDTO board=fBoardMapper.read(3L);
//        log.info(board);
//    }

//    @Test
//    public void testDelete(){
//        log.info("Delete count "+fBoardMapper.delete(3L));
//    }

    @Test
    public void testUpdate(){
        BoardVO board=new BoardVO();

        board.setBno(2L);
        board.setTitle("수정123");
        board.setContents("수정 내용");

        int count=fBoardMapper.update(board);
        log.info("UPDATE COUNT : "+count);
    }
}
