package com.example.demo.service;

import com.example.demo.domain.AttachLikeVO;

public interface UtilService {

    public int get(Long bno);

    public int addLike(AttachLikeVO vo);

    public int remove(AttachLikeVO vo);

    public int getLikeCount(AttachLikeVO vo);
}
