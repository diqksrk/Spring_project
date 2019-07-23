package com.example.demo.mapper;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.example.demo.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log4j2
public class MemberMapperTests {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Test
    public void testRead() {

        MemberVO vo = mapper.read("admin90");

        log.info(vo);

        vo.getAuthList().forEach(authVO -> log.info(authVO));

    }
}

