package com.march.studyjsp.domain.commend;

import lombok.Data;
@Data
public class CommentDTO {
    private int id;
    private int boardNo;
    private String commentWriter;
    private String commentContent;
    private String commentCreatedDate;
    private String commentModifiedDate;
}
