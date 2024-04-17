package com.march.studyjsp.domain.user;

import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;

import javax.persistence.Id;
import java.util.Map;

@Mapper
public interface UserMapper {
    //정보 저장
    void saveUser(UserDTO userDTO);

    //회원가입시 중복 체크
    int checkUserId(UserDTO userDTO);
    int checkUserEmail(UserDTO userDTO);

//    String checkUserIdString(UserDTO userDTO);

    //로그인
    UserDTO doLogin(UserDTO userDTO);

    //로그인시 여부확인
    int checkLoginId(UserDTO userDTO);
    int checkLoginPw(UserDTO userDTO);

    //회원가입--------------------------------->
    void makeUser(UserDTO userDTO);

    //회원가입시 아이디 중복겁사
    int makeUserIdCheck(UserDTO userDTO);

    //회원가입시 이메일 중복검사
    int makeUserEmailCheck(UserDTO userDTO);

    //로그인
    UserDTO goLogin(UserDTO userDTO);

    //로그인시 아이디 일치검사
    int loginIdCheck(UserDTO userDTO);

    //로그인시 비밀번호 일치검사
    int loginPassworkCheck(UserDTO userDTO);
}
