package com.example.demo.mapper;

import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface FBoardMapper {
    public String getTitle();

    public List<BoardVO> getListWithPaging(Criteria cri);

    public List<BoardVO> getList();

    public void insert(BoardVO boardVO);

    public void insertSelectKey(BoardVO boardVO);

    public BoardVO read(Long bno);

    public int delete(Long bno);

    public int update(BoardVO boardVO);
}
