package com.example.demo.controller;

import com.example.demo.service.BoardService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/title")
@Log
public class PageController {
    @Autowired
    private BoardService boardService;

//    @RequestMapping("ex06")
//    public @ResponseBody TitleDTO ex06(){
//        String msg="{\"name\" : \"홍길동\"}";
//
//        HttpHeaders httpHeaders=new HttpHeaders();
//        httpHeaders.add("Context-Type", "application/json;charset=UTF-8");
//        return new ResponseEntity<ApiResponseMessage>(msg, httpHeaders, HttpStatus.OK);
//    }

    @GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
    public String getText() {
        log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
        return "안녕하세요";
    }

    @GetMapping("")
    public @ResponseBody String getDesString(){

        return "";
    }
}
