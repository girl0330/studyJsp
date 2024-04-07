package com.march.studyjsp.domain.user;


import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserMapper userMapper;


    @Override
    public Map<String, String> saveUser(UserDTO userDTO) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        userDTO.setUserPw(passwordEncoder.encode(userDTO.getUserPw()));

        Map<String, String> map = new HashMap<>();
        //아이디 중복검사
        int idCheck = userMapper.checkUserId(userDTO);

        if(idCheck > 0) {
            map.put("code","error");
            map.put("message","아이디가 중복입니다.");
            return map;
        }

        //이메일 중복검사
        //userDTO.getEmail();

        userMapper.saveUser(userDTO);
        map.put("code","success");
        map.put("message","회원가입이 완료되었습니다.");
        return map;
    }

    @Override
    public UserDTO doLogin(UserDTO userDTO) {
        return userMapper.doLogin(userDTO);
    }
}
