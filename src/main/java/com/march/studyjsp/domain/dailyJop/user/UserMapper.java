package com.march.studyjsp.domain.dailyJop.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {
    //회원가입
    void createUser(UserDTO userDTO);

    // 로그인
    UserDTO findUserInfo(UserDTO userDTO);



    // 회원정보
    UserDTO findId(String userId);

//    UserDTO findId(UserDTO userDTO);

    // 회원수정
    Map<Object, Object> userUpdate(UserDTO userDTO);

    // 아이디 중복 등록 확인
    int idCheck(UserDTO userDTO);

    // 이메일 중복 등록 확인
    int emailCheck(UserDTO userDTO);

    //아이디로 암호화된 비밀번호 얻기
    String getHashedPassword(String userId);
}
