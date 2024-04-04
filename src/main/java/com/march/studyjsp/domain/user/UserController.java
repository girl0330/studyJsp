package com.march.studyjsp.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String userInsert(UserDTO userDTO) {
        System.out.println("화면");
        System.out.println("userDTO"+ userDTO);
        userService.saveUser(userDTO);
        return "jsp/board/board_list";
    }

    //로그인 페이지 이동
    @GetMapping("/login")
    public String loginView () {
        return "jsp/user/user_login";
    }

    //로그인 실행
    @PostMapping("/doLogin")
    public String userLogin(@RequestBody  UserDTO userDTO, Model model) {
        System.out.println("로그인 화면");

        UserDTO user = userService.doLogin(userDTO);
        System.out.println("user:::   "+user);
        return "jsp/main";
    }

}
