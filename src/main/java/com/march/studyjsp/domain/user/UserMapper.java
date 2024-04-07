package com.march.studyjsp.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    void saveUser(UserDTO userDTO);

    UserDTO doLogin(UserDTO userDTO);

    int checkUserId(UserDTO userDTO);
}
