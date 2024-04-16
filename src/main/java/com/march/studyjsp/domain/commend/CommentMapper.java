package com.march.studyjsp.domain.commend;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    void save(CommentDTO commentDTO);

    List<CommentDTO> findAll(Long boardNo);
}
