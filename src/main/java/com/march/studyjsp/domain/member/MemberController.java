package com.march.studyjsp.domain.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")

public class MemberController {
    private final MemberService memberService;

    //회원가입 페이지 이동
    @GetMapping("/register")
    public String registerView () {
        System.out.println("회원가입 화면 실행");
        return "jsp/member/member_register";
    }

    //회원가입 등록
    @PostMapping("/registerInsert")
    @ResponseBody //jsp한테 응답
    public Map<String, String> userInsert(MemberDTO memberDTO) {
        Map<String, String> map = memberService.saveUser(memberDTO);
        return map;
    }

    //로그인 페이지 이동
    @GetMapping("/login")
    public String loginView () {
        System.out.println("로그인 페이지");
        return "jsp/member/member_login";
    }

    //로그인 요청
    @PostMapping("/doLogin")
    @ResponseBody //jsp한테 응답
    public Map<String, Object> memberLogin(MemberDTO memberDTO, HttpSession session) {
        System.out.println("로그인 화면");

        Map<String, Object> map = memberService.doLogin(memberDTO);

        if("error".equals(map.get("code"))) {
            return map;
        }

//        MemberDTO loginUser = (MemberDTO) map.get("loginInfo");
//        model.addAttribute("memberNo",loginUser.getMemberNo());

        //session
        session.setAttribute("userInfo",map.get("loginInfo"));
        return map;
    }

    // 로그아웃
    @GetMapping("/doLogout")
    public String logout(HttpSession session) {
        // 세션 제거
        session.invalidate();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "jsp/member/member_login";
    }

    //회원목록
    @GetMapping("/memberList")
    public String userMemberList(HttpSession session, Model model) {

        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            System.out.println("글 목록");
            List<MemberDTO> memberList = memberService.findAll();

            System.out.println("memberList   "+memberList);
            model.addAttribute("memberList",memberList);
            return "jsp/member/member_memberList";
        } else {
            return "redirect:/member/login";
        }
    }

    //회원목록 상세보기
    @GetMapping("/memberDetail")
    public String showMemberDetail(@RequestParam("id") Long id, Model model){
        System.out.println("회원 상세페이지");
        MemberDTO memberDetail = memberService.memberDetail(id);
        model.addAttribute("memberDetail",memberDetail);
        return "jsp/member/member_detail";
    }
}
