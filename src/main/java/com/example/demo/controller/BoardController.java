package com.example.demo.controller;

import com.example.demo.domain.BoardVO;
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
@RequestMapping("/board/*")
@Log4j2
@AllArgsConstructor
public class BoardController {
    private BoardService service;

    @GetMapping("/list")
    public void list(Model model){
        log.info("llist");

        List<BoardVO> vo=new LinkedList<>();
        vo=service.getList();
        log.info("------------------------------------------------");

        log.info("------------------------------------------------");
        model.addAttribute("list", service.getList());
    }

    @GetMapping("/home")
    public String home(){
        return "index";
    }

    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr){
        log.info("register: "+board);
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list";
    }

    @GetMapping("/get")
    public void get(@RequestParam("bno") Long bno, Model model){
        log.info("/get");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, RedirectAttributes rttr){
        log.info("modify : "+board);

        if (service.modify(board)){
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/board/list";
    }

     @PostMapping("/remove")
     public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr)
     {
         log.info("remove..." + bno);
         if (service.remove(bno)) {
             rttr.addFlashAttribute("result", "success");
         }
         return "redirect:/board/list";
     }
}
