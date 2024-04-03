package com.march.studyjsp.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")

public class UserController {
    private final UserService userService;

    //회원가입
    @GetMapping("/register")
    public String saveUser () {
        System.out.println("회원가입 화면 실행");
        return "jsp/user/user_register";
    }

    @PostMapping("/registerInsert")
    public String boardInsert(@RequestBody UserDTO userDTO) {
        System.out.println("화면");
        System.out.println("userDTO"+ userDTO);
        userService.saveUser(userDTO);
        return "jsp/board/board_list";
    }
}
