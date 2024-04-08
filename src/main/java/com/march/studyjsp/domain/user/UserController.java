package com.march.studyjsp.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

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
        Map<String, String> map = userService.saveUser(userDTO);
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
    @ResponseBody
    public Map<String, Object> userLogin(UserDTO userDTO, HttpSession session,Model model) {
        System.out.println("로그인 화면");

        Map<String, Object> map = userService.doLogin(userDTO);

        if("error".equals(map.get("code"))) {
            return map;
        }

        UserDTO x = (UserDTO) map.get("loginInfo");
        model.addAttribute("memberNo",x.getMemberNo());

        //session
        session.setAttribute("userInfo",map.get("loginInfo"));
        return map;
    }
}
