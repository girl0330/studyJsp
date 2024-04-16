package com.march.studyjsp.domain.commend;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService{
    private final CommentMapper commentMapper;

    @Override
    public void save(CommentDTO commentDTO) {
        System.out.println("서비스 임플 commentDTO = " + commentDTO);
        commentMapper.save(commentDTO);
        System.out.println("mapper.save(dto):::: " + commentDTO);
    }

    @Override
    public List<CommentDTO> findAll(Long boardNo) {
        System.out.println("해당 게시글 번호는;;;" + boardNo);
        return commentMapper.findAll(boardNo);
    }
}
