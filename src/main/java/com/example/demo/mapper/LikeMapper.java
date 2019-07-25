package com.example.demo.mapper;

import com.example.demo.domain.AttachLikeVO;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;

public interface LikeMapper {

    public int getTotalCount(Long bno);

    public int insert(AttachLikeVO vo);

    public int delete(AttachLikeVO vo);

    public int getLikeNumber(AttachLikeVO vo);

}
