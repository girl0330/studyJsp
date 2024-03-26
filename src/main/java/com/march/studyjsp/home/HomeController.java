package com.march.studyjsp.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String homeTestView() {
        System.out.println("해당 도메인 !!!!!!!!!!");
        return "jsp/test";
    }
}
