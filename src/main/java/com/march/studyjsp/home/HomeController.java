package com.march.studyjsp.home;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class HomeController {
    private final HomeService homeService;

    @GetMapping("/")
    public String homeTestView(Model model) {
        List<HomeDTO> list = homeService.homeList();
        System.out.println("list:::    "+list);
        model.addAttribute("list",list);
        return "jsp/test";
    }
}
