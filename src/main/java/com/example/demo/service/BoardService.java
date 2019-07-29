package com.example.demo.service;

import com.example.demo.domain.BoardAttachVO;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BoardService {

    public void register(BoardVO titleDTO);

    public BoardVO get(Long bno);

    public boolean modify(BoardVO boardVO);

    public boolean remove(Long bno);

//    public List<BoardVO> getList();

    public List<BoardVO> getList(String tbl_name, Criteria cri);

    public int getTotal(Criteria cri);

    public List<BoardAttachVO> getAttachList(Long bno);
}
