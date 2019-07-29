package com.example.demo.service;

import com.example.demo.domain.BoardAttachVO;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import com.example.demo.mapper.BoardAttachMapper;
import com.example.demo.mapper.FBoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
    @Setter(onMethod_ = @Autowired)
    private FBoardMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper attachMapper;

    @Transactional
    @Override
    public void register(BoardVO board) {
        log.info("register......" + board);
        mapper.insertSelectKey(board);

        if (board.getAttachList() == null || board.getAttachList().size() <= 0){
            return;
        }

        board.getAttachList().forEach(attach -> {
            attach.setBno(board.getBno());
            attachMapper.insert(attach);
        });
    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get......" + bno);

        return mapper.read(bno);
    }


    @Transactional
    @Override
    public boolean modify(BoardVO board) {
        log.info("modify......" + board);

        attachMapper.deleteAll(board.getBno());

        boolean modifyResult = mapper.update(board) == 1;

        if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0){

            board.getAttachList().forEach(attach -> {

                attach.setBno(board.getBno());
                attachMapper.insert(attach);
            });

        }

        return modifyResult;
    }

    @Transactional
    @Override
    public boolean remove(Long bno) {
        log.info("remove....."+bno);

        attachMapper.deleteAll(bno);

        return mapper.delete(bno)==1;
    }

//    @Override
//    public List<BoardVO> getList() {
//        log.info("getList........");
//        return mapper.getList();
//    }

    @Override
    public List<BoardVO> getList(Criteria cri, String tbl_name) {
        log.info("getList with criteria "+cri);
        return mapper.getListWithPaging(cri, tbl_name);
    }

    @Override
    public int getTotal(Criteria cri) {
        log.info("get total count");
        return mapper.getTotalCount(cri);
    }

    @Override
    public List<BoardAttachVO> getAttachList(Long bno) {
        log.info("get Attach list by bno" + bno);

        return attachMapper.findByBno(bno);
    }


}
