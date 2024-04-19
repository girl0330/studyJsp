package com.march.studyjsp.domain.board;

import com.march.studyjsp.domain.member.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

    //글 등록
    @Override
    public Map<String, Object> boardInsert(BoardDTO boardDTO, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

        System.out.println("userInfo:::   "+userInfo);

        if(userInfo ==  null ){
            map.put("code","error");
            map.put("message","로그인이 필요합니다.");
            return map;
        }

        boardDTO.setMemberNo(userInfo.getMemberNo());
        boardDTO.setSystemRegistrarId(String.valueOf(userInfo.getUserId()));
        boardDTO.setSystemUpdaterId(String.valueOf(userInfo.getUserId()));

        System.out.println("boardDTO:::   "+boardDTO);

        boardMapper.boardInsert(boardDTO);
        map.put("code","success");
        map.put("message","글쓰기가 완료되었습니다.");
        return map;
    }

    //글목록
    @Override
    public List<BoardDTO> boardList() {
        return boardMapper.boardList();
    }

    //상세페이지
    @Override
    public BoardDTO boardDetail(Long id) {
        return boardMapper.boardDetail(id);
    }

    //수정
    @Override
    public Map<String, Object> boardUpdate(BoardDTO boardDTO, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        //info가 없을때
        MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

        System.out.println("memberNo:::   "+userInfo);

        boardMapper.boardUpdate(boardDTO);

        map.put("code","success");
        map.put("message","글 수정이 완료되었습니다.");
        return map;
    }

    //삭제
    @Override
    public void boardDelete(Long id) {
        System.out.println("@@@@@@@@@@@@@@@");
        boardMapper.boardDelete(id);
    }

//    //글 등록
//    @Override
//    public Map<String, Object> pageInsert(BoardDTO boardDTO, HttpSession session) {
//        Map<String, Object> map = new HashMap<>();
//        MemberDTO userLoginInfo = (MemberDTO) session.getAttribute("userLoginInfo");
//
//        if (userLoginInfo == null) {
//            map.put("code", "error");
//            map.put("message", "로그인이 필요합니다.");
//            return map;
//        }
//        boardDTO.setMemberNo(userLoginInfo.getMemberNo());
//        boardDTO.setSystemRegistrarId(String.valueOf(userLoginInfo.getMemberNo()));
//        boardDTO.setSystemUpdaterId(String.valueOf(userLoginInfo.getMemberNo()));
//
//        boardMapper.pageInsert(boardDTO);
//        map.put("code","success");
//        map.put("message","글쓰기가 완료되었습니다.");
//        return map;
//    }
//
//    //글 목록
//    @Override
//    public List<BoardDTO> pageList () {
//        return boardMapper.pageList();
//    }
//
//    //상세페이지
//    @Override
//    public BoardDTO pageDetail(Long id) {
//        return boardMapper.pageDetail(id);
//    }
////    @Override
////    public Map<String, Object> boardUpdate(BoardDTO boardDTO, HttpSession session) {
////
////        Map<String, Object> map = new HashMap<>();
////        MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
////
////        System.out.println("memberNo:::   "+userInfo);
////
////        boardMapper.boardUpdate(boardDTO);
////
////        map.put("code","success");
////        map.put("message","글 수정이 완료되었습니다.");
////        return map;
////    }
//    //글 수정
//    @Override
//    public Map<String, Object> pageUpdate(BoardDTO boardDTO, HttpSession session) {
//
//        Map<String, Object> map = new HashMap<>();
//        MemberDTO userLoginInfo = (MemberDTO) session.getAttribute("userLoginInfo");
//
//        boardDTO.setMemberNo(userLoginInfo.getMemberNo());
//        boardDTO.setSystemRegistrarId(String.valueOf(userLoginInfo.getMemberNo()));
//        boardDTO.setSystemUpdaterId(String.valueOf(userLoginInfo.getMemberNo()));
//
//        boardMapper.pageUpdate(boardDTO);
//
//        map.put("code","success");
//        map.put("message", "글 수정이 완료되었습니다.");
//        return map;
//    }
//
//    //글 삭제
//    @Override
//    public void pageDelete(Long id) {
//        boardMapper.pageDelete(id);
//    }
}
