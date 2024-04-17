package com.march.studyjsp.domain.user;

import java.util.Map;

public interface UserService {
    //회원가입
    Map<String, String> saveUser(UserDTO userDTO);



    //로그인
    Map<String,Object> doLogin(UserDTO userDTO);


    //회원가입
    Map<String, Object> makeUser(UserDTO userDTO);

    //로그인
    Map<String, Object> goLogin(UserDTO userDTO);


}
