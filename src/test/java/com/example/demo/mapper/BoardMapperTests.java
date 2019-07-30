package com.example.demo.mapper;

import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.example.demo.mapper.FBoardMapper;


import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log4j2
public class BoardMapperTests {

    @Setter(onMethod_ = @Autowired)
    private FBoardMapper mapper;

//    @Test
//    public void testPaging(){
//        Criteria cri=new Criteria();
//
//        cri.setPageNum((2));
//        cri.setAmount(10);
//
//        List<BoardVO> list=mapper.getListWithPaging(cri);
//
//        list.forEach(board->log.info(board.getBno()));
//    }

//    @Test
//    public void testInsert(){
//        BoardVO boardVO = new BoardVO();
//
//        boardVO.setTitle("dd");
//        boardVO.setContents("qqq");
//        boardVO.setWriter("admin00");
//
//        mapper.insert(boardVO);
//    }

//    @Test
    public void testInsertSelectKey(){
        BoardVO boardVO = new BoardVO();

        boardVO.setTitle("dd");
        boardVO.setContents("qqq");
        boardVO.setWriter("admin00");

        mapper.insertSelectKey(boardVO);
    }

//    @Test
    public void testRead(){
        BoardVO board = mapper.read(1048644L);

        log.info(board);
    }

//    @Test
//    public void testSearch(){
//        Criteria cri=new Criteria();
//        cri.setKeyword("새로");
//        cri.setType("");
//
//        List<BoardVO> list=mapper.getListWithPaging(cri);
//
//        list.forEach(board->log.info(board));
//
//    }

//    @Test
//    public void pagingTest(){
//        Criteria cri = new Criteria();
//        cri.setAmount(10);
//        cri.setPageNum(1);
//
//        List<BoardVO> list=mapper.getListWithPaging(cri, "tbl_board");
//
//        list.forEach(board->log.info(board));
//
//    }

    @Test
    public void getCountTest(){
        Criteria cri = new Criteria();

        int ccount = mapper.getTotalCount(cri, "tbl_humor");

        log.info("123123123213" + ccount);
    }


}
