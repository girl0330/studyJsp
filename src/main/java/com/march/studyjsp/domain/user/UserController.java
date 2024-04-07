package com.march.studyjsp.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")

public class UserController {
    private final UserService userService;

    //회원가입 페이지 이동
    @GetMapping("/register")
    public String registerView () {
        System.out.println("회원가입 화면 실행");
        return "jsp/user/user_register";
    }

    //회원가입 등록
    @PostMapping("/registerInsert")
    @ResponseBody
    public Map<String, String> userInsert(UserDTO userDTO) {
        System.out.println("화면");
        Map<String, String> map = userService.saveUser(userDTO);

        System.out.println("map::::   "+map);

        return map;
    }

    //로그인 페이지 이동
    @GetMapping("/login")
    public String loginView () {
        System.out.println("로그인 페이지");
        return "jsp/user/user_login";
    }

    //로그인 요청
    @PostMapping("/doLogin")
    public String userLogin(UserDTO userDTO, HttpSession session) {
        System.out.println("로그인 화면");

        UserDTO user = userService.doLogin(userDTO);
        System.out.println("user:::   "+user);

        session.setAttribute("userInfo",user);
        return "jsp/main";
    }
}
