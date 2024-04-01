package com.march.studyjsp.domain.board;

import java.util.List;

public interface BoardService {

    //작성
    void boardInsert(BoardDTO boardDTO);


    //글목록
    List<BoardDTO> boardList();

    //상세페이지
    BoardDTO boardDetail(Long id);

    //수정
    void boardUpdate(BoardDTO boardDTO);

    //삭제
    void boardDelete(Long id);
}
