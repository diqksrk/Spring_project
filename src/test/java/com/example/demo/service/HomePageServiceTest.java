package com.example.demo.service;


import com.example.demo.domain.BoardVO;
import lombok.Setter;
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
public class HomePageServiceTest {

    @Setter(onMethod_ = @Autowired)
    private HomePageService homePageService;

    @Test
    public void getTitleTest(){
        List<BoardVO> boardVO= homePageService.getTitleOfBoard("tbl_board");

        log.info(boardVO);

    }


}
