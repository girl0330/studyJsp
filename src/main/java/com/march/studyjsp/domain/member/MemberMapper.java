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


    //로그인
    MemberDTO doLogin(MemberDTO memberDTO);

    //로그인시 여부확인
    int checkLoginId(MemberDTO memberDTO);
    int checkLoginPw(MemberDTO memberDTO);

    //회원목록
    List<MemberDTO> findAll();

    //회원상세보기
    MemberDTO memberDetail(Long id);

    //회워 프로필
    MemberDTO findPro(int memberNo);

    //회원 프로필 수정
    void memberUpdate(MemberDTO memberDTO);

    //현재 비밀번호 확인
    int nowPassCheck(MemberDTO memberDTO);

    //비밀번호 변경하기
    void changePassword(MemberDTO memberDTO);


}
