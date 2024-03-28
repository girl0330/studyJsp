package com.march.studyjsp.home;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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

    @GetMapping("/1")
    public String homeTestsview1(Model model) {
        List<HomeDTO1> list1 = homeService.homeList1();
        System.out.println("list111111111111111111111111111;;; "+list1);
        model.addAttribute("list1",list1);
        return "jsp/test";
    }

    @GetMapping("/2")
    public String homeTesteview2(Model model) {
        List<Map<String, Object>> list2 = homeService.homeList2();
        System.out.println("list222222222222222222 "+list2);
        model.addAttribute("list2",list2);
        return "jsp/test";
    }

    @GetMapping("/3")
    public String homeTestview3(Model model) {
        List<HomeDTO> list3 = homeService.homeList3();
        System.out.println("list333333333333333333333");
        model.addAttribute("list3",list3);
        return "jsp/test";
    }

    @GetMapping("/4")
    public String homeTestview4(Model model) {
        List<Map<String,Object>> list4 = homeService.homeList4();
        System.out.println("list444444444444444444444444444444");
        model.addAttribute("list4",list4);
        return "jsp/test";
    }

    @PostMapping("/insert")
    public String createBoard(@RequestBody HomeDTO homeDTO) {
        /*
        homeDTO.setTitle("등록테스트입니다.");
        homeDTO.setContent("내용 테스트입니다.");
        homeDTO.setSystemRegistrarId("작성자 테스트입니다.");
        homeDTO.setSystemUpdaterId("수정자 테스트입니다.");
         */
        System.out.println("''''''''''''''''' "+homeDTO);
        homeService.createBoard(homeDTO);
        return "jsp/test";
    }

}
