package com.example.demo.mapper;

import com.example.demo.domain.BoardVO;
import org.apache.ibatis.annotations.Param;

public interface HumorMapper {

    public BoardVO getList(@Param("tbl_name") String tbl_name);
}
