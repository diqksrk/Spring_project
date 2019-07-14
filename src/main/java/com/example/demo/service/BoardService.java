package com.example.demo.service;

import com.example.demo.domain.TitleDTO;
import com.example.demo.mapper.FBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class BoardService {
    @Autowired
    private FBoardMapper fBoardMapper;

    public String getDes(){
        return fBoardMapper.getTitle();
    }
    public List<TitleDTO> getAllBoard(){
        return fBoardMapper.selectAllBoard();
    }
}
