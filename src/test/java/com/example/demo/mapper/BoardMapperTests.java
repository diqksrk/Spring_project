package com.example.demo.mapper;

import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log4j2
public class BoardMapperTests {

    @Autowired
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

    @Test
    public void testSearch(){
        Criteria cri=new Criteria();
        cri.setKeyword("새로");
        cri.setType("");

        List<BoardVO> list=mapper.getListWithPaging(cri);

        list.forEach(board->log.info(board));

    }
}
