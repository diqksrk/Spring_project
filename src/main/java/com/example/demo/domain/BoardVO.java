package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
    private Long bno;
    private String title;
    private String contents;
    private Date creation_date;
    private Date update_date;
}
