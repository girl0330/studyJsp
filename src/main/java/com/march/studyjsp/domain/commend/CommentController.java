package com.march.studyjsp.domain.commend;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;
    @PostMapping("/save")
    @ResponseBody
    public List<CommentDTO> save(@RequestBody CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
//        List<CommentDTO> commnetList = commentService.findAll(commentDTO.getBoardNo());
        Long boardNo = Long.valueOf(commentDTO.getBoardNo());
        List<CommentDTO> commentList = commentService.findAll(boardNo);
        return commentList;
    }
}
