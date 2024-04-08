package com.march.studyjsp.domain.board;

import lombok.Data;

@Data
public class BoardDTO {

    private int boardNo;
    private int memberNo;
    private int storeId;
    private String boardTypeCode;
    private String title;
    private String content;
    private int grade;
    private boolean noticeYn;
    private int viewCount;
    private String systemRegistrarId;
    private String systemRegisterDatetime;
    private String systemUpdaterId;
    private String systemUpdateDatetime;
    private boolean systemDeleted;

}
