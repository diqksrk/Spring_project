package com.example.demo.controller;

import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import com.example.demo.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/board")
@Log4j2
@AllArgsConstructor
public class BoardController {
    private BoardService service;

    @GetMapping("/list")
    public void list(Criteria cri, Model model){
        log.info("list");
        model.addAttribute("list", service.getList(cri));
    }

    @GetMapping("")
    public String board(Model model){
        log.info("list");
//        model.addAttribute("list", service.getList());
        return "board/list";
    }

    @GetMapping("/register")
    public void register(){

    }

    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr) {
        log.info("register: " + board);
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model){
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, RedirectAttributes rttr){
        log.info("modify : "+board);

        if (service.modify(board)){
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/board";
    }

     @PostMapping("/remove")
     public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr)
     {
         log.info("remove..." + bno);
         if (service.remove(bno)) {
             rttr.addFlashAttribute("result", "success");
         }
         return "redirect:/board";
     }
}
