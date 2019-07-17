package com.example.demo.service;

import com.example.demo.domain.Criteria;
import com.example.demo.domain.ReplyVO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ReplyService {
    public int register(ReplyVO vo);

    public ReplyVO get(Long rno);

    public int modify(ReplyVO vo);

    public int remove(Long rno);

    public List<ReplyVO> getList(Criteria cri, Long bno);


}
