package com.march.studyjsp.domain.dailyJop.user;

import java.util.Map;

public interface UserService {
    //회원가입
    Map<Object, Object> createUser(UserDTO userDTO);

    //로그인
    Map<Object, Object> UserLogin(UserDTO userDTO);



    //회원정보
    UserDTO findUser(String userId);
//    UserDTO findUser(UserDTO userDTO);

    // 회원수정
    Map<Object, Object> userUpdate(UserDTO userDTO);
}
