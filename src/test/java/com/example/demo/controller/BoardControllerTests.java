//package com.example.demo.controller;
//
//import static org.junit.Assert.assertNotNull;
//import com.example.demo.controller.PageController;
//import com.example.demo.domain.BoardVO;
//import com.example.demo.mapper.FBoardMapper;
//import com.example.demo.service.BoardService;
//import lombok.Setter;
//import lombok.extern.log4j.Log4j2;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//@RunWith(SpringRunner.class)
//@WebAppConfiguration
//@SpringBootTest
//@Log4j2
//public class BoardControllerTests {
//    @Setter(onMethod_ = { @Autowired })
//    private WebApplicationContext ctx;
//
//    private MockMvc mockMvc;
//
//    @Before
//    public void setup() {
//        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//    }
//
////    @Test
////    public void testList() throws Exception {
////
////        log.info(
////                mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
////    }
//
////    @Test
////    public void tetGet() throws Exception {
////
////        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "4")).andReturn()
////                .getModelAndView().getModelMap());
////    }
//
////    @Test
////    public void testModify() throws Exception {
////
////        String resultPage = mockMvc
////                .perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "1").param("title", "수테 새글")
////                        .param("contents", "수테 새글 내용"))
////                .andReturn().getModelAndView().getViewName();
////        log.info(resultPage);
////    }
//
////    @Test
////    public void testRemove() throws Exception {
////        // 삭제전 데이터베이스에 게시물 번호 확인할 것
////        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "8")).andReturn()
////                .getModelAndView().getViewName();
////        log.info(resultPage);
////    }
//
//    @Test
//    public void testListPaging() throws Exception{
//        log.info(mockMvc.perform(
//                MockMvcRequestBuilders.get("/board/list")
//                .param("pageNum","2")
//                .param("amount","50"))
//                .andReturn().getModelAndView().getModelMap());
//    }
//
//}
