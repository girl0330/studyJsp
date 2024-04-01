package com.march.studyjsp.domain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {
    @GetMapping("/")
    public String mainView() {
        return "jsp/main";
    }

    @GetMapping("/{urlParam}")
    public String pageView(@PathVariable String urlParam) {
        return "jsp/"+urlParam;
    }
}
