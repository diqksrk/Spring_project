package com.example.demo.controller;

import com.example.demo.domain.BoardAttachVO;
import com.example.demo.domain.BoardVO;
import com.example.demo.domain.Criteria;
import com.example.demo.domain.PageDTO;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    private ReplyService rservice;

    @GetMapping("/list")
    public void list(Criteria cri,Model model){
        log.info("list " + cri);

        model.addAttribute("list", service.getList(cri, "tbl_board"));
//        model.addAttribute("pageMaker", new PageDTO(cri,123));

        int total=service.getTotal(cri, "tbl_board");
        log.info("total : "+total);
        model.addAttribute("pageMaker", new PageDTO(cri,total));
        model.addAttribute("boardName", "자유게시판");
    }

    @GetMapping("/humor")
    public String humorList(Criteria cri,Model model){
        log.info("humor list : " + cri);
        model.addAttribute("list", service.getList(cri, "tbl_humor"));
//        model.addAttribute("pageMaker", new PageDTO(cri,123));

        int total=service.getTotal(cri, "tbl_humor");
        log.info("total : "+total);
        model.addAttribute("pageMaker", new PageDTO(cri,total));
        model.addAttribute("boardName", "유머게시판");

        return "/board/list";
    }

    @GetMapping("/notice")
    public String noticeList(Criteria cri,Model model){
        log.info("notice List : " + cri);
        model.addAttribute("list", service.getList(cri, "tbl_notice"));
//        model.addAttribute("pageMaker", new PageDTO(cri,123));

        int total=service.getTotal(cri, "tbl_notice");
        log.info("total : "+total);
        model.addAttribute("pageMaker", new PageDTO(cri,total));
        model.addAttribute("boardName", "공지사항");

        return "/board/list";
    }

    @GetMapping("")
    public String board(Model model){
        log.info("list");
//        model.addAttribute("list", service.getList());
        return "board/list";
    }

    @GetMapping("/register")
//    @PreAuthorize("isAuthenticated()")
    public void register(Model model){
        model.addAttribute("boardName", "자유게시판");
    }

    @PostMapping("/register")
//    @PreAuthorize("isAuthenticated()")
    public String register(BoardVO board, RedirectAttributes rttr) {
        log.info("=================================");

        log.info("register: " + board);

//        if (board.getAttachList() != null){
//            board.getAttachList().forEach(attach -> log.info(attach));
//        }

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

    private void deleteFiles(List<BoardAttachVO> attachList) {

        if(attachList == null || attachList.size() == 0) {
            return;
        }

        log.info("delete attach files...................");
        log.info(attachList);

        attachList.forEach(attach -> {
            try {
                Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());

                Files.deleteIfExists(file);

                if(Files.probeContentType(file).startsWith("image")) {

                    Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());

                    Files.delete(thumbNail);
                }

            }catch(Exception e) {
                log.error("delete file error" + e.getMessage());
            }//end catch
        });//end foreachd
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model){
        log.info("/get or modify");
        model.addAttribute("boardName", "자유게시판");
        model.addAttribute("board", service.get(bno));
    }

    @PreAuthorize("principal.username==#board.writer")
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

    @PreAuthorize("principal.username==#writer")
    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String writer) {
        log.info("remove..." + bno);

        List<BoardAttachVO> attachList = service.getAttachList(bno);
        rservice.deleteAll(bno);

        if (service.remove(bno)) {
            // delete Attach Files
            deleteFiles(attachList);
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/board/list" + cri.getListLink();
    }
}
