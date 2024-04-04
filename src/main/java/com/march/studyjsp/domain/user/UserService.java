package com.march.studyjsp.domain.user;

public interface UserService {
    void saveUser(UserDTO userDTO);

    UserDTO doLogin(UserDTO userDTO);
}
