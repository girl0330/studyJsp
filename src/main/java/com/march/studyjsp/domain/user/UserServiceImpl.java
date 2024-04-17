package com.march.studyjsp.domain.user;


import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
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
    public Map<String, Object> makeUser(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();
        int makeUserIdCheck = userMapper.makeUserIdCheck(userDTO);

        if(makeUserIdCheck > 0) {
            map.put("code", "error");
            map.put("message", "아이디가 중복입니다.");
            return map;
        }

        int makeUserEmailCheck = userMapper.makeUserEmailCheck(userDTO);

        if (makeUserEmailCheck > 0) {
            map.put("code", "error");
            map.put("massage", "아이디가 중복입니다.");
            return map;
        }

        userMapper.makeUser(userDTO);
        map.put("code","success");
        map.put("massage", "회원가입 성공");
        return map;
    }

    //회원가입
    public Map<String, String> saveUser(UserDTO userDTO) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        userDTO.setUserPw(passwordEncoder.encode(userDTO.getUserPw()));

//        String string = new String();

//        String idCheckString = userMapper.checkUserIdString(userDTO);
//
////        if (idCheckString == "1") {
////            System.out.println("아이디가 중복입니다.");
////            Map<String, String> map = new HashMap<>();
////            map.put("cord","test");
////            map.put("message","스트링을 맵으로 형변환시킴");
////            return map;
////        }

        //아이디 중복검사
        Map<String, String> map = new HashMap<>();

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

//        UserDTO userInfo = new UserDTO();
//        userInfo = userMapper.doLogin(userDTO);

        UserDTO userInfo = userMapper.doLogin(userDTO);

        //로그인
        map.put("loginInfo",userInfo);
        map.put("code","success");
        map.put("message","로그인성공");
        return map;
    }

//로그인

    public Map<String, Object> goLogin(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();
        int loginIdCheck = userMapper.loginIdCheck(userDTO);
        int loginPasswordCheck = userMapper.loginPassworkCheck(userDTO);

        if (loginIdCheck == 0) {
            map.put("code","error");
            map.put("message","아이디를 확인해주세요.");
            return map;
        }
        int loginPassworkCheck = userMapper.loginPassworkCheck(userDTO);
        if (loginPassworkCheck == 0) {
            map.put("code","error");
            map.put("message","비밀번호를 확인해주세요.");
            return map;
        }

        UserDTO userLoginInfo = userMapper.goLogin(userDTO);

        map.put("userLoginInfo", userLoginInfo);
        map.put("code", "success");
        map.put("message", "로그인 성공");

        return map;
    }
}
