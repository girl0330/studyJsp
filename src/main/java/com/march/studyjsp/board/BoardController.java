package com.march.studyjsp.board;

import com.march.studyjsp.home.HomeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;

    // 홈
    @GetMapping("/home")
    public String showBoardHome() {
        System.out.println("홈화면  ");
        return "jsp/index";
    }



    //글 목록
    @GetMapping("/boardInsert")
    public String boardList(Model model) {
        List<BoardDTO> boardList = boardService.boardList();
        System.out.println("boardList   "+boardList);
        model.addAttribute("boardList",boardList);
        return "jsp/list";
    }

    //글 작성
    @GetMapping("/boardWrite")
    public String boardInsert(BoardDTO boardDTO) {
        System.out.println(" 데이터   "+boardDTO);
        boardService.boardInsert(boardDTO);
        System.out.println("boardDTO 데이터   "+boardDTO);
        return "jsp/boardWrite";
    }

    //상세페이지
    @GetMapping("/boardDetail")
    public String showBoardDetail(@RequestParam("id") Long id, Model model){
        System.out.println("선택한 id : "+id);
//        boardService.boardDetail(id);
        BoardDTO boardDetail = boardService.boardDetail(id);
        System.out.println("boardDtail : "+boardDetail);
        model.addAttribute("detail",boardDetail);
        return "jsp/detail";
    }
    //글 상세페이지
//    @GetMapping("/detail")
//    public String boardDetail(@RequestParam("id") Long id,Model model) {
//        System.out.println("선택한 id  "+id+"데이터   "+id);
//        BoardDTO detail = boardService.boardDetail(id);
//        System.out.println("디테일 "+detail);
//        model.addAttribute("detailBoard",detail);
//        return "jsp/detail";
//    }

//글 수정
    @PostMapping("/boardupdate")
    public String boardUpdate(BoardDTO boardDTO) {
        System.out.println("업데이트 내용: "+boardDTO);
        boardService.boardUpdate(boardDTO);
        System.out.println("보드 업데이트");
        return "redirect:/boardList";
    }

//글 삭제

    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("id") Long id) {
        System.out.println("????????????????????");
        System.out.println("선택한 id :"+id);
        boardService.boardDelete(id);
        return "redirect:/boardList";
    }
//    @PostMapping("/boardDelete")
//    public String boardDelete(@RequestParam("id") Long id, Model model) {
//        System.out.println("선택한 id :"+id);
//        BoardDTO boardDelete = boardService.boardDelete(id);
//        System.out.println("데이터:   "+boardDelete );
//        model.addAttribute("delete",boardDelete);
//        return "redirect:/boardList";
//    }
}
