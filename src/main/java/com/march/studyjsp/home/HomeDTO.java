package com.march.studyjsp.home;

import lombok.Data;

@Data
public class HomeDTO {

    private Long num;
    private Long id;
    private String title;
    private String content;
    private String systemRegistrarId;
    private String systemUpdaterId;
    private String systemRegistrarDatetime;
    private String systemUpdateDatetime;

}
