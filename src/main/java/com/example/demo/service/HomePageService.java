package com.example.demo.service;


import com.example.demo.domain.BoardVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface HomePageService {


    public List<BoardVO> getTitleOfBoard(String tbl_name);
}
