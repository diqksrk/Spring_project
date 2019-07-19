package com.example.demo.service;

import com.example.demo.domain.Criteria;
import com.example.demo.domain.ReplyPageDTO;
import com.example.demo.domain.ReplyVO;
import com.example.demo.mapper.FBoardMapper;
import com.example.demo.mapper.ReplyMapper;
import com.example.demo.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j2
@AllArgsConstructor
@Service
public class ReplyServiceImpl implements ReplyService{

    private ReplyMapper mapper;

    private FBoardMapper boardmapper;

    @Transactional
    @Override
    public int register(ReplyVO vo) {
        log.info("register........"+vo);

        boardmapper.updateReplyCnt(vo.getBno(),1);

        return mapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {
        log.info("get........" + rno);
        return mapper.read(rno);
    }

    @Override
    public int modify(ReplyVO vo) {

        log.info("modify....."+vo);
        return mapper.update(vo);
    }

    @Transactional
    @Override
    public int remove(Long rno) {

        log.info("remove....."+rno);

        ReplyVO vo=mapper.read(rno);

        boardmapper.updateReplyCnt(vo.getBno(), -1);
        return mapper.delete(rno);
    }

    @Override
    public ReplyPageDTO getListPage(Criteria cri, Long bno) {
        return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri,bno));
    }

    @Override
    public List<ReplyVO> getList(Criteria cri, Long bno) {

        log.info("get Reply List of a Board "+bno);
        return mapper.getListWithPaging(cri,bno);
    }
}
