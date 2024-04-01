package com.march.studyjsp.domain.board;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    //작성
    void boardInsert(BoardDTO boardDTO);

    //글목록
    List<BoardDTO> boardList();

    //상세페이지
    BoardDTO boardDetail(Long id);

    //수정
    void boardUpdate(BoardDTO boardDTO);

    void boardDelete(Long id);
}
