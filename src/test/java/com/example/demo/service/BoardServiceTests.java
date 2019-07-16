package com.example.demo.service;

import static org.junit.Assert.assertNotNull;
import com.example.demo.controller.PageController;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
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
public class BoardServiceTests {

    @Setter(onMethod_ = @Autowired)
    private BoardService service;

//    @Test
//    public void testExist(){
//        log.info(service);
//        assertNotNull(service);
//    }

//    @Test
//    public void testRegister(){
//        BoardVO board=new BoardVO();
//        board.setTitle("새 글");
//        board.setContents("새 내용");
//
//        service.register(board);
//
//        log.info("생성 된 게시물의 번호 : "+board.getBno());
//    }

    @Test
    public void testGetList(){
        service.getList(new Criteria(2,10)).forEach(board->log.info(board));
    }

//    @Test
//    public void testGet(){
//        log.info(service.get(1L));
//    }

//    @Test
//    public void testDelete(){
//        log.info("REMOVE result: "+service.remove(2L));
//    }
//
//    @Test
//    public void testUpdate(){
//        BoardVO board=service.get(1L);
//
//        if (board==null){
//            return ;
//        }
//
//        board.setTitle("제목 수정");
//        log.info("Modify result : "+service.modify(board));
//    }
}
