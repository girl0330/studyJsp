package com.march.studyjsp.domain.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {
    //정보 저장
    void saveUser(UserDTO userDTO);

    //회원가입시 중복 체크
    int checkUserId(UserDTO userDTO);
    int checkUserEmail(UserDTO userDTO);

    //로그인
    UserDTO doLogin(UserDTO userDTO);

    //로그인시 여부확인
    int checkLoginId(UserDTO userDTO);
    int checkLoginPw(UserDTO userDTO);


}
