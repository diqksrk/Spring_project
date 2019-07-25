package com.example.demo.service;


import com.example.demo.domain.AttachLikeVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest
public class UtilServiceTest {

    @Setter(onMethod_ = @Autowired)
    private UtilService utilService;

//    @Test
//    public void getTest(){
//        log.info(utilService.get(1048645L));
//    }

//    @Test
    public void insertTest(){
        AttachLikeVO vo=new AttachLikeVO();
        vo.setBno(1048645L);
        vo.setUserid("admin90");
        log.info(utilService.addLike(vo));
    }

//    @Test
    public void searchTest(){
        AttachLikeVO vo=new AttachLikeVO();
        vo.setBno(1048645L);
        vo.setUserid("admin90");
        log.info(utilService.getLikeCount(vo));
    }

    @Test
    public void deleteTest(){
        AttachLikeVO vo = new AttachLikeVO();
        vo.setBno(1048645L);
        vo.setUserid("admin90");
        log.info(utilService.remove(vo));
    }

}
