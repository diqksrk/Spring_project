package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/humorboard/")
public class HumorBoardController {

    @GetMapping("/list")
    public void list(){

    }

}
