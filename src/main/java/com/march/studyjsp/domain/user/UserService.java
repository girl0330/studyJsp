package com.march.studyjsp.domain.user;

import java.util.Map;

public interface UserService {
    //회원가입
    Map<String, String> saveUser(UserDTO userDTO);

    //로그인
    Map<String,Object> doLogin(UserDTO userDTO);
}
