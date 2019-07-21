package com.example.demo.controller;

import com.example.demo.domain.BoardAttachVO;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import com.example.demo.domain.PageDTO;
import com.example.demo.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Methods;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.*;
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
        log.info("list " + cri);
        model.addAttribute("list", service.getList(cri));
//        model.addAttribute("pageMaker", new PageDTO(cri,123));

        int total=service.getTotal(cri);
        log.info("total : "+total);
        model.addAttribute("pageMaker", new PageDTO(cri,total));
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
        log.info("=================================");

        log.info("register: " + board);

        if (board.getAttachList() != null){
            board.getAttachList().forEach(attach -> log.info(attach));
        }

        log.info("=================================");

        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list";
    }

    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){

        log.info("getAttachList " + bno);

        return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
    }


    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model){
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri , RedirectAttributes rttr){
        log.info("modify : "+board);

        if (service.modify(board)){
            rttr.addFlashAttribute("result", "success");
        }

        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type",cri.getType());
        rttr.addAttribute("keyword",cri.getKeyword());

        //"redirect:/board/list" + cri.getListLink()"
        return "redirect:/board/list";
    }

     @PostMapping("/remove")
     public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr)
     {
         log.info("remove..." + bno);
         if (service.remove(bno)) {
             rttr.addFlashAttribute("result", "success");
         }

         rttr.addAttribute("pageNum", cri.getPageNum());
         rttr.addAttribute("amount", cri.getAmount());
         rttr.addAttribute("type",cri.getType());
         rttr.addAttribute("keyword",cri.getKeyword());

         //"redirect:/board/list" + cri.getListLink()"
         return "redirect:/board/list";
     }
}
