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

    //회원가입
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
        int emailCheck = userMapper.checkUserEmail(userDTO);

        if (emailCheck > 0) {
            map.put("code","error");
            map.put("message","이메일이 중복입니다.");
            return map;
        }

        userMapper.saveUser(userDTO);
        map.put("code","success");
        map.put("message","회원가입이 완료되었습니다.");
        return map;
    }

    //로그인
    @Override
    public Map<String,Object> doLogin(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();

        //check id
        int checkLoginId = userMapper.checkLoginId(userDTO);
        if (checkLoginId == 0) {
            map.put("code","error");
            map.put("message","아이디를 확인해주세요.");
            return map;
        }

        //check password
        int checkLoginPw = userMapper.checkLoginPw(userDTO);
        if (checkLoginPw == 0) {
            map.put("code","error");
            map.put("message","비밀번호를 확인해주세요.");
            return map;
        }

        UserDTO test = new UserDTO();
        test = userMapper.doLogin(userDTO);

        //로그인
        map.put("loginInfo",test);
        map.put("code","success");
        map.put("message","로그인성공");
        return map;
    }
}
