package com.example.demo.service;

import com.example.demo.domain.MemberVO;
import com.example.demo.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class UserServiceImpl implements UserService{

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    public int register(MemberVO vo) {

        log.info("register : "+vo);

        return mapper.insert(vo);
    }
}
