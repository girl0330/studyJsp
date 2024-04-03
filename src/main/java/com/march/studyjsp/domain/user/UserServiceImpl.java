package com.march.studyjsp.domain.user;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserMapper userMapper;


    @Override
    public void saveUser(UserDTO userDTO) {
        userMapper.saveUser(userDTO);
    }
}
