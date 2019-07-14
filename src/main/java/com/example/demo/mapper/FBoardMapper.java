package com.example.demo.mapper;

import com.example.demo.domain.TitleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface FBoardMapper {
    public String getTitle();

    public List<TitleDTO> selectAllBoard();
}
