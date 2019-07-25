package com.example.demo.service;

import com.example.demo.domain.AttachLikeVO;
import com.example.demo.mapper.LikeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service
public class UtilServiceImpl implements UtilService{

    @Setter(onMethod_ = @Autowired)
    private LikeMapper mapper;

    @Override
    public int addLike(AttachLikeVO vo) {
        log.info("addLike : "+ vo);

        return mapper.insert(vo);
    }

    @Override
    public int remove(AttachLikeVO vo) {
        log.info("remove bno : " + vo.getBno());
        log.info("remove userid : " +vo.getUserid());

        return mapper.delete(vo);
    }

    @Override
    public int get(Long bno) {

        log.info("log.......................");

        return mapper.getTotalCount(bno);
    }

    @Override
    public int getLikeCount(AttachLikeVO vo) {
        log.info("searching userid : "+vo.getBno());
        log.info("searching bno" + vo.getBno());

        return mapper.getLikeNumber(vo);
    }
}
