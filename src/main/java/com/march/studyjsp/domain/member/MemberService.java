package com.march.studyjsp.domain.member;

import com.march.studyjsp.domain.board.BoardDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface MemberService {
    //회원가입
    Map<String, String> saveUser(MemberDTO memberDTO);



    //로그인
    Map<String,Object> doLogin(MemberDTO memberDTO);

    //회원목록
    List<MemberDTO> findAll();

    //회원 상세보기
    MemberDTO memberDetail(Long id);

    //회원프로필
    MemberDTO findPro(int memberNo);

    //회원 프로필 수정
    Map<String, Object> memberUpdate(MemberDTO memberDTO, HttpSession session);

    //비밀번호 변경
    Map<String, Object> changePassword(MemberDTO memberDTO, HttpSession session);


    //회원가입
//    Map<String, Object> makeUser(MemberDTO userDTO);

    //로그인
//    Map<String, Object> goLogin(MemberDTO userDTO);


}
