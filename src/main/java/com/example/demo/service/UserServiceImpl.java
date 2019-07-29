package com.example.demo.service;

import com.example.demo.domain.MemberVO;
import com.example.demo.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j2
public class UserServiceImpl implements UserService{

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwencoder;

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    @Transactional
    public int registerMember(MemberVO vo) {
        vo.setUserpw(pwencoder.encode(vo.getUserpw()));

        log.info("register : "+vo);

        mapper.insertMember(vo);

        return mapper.insertAuth(vo.getUserid());
    }
}
