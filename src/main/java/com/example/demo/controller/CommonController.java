package com.example.demo.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j2
public class CommonController {

    @GetMapping("/customLogin")
    public String loginInput(String error, String logout, Model model) {

        log.info("error: " + error);
        log.info("logout: " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error Check Your Account");
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout!!");
        }
        return "board/customLogin";
    }

    @GetMapping("/customLogout")
    public String logoutGET() {

        log.info("custom logout");
        return "sample/customLogout";
    }

    @PostMapping("/customLogout")
    public String logoutPost() {

        log.info("post custom logout");

        return "sample/customLogout";
    }



}
