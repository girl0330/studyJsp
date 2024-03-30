package com.march.studyjsp.home;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return "jsp/index";
    }

    @GetMapping("/{param}")
    public String testview(@PathVariable String param, Model model) {
        System.out.println("param:::    "+param);
        if("list".equals(param)) {
            System.out.println("LIST인가요??");
            List<HomeDTO> list = homeService.homeList();
            model.addAttribute("list",list);
        }
        return "jsp/"+param;
    }

    //수정
    @PostMapping("/update")
    public String updateBoard(HomeDTO homeDTO) {
        System.out.println("--------------"+homeDTO);
        homeService.updateBoard(homeDTO);
        return "redirect:/list";
    }

    //글 작성
    @PostMapping("/insert")
    public String createBoard(HomeDTO homeDTO) {
        /*
        homeDTO.setTitle("등록테스트입니다.");
        homeDTO.setContent("내용 테스트입니다.");
        homeDTO.setSystemRegistrarId("작성자 테스트입니다.");
        homeDTO.setSystemUpdaterId("수정자 테스트입니다.");
         */
        System.out.println("''''''''''''''''' "+homeDTO);
        homeService.createBoard(homeDTO);
        return "redirect:/list";
    }


    //상세페이지
    @GetMapping("/detail")
    public String detailBaord(@RequestParam("id") Long id, Model model) {
        System.out.println(":::::::::::::");
        System.out.println(":::::::::::::    "+id);

        HomeDTO detail = homeService.homeDetail(id);
        System.out.println(";;;;;;;;;;;;;;;;;;;;;;;  " +detail);
        model.addAttribute("detail",detail);
        return "jsp/detail";
    }

    //삭제
    @DeleteMapping("/delete/{id}")
    public String deleteBoard(@PathVariable Long id) {
        System.out.println("==================== "+id);
        homeService.deleteBoard(id);
        return "jsp/test";
    }


}
