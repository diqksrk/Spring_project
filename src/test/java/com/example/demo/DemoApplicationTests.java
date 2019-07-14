package com.example.demo;

import com.example.demo.controller.PageController;
import com.example.demo.domain.TitleDTO;
import com.example.demo.service.BoardService;
import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class DemoApplicationTests {

//    @Setter(onMethod_ = @Autowired)
//    private PageController pg;

    @Autowired
    BoardService service;

//    @Test
//    public void testGetDes() {
////        log.info(pg.getDesString());
//    }

    @Test
    public void getAllCity() {
        List<TitleDTO> boards = service.getAllBoard();
//        log.info("board : {}", boards);
    }
}
