package com.example.demo.service;

import com.example.demo.domain.BoardVO;
import com.example.demo.mapper.HomeMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomePageServiceImpl implements HomePageService{

    @Setter(onMethod_ = @Autowired)
    private HomeMapper mapper;


    @Override
    public List<BoardVO> getTitleOfBoard(String tbl_name) {
        return mapper.getTitleOfBoard(tbl_name);
    }
}
