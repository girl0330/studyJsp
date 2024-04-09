package com.march.studyjsp.domain.board;


import com.march.studyjsp.domain.user.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    //글 목록

    @GetMapping("/boardList")
    public String boardList(HttpSession session,Model model) {
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            System.out.println("글 목록");
            List<BoardDTO> boardList = boardService.boardList();
            System.out.println("boardList   "+boardList);
            model.addAttribute("boardList",boardList);
            return "jsp/board/board_list";
        } else {
            return "redirect:/user/login";
        }

    }
//    @GetMapping("/boardList")
//    public String boardList(HttpSession session) {
//        System.out.println("글 목록");
//        List<BoardDTO> boardList = boardService.boardList();
//        System.out.println("boardList   "+boardList);
//        session.setAttribute("boardList",boardList);
//        return "jsp/board/board_list";
//    }

    //글쓰기 페이지
    @GetMapping("/boardWrite")
    public String showBoardWrite(HttpSession session) {
        System.out.println("글작성 페이지");
        // HttpSession에서 로그인 정보 확인
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            // 로그인한 사용자 정보가 있다면 해당 사용자로 게시글 작성 페이지로 이동
            return "jsp/board/board_write"; // 여기에 실제 게시글 작성 페이지 경로를 반환하십시오.
        } else {
            // 로그인한 사용자 정보가 없다면 로그인 페이지로 리다이렉트 또는 예외 처리
            return "redirect:/user/login"; // 로그인 페이지로 리다이렉트하는 경우
            // 또는 throw new UnauthorizedException(); // 예외를 던지는 등의 처리
        }
    }
//    @GetMapping("/boardWrite")
////    public ModelAndView loginCheck(@ModelAttribute UserDTO userDTO, HttpSession session) {
////
////    }
//    public String showBoardWrite(){
//        System.out.println("글쓰기 화면 실행");
//        return "jsp/board/board_write";
//    }

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
    @ResponseBody
    public Map<String, Object> boardInsert(BoardDTO boardDTO, HttpSession session) {

        System.out.println("등록");
        Map<String, Object> map = boardService.boardInsert(boardDTO,session);
        System.out.println("글쓰기 화면");
        System.out.println("map"+ map);
        return map;
    }

    //글 수정
    @PostMapping("/boardUpdate")
    @ResponseBody
    public Map<String, Object> boardUpdate(BoardDTO boardDTO, HttpSession session) {
        System.out.println("boardDTO:::   "+boardDTO);
        Map<String, Object> map = boardService.boardUpdate(boardDTO,session);
        System.out.println("수정 완료");
        return map;
    }

    //글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("id") Long id) {
        System.out.println("====================================="+id);
        boardService.boardDelete(id);
        System.out.println("!!!!!!!!!!!!!!!!");
        return "redirect:/board/boardList";
    }
}
