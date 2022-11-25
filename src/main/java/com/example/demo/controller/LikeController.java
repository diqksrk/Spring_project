package com.example.demo.controller;


import com.example.demo.domain.AttachLikeVO;
import com.example.demo.domain.ReplyVO;
import com.example.demo.service.UtilService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/like/")
@Log4j2
public class LikeController {

    @Autowired
    private UtilService utilService;

//    @PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE}


    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody AttachLikeVO vo){

        log.info("vo  : "+vo);
        int insertCount = utilService.addLike(vo);

        log.info("Reply INSERT COUNT : "+insertCount);

        return insertCount==1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


    @GetMapping("/{bno}/{userid}")
    public ResponseEntity<Map> getUserCount(AttachLikeVO vo){
        Map<String, Integer> map = new HashMap<>();
        map.put("total", utilService.getLikeCount(vo));
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @DeleteMapping("/{bno}/{userid}")
    public ResponseEntity<String> delete(@RequestBody AttachLikeVO vo){

        log.info("vo  : "+vo);
        int deleteCount = utilService.remove(vo);

        log.info("Reply delete COUNT : "+ deleteCount);

        return deleteCount==1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


    @GetMapping("/{bno}")
    public ResponseEntity<Map> get(@PathVariable("bno") Long bno){
        Map<String, Integer> map = new HashMap<>();
        map.put("total", utilService.get(bno));
        return new ResponseEntity<>(map, HttpStatus.OK);
    }







//    public void modify(){
//
//    }

//    @GetMapping(value = "/get")
//    public void get(@RequestParam("bno") Long bno, Model model){
//        log.info("12312321312312312 : "+bno);
//
//        int total = utilService.get(bno);
//
//        log.info("total.............." + total);
//
//        model.addAttribute("total", total);
//    }

}
