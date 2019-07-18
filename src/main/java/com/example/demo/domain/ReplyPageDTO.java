package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Getter
@AllArgsConstructor
public class ReplyPageDTO {

    private int replyCnt;
    private List<ReplyVO> list;
}
