package com.example.demo.service;

import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public interface BoardService {

    public void register(BoardVO titleDTO);

    public BoardVO get(Long bno);

    public boolean modify(BoardVO boardVO);

    public boolean remove(Long bno);

//    public List<BoardVO> getList();

    public List<BoardVO> getList(Criteria cri);
}
