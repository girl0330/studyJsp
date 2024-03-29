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

//    @GetMapping("/{param}")
//    public String testview(@PathVariable String param, Model model) {
//        System.out.println("param:::    "+param);
//        if("list".equals(param)) {
//            System.out.println("LIST인가요??");
//            List<HomeDTO> list = homeService.homeList();
//            model.addAttribute("list",list);
//        }
//        return "jsp/"+param;
//    }

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


    @PostMapping("/update/{id}")
    public String updateBoard(@PathVariable Long id, @RequestBody HomeDTO homeDTO) {
        System.out.println("--------------"+homeDTO);
        homeService.updateBoard(homeDTO);
        return "jsp/test";
    }

    @DeleteMapping("/delete/{id}")
    public String deleteBoard(@PathVariable Long id) {
        System.out.println("==================== "+id);
        homeService.deleteBoard(id);
        return "jsp/test";
    }

//list 목록부터 delete API 만들기 복습
    @GetMapping("/list")
    public String showList(Model model) {
        System.out.println("-----------------------");
        List<Map<String,Object>> list = homeService.lists();
        System.out.println("list;;;;;"+list);
        model.addAttribute("list",list);
        return "jsp/list";
    }

    @GetMapping("/listt")
    public String showListt(Model model) {
        System.out.println("++++++++++++++++++++++++++");
        List<HomeDTO> listt = homeService.listss();
        System.out.println("listt;;;;;"+listt);
        model.addAttribute("listt",listt);
        return "jsp/list";
    }

    @PostMapping("/insert1")
    public String createBoard1(@RequestBody HomeDTO homeDTO) {
        System.out.println("-------------"+homeDTO);
        homeService.createBoard1(homeDTO);
        System.out.println("인썰트"+homeDTO);
        return "jsp/list";
    }

    @PostMapping("/update1/{id}")
    public String updateBoard1(@PathVariable Long id,@RequestBody HomeDTO homeDTO) {
//        homeDTO.setId(id);
        System.out.println("------------"+homeDTO);
        homeService.updateBoard1(homeDTO);
        System.out.println("업데이트"+homeDTO);
        return "jsp/list";
    }

    @DeleteMapping("/delete1/{id}")
    public String deletetBoard1(@PathVariable Long id) {
        System.out.println("------------------"+id);
        homeService.deleteBoard1(id);
        System.out.println("업데이트"+id);
        return "jsp/list";
    }
//list 목록부터 delete API 만들기 복습2
    @GetMapping("/list2")
    public String showList2(Model model) {
        List<HomeDTO> list2 = homeService.list2();
        model.addAttribute("list2",list2);
        return "jsp/list";
    }

    @PostMapping("/insert2")
    public String insert2(@RequestBody HomeDTO homeDTO) {
        System.out.println("11111111111111111"+homeDTO);
        homeService.insert2(homeDTO);
        System.out.println("22222222222222"+homeDTO);
        return "jsp/list";
    }

    @PostMapping("/update2/{id}")
    public String update2(@PathVariable Long id, @RequestBody HomeDTO homeDTO) {
        System.out.println("1111111        "+id);
        homeDTO.setId(id);
        System.out.println("22222222222"+homeDTO);
        homeService.update2(homeDTO);
        System.out.println("33333333333"+homeDTO);
        return "jsp/list";
    }

    @DeleteMapping("/delete2/{id}")
    public String delete2(@PathVariable Long id) {
        System.out.println("1111111111111       "+id);
        homeService.delete2(id);
        System.out.println("22222222" );
        return "jsp/list";
    }
}
