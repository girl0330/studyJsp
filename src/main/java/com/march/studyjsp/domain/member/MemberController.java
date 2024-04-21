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
    //회원프로필 페이지 이동
    @GetMapping("/profile")
    public String profileView(HttpSession session, Model model) {
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            // 로그인한 사용자 정보가 있다면 해당 사용자 프로필 페이지로 이동
            System.out.println("회원프로필 화면 실행");
            MemberDTO userI = (MemberDTO) session.getAttribute("userInfo");
            MemberDTO memberProfile = memberService.findPro(userI.getMemberNo());
            model.addAttribute("memberProfile",memberProfile);
            return "jsp/member/member_profile"; // 회원 프로필화면 반환.
        } else {
            // 로그인한 사용자 정보가 없다면 로그인 페이지로 리다이렉트 또는 예외 처리
            return "redirect:/member/login";
            // 또는 throw new UnauthorizedException(); // 예외를 던지는 등의 처리
        }
    }

    //회원프로필 수정
    @PostMapping("/memberUpdate")
    @ResponseBody
    public Map<String, Object> memberUpdate(MemberDTO memberDTO, HttpSession session) {
//        MemberDTO userI = (MemberDTO) session.getAttribute("userInfo");
//        MemberDTO DTO = new MemberDTO();
//        DTO = userI.getMemberNo()
        MemberDTO userI = (MemberDTO) session.getAttribute("userInfo");

        // 새로운 MemberDTO 객체 생성하여 memberNo 설정
        MemberDTO DTO = new MemberDTO();
        memberDTO.setMemberNo(userI.getMemberNo());
        System.out.println("새로운 DTO"+ DTO);

        // 변경된 memberId를 serviceImpl로 보내기
//        Map<String, Object> result = serviceImpl.memberUpdate(DTO, session);

        System.out.println("수정할 data::: "+memberDTO);
        Map<String, Object> map = memberService.memberUpdate(memberDTO, session);
        System.out.println("map''''");
        System.out.println("회원 수정 완료");
        return map;
    }

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

    //내 상세정보 확인


    //회원목록 상세보기
    @GetMapping("/memberDetail")
    public String showMemberDetail(@RequestParam("id") Long id, Model model){
        System.out.println("회원 상세페이지");
        MemberDTO memberDetail = memberService.memberDetail(id);
        model.addAttribute("memberDetail",memberDetail);
        return "jsp/member/member_detail";
    }
}
