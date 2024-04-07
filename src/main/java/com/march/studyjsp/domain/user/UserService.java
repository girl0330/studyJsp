package com.march.studyjsp.domain.user;

import java.util.Map;

public interface UserService {
    Map<String, String> saveUser(UserDTO userDTO);

    UserDTO doLogin(UserDTO userDTO);
}
