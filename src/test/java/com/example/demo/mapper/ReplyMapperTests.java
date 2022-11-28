//package com.example.demo.mapper;
//
//import com.example.demo.domain.BoardVO;
//import com.example.demo.domain.Criteria;
//import com.example.demo.domain.ReplyVO;
//import lombok.AllArgsConstructor;
//import lombok.Setter;
//import lombok.extern.log4j.Log4j2;
//import net.bytebuddy.asm.Advice;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import java.util.List;
//import java.util.stream.IntStream;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//@Log4j2
//public class ReplyMapperTests {
//
//    @Setter(onMethod_ = @Autowired)
//    private ReplyMapper mapper;
//
//    private Long[] bnoArr={1048616L, 1048614L, 1048613L, 1048612L, 1048611L};
//
////    @Test
////    public void testMapper(){
////        log.info(mapper);
////    }
//
////    @Test
////    public void testCreate(){
////        IntStream.rangeClosed(1,10).forEach(i ->{
////            ReplyVO vo=new ReplyVO();
////            vo.setBno(bnoArr[i%5]);
////            vo.setReply("댓글 테스트"+i);
////            vo.setReplyer("replayer"+i);
////
////            mapper.insert(vo);
////        });
////    }
//
////    @Test
////    public void testRead(){
////        Long targetRno=5L;
////
////        ReplyVO vo=mapper.read(targetRno);
////
////        log.info(vo);
////    }
//
////    @Test
////    public void testDelete(){
////        int targetRno=1;
////
////        mapper.delete(targetRno);
////    }
//
////    @Test
////    public void testUpdate(){
////        Long targetRno=10L;
////
////        ReplyVO vo=mapper.read(targetRno);
////
////        vo.setReply("Update Reply");
////
////        int count=mapper.update(vo);
////
////        log.info("UPDATE COUNT : "+count);
////    }
//
////    @Test
////    public void testList(){
////        Criteria cri=new Criteria();
////
////        List<ReplyVO> replies=mapper.getListWithPaging(cri, bnoArr[0]);
////
////        replies.forEach(reply->log.info(reply));
////    }
//
//    @Test
//    public void testList2(){
//
//        Criteria cri = new Criteria(2,10);
//
//        List<ReplyVO> replies = mapper.getListWithPaging(cri, 1048616L);
//
//        log.info(replies);
//
//    }
//
//}
//
//
//
//
//
//
//
//
//
//
//
