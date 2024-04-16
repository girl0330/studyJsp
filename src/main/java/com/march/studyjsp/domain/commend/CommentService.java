package com.march.studyjsp.domain.commend;

import java.util.List;

public interface CommentService {
    void save(CommentDTO commentDTO);

    List<CommentDTO> findAll(Long boardNo);
}
