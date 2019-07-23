package com.example.demo.controller;

import com.example.demo.domain.Criteria;
import com.example.demo.domain.ReplyPageDTO;
import com.example.demo.domain.ReplyVO;
import com.example.demo.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.Media;
import java.util.List;


@Controller
@RequestMapping("/replies/")
@RestController
@Log4j2
@AllArgsConstructor
public class ReplyController {

    private ReplyService service;

    @PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyVO vo){

        log.info("ReplyVO: "+vo);

        int insertCount=service.register(vo);

        log.info("Reply insert COUNT : "+insertCount);

        return insertCount==1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @GetMapping(value = "/pages/{bno}/{page}",
            produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {

         Criteria cri = new Criteria(page,10);
         log.info("get Reply List bno: "+bno);

         log.info("cri : "+cri);

	     return new ResponseEntity<>(service.getListPage(cri,bno), HttpStatus.OK);
	 }

    @GetMapping(value = "/{rno}",
            produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {

        log.info("get: " + rno);

        return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

        log.info("remove: " + rno);

        return service.remove(rno) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @RequestMapping(method = { RequestMethod.PUT,
            RequestMethod.PATCH }, value = "/{rno}", consumes = "application/json", produces = {
            MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> modify( @RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {

        vo.setRno(rno);

        log.info("rno: " + rno);
        log.info("modify: " + vo);

        return service.modify(vo) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
