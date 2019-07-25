package com.example.demo.mapper;

import com.example.demo.domain.AttachLikeVO;
import com.example.demo.domain.ReplyVO;
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
public class LikeMapperTest {

    @Setter(onMethod_ = @Autowired)
    private LikeMapper mapper;

    @Test
    public void LikeTest(){
        AttachLikeVO attachLikeVO = new AttachLikeVO();

        attachLikeVO.setBno(1048645L);
        attachLikeVO.setUserid("admin90");

        mapper.insert(attachLikeVO);
    }

    @Test
    public void LikeDelete(){

    }

}








