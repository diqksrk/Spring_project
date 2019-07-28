package com.example.demo.mapper;

import com.example.demo.domain.MemberVO;

public interface MemberMapper {

    public MemberVO read(String userid);

    public int insert(MemberVO vo);
}