package com.march.studyjsp.domain.board;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    //글 목록
    @GetMapping("/boardList")
    public String boardList(Model model) {
        System.out.println("글 목록");
        List<BoardDTO> boardList = boardService.boardList();
        System.out.println("boardList   "+boardList);
        model.addAttribute("boardList",boardList);
        return "jsp/board/board_list";
    }

    //글쓰기 페이지
    @GetMapping("/boardWrite")
    public String showBoardWrite(){
        System.out.println("글쓰기 화면 실행");
        return "jsp/board/board_write";
    }

    //상세페이지
    @GetMapping("/boardDetail")
    public String showBoardDetail(@RequestParam ("id") Long id, Model model){
        System.out.println("상세페이지");
        BoardDTO boardDetail = boardService.boardDetail(id);
        model.addAttribute("detail",boardDetail);
        return "jsp/board/board_detail";
    }

    //글 등록
    @PostMapping ("/boardInsert")
    public String boardInsert(BoardDTO boardDTO) {
        System.out.println("등록");
        boardService.boardInsert(boardDTO);
        System.out.println("글쓰기 화면");
        System.out.println("boardDTO"+ boardDTO);
        return "redirect:/board/boardList";
    }

    //글 수정
    @PostMapping("/boardUpdate")
    @ResponseBody
    public String boardUpdate(BoardDTO boardDTO) {
        boardService.boardUpdate(boardDTO);
        System.out.println("수정 완료");
        return "1234";
    }

    //글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("id") Long id) {
        System.out.println(id);
        boardService.boardDelete(id);
        System.out.println("!!!!!!!!!!!!!!!!");
        return "redirect:/board/boardList";
    }
}
