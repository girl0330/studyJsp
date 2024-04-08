package com.march.studyjsp.domain.board;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface BoardService {

    //작성
    Map<String, Object> boardInsert(BoardDTO boardDTO, HttpSession session);


    //글목록
    List<BoardDTO> boardList();

    //상세페이지
    BoardDTO boardDetail(Long id);

    //수정
    void boardUpdate(BoardDTO boardDTO);

    //삭제
    void boardDelete(Long id);
}
