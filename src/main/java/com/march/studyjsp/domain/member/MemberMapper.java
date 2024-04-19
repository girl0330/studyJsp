package com.march.studyjsp.domain.member;

import com.march.studyjsp.domain.board.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    //정보 저장
    void saveUser(MemberDTO memberDTO);

    //회원가입시 중복 체크
    int checkUserId(MemberDTO memberDTO);
    int checkUserEmail(MemberDTO memberDTO);

//    String checkUserIdString(MemberDTO userDTO);

    //로그인
    MemberDTO doLogin(MemberDTO memberDTO);

    //로그인시 여부확인
    int checkLoginId(MemberDTO memberDTO);
    int checkLoginPw(MemberDTO memberDTO);

    //회원목록
    List<MemberDTO> findAll();

    //회원상세보기
    MemberDTO memberDetail(Long id);

    //회원가입--------------------------------->
    void makeUser(MemberDTO memberDTO);

    //회원가입시 아이디 중복겁사
    int makeUserIdCheck(MemberDTO memberDTO);

    //회원가입시 이메일 중복검사
    int makeUserEmailCheck(MemberDTO memberDTO);

    //로그인
    MemberDTO goLogin(MemberDTO memberDTO);

    //로그인시 아이디 일치검사
    int loginIdCheck(MemberDTO memberDTO);

    //로그인시 비밀번호 일치검사
    int loginPassworkCheck(MemberDTO memberDTO);



}
