package com.example.demo.mapper;

import com.example.demo.domain.BoardVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HomeMapper {

    public List<BoardVO> getTitleOfBoard(@Param("tbl_name") String tbl_name);

}
