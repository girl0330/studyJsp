package com.march.studyjsp.domain.board;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    //글 목록
    @GetMapping("/boardList")
    public String boardList(Model model) {
        List<BoardDTO> boardList = boardService.boardList();
        System.out.println("boardList   "+boardList);
        model.addAttribute("boardList",boardList);
        return "jsp/board/board_list";
    }

    //글쓰기 페이지
    @GetMapping("/boardWrite")
    public String showBoardWrite(){
        return "jsp/board/board_write";
    }

    //상세페이지
    @GetMapping("/boardDetail")
    public String showBoardDetail(@RequestParam("id") Long id, Model model){
        BoardDTO boardDetail = boardService.boardDetail(id);
        model.addAttribute("detail",boardDetail);
        return "jsp/board/board_detail";
    }

    //글 등록
    @PostMapping("/boardInsert")
    public String boardInsert(BoardDTO boardDTO) {
        boardService.boardInsert(boardDTO);
        return "redirect:/board/boardList";
    }

    //글 수정
    @PostMapping("/boardupdate")
    public String boardUpdate(BoardDTO boardDTO) {
        boardService.boardUpdate(boardDTO);
        return "redirect:/boardList";
    }

    //글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("id") Long id) {
        boardService.boardDelete(id);
        return "redirect:/boardList";
    }
}
