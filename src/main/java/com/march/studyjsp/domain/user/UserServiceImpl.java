package com.march.studyjsp.domain.user;


import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserMapper userMapper;


    @Override
    public void saveUser(UserDTO userDTO) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        userDTO.setUserPw(passwordEncoder.encode(userDTO.getUserPw()));
        userMapper.saveUser(userDTO);
    }

    @Override
    public UserDTO doLogin(UserDTO userDTO) {
        return userMapper.doLogin(userDTO);
    }
}
