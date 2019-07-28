package com.example.demo.controller;


import com.example.demo.domain.MemberVO;
import com.example.demo.service.UserService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@Log4j2
public class UserDetailController {

    @Setter(onMethod_ = @Autowired)
    private UserService userService;

    @PostMapping()
    public ResponseEntity<String> register(MemberVO vo){
        log.info(vo);

        int insertCount = userService.register(vo);

        return insertCount==1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping("/register")
    public String signUp(){
        return "/customSignUp";
    }
}
