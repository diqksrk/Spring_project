package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

import java.sql.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
    private Long bno;
    private String title;
    private String contents;
    private Date creationDate;
    private Date updateDate;

    private int replyCnt;

    private List<BoardAttachVO> attachList;
}
