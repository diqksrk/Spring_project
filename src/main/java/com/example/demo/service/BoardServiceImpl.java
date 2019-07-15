package com.example.demo.service;

import com.example.demo.domain.BoardVO;
import com.example.demo.mapper.FBoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import sun.awt.image.ImageWatched;

import java.util.LinkedList;
import java.util.List;

@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
    @Setter(onMethod_ = @Autowired)
    private FBoardMapper mapper;

    @Override
    public void register(BoardVO board) {
        log.info("register......" + board);
        mapper.insertSelectKey(board);
    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get......" + bno);

        return mapper.read(bno);
    }

    @Override
    public boolean modify(BoardVO board) {
        log.info("modify......" + board);
        return mapper.update(board)==1;
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove....."+bno);

        return mapper.delete(bno)==1;
    }

    @Override
    public List<BoardVO> getList() {
        log.info("getList........");
        List<BoardVO> vo=new LinkedList<>();
        vo=mapper.getList();
        log.info("------------------------------------------------------------ ");


        return mapper.getList();
    }
}
