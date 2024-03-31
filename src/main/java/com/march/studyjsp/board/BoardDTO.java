package com.march.studyjsp.board;

import lombok.Data;

@Data
public class BoardDTO {

    private Long num;
    private Long id;
    private String title;
    private String content;
    private String systemRegistrarId;
    private String systemUpdaterId;
    private String systemRegistrarDatetime;
    private String systemUpdateDatetime;

}
