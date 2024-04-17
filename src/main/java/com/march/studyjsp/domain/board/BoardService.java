package com.march.studyjsp.domain.board;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

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
    Map<String, Object> boardUpdate(BoardDTO boardDTO, HttpSession session);

    //삭제
    void boardDelete(Long id);

//    //글 등록
//    Map<String, Object> pageInsert(BoardDTO boardDTO, HttpSession session);
//
//    //글 목록
//    List<BoardDTO> pageList ();
//
//    //상세페이지
//    BoardDTO pageDetail(Long id);
//
//    //글 수정
//    Map<String, Object> pageUpdate(BoardDTO boardDTO, HttpSession session);
//
//    //글 삭제
//    void pageDelete(Long id);

}
