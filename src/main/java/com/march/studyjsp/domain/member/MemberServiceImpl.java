package com.march.studyjsp.domain.member;


import com.march.studyjsp.domain.board.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;


    @Override



    //회원가입
    public Map<String, String> saveUser(MemberDTO memberDTO) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        MemberDTO.setUserPw(passwordEncoder.encode(MemberDTO.getUserPw()));

        //아이디 중복검사
        Map<String, String> map = new HashMap<>();

        int idCheck = memberMapper.checkUserId(memberDTO);

        if(idCheck > 0) {
            map.put("code","error");
            map.put("message","아이디가 중복입니다.");
            return map;
        }

        //이메일 중복검사
        int emailCheck = memberMapper.checkUserEmail(memberDTO);

        if (emailCheck > 0) {
            map.put("code","error");
            map.put("message","이메일이 중복입니다.");
            return map;
        }

        memberMapper.saveUser(memberDTO);
        map.put("code","success");
        map.put("message","회원가입이 완료되었습니다.");
        return map;
    }

    //로그인
    @Override
    public Map<String,Object> doLogin(MemberDTO memberDTO) {
        Map<String, Object> map = new HashMap<>();

        //check id
        int checkLoginId = memberMapper.checkLoginId(memberDTO);
        if (checkLoginId == 0) {
            map.put("code","error");
            map.put("message","아이디를 확인해주세요.");
            return map;
        }

        //check password
        int checkLoginPw = memberMapper.checkLoginPw(memberDTO);
        if (checkLoginPw == 0) {
            map.put("code","error");
            map.put("message","비밀번호를 확인해주세요.");
            return map;
        }

//        MemberDTO userInfo = new MemberDTO();
//        userInfo = userMapper.doLogin(MemberDTO);

        MemberDTO userInfo = memberMapper.doLogin(memberDTO);

        //로그인
        map.put("loginInfo",userInfo);
        map.put("code","success");
        map.put("message","로그인성공");
        return map;
    }

    //회원목록
    @Override
    public List<MemberDTO> findAll() {
        return memberMapper.findAll();
    }

    //회원 상세보기
    @Override
    public MemberDTO memberDetail(Long id) {
        return memberMapper.memberDetail(id);
    }

    //회원 프로필
    @Override
    public MemberDTO findPro(int memberNo) {
        System.out.println("프로필 서비스");
        return memberMapper.findPro(memberNo);
    }

    //회원 프로필 수정
    @Override
    public Map<String, Object> memberUpdate(MemberDTO memberDTO, HttpSession session) {
        System.out.println("프로필 수정 서비스");
        Map<String, Object> map = new HashMap<>();

        memberMapper.memberUpdate(memberDTO);
        map.put("code","success");
        map.put("message", "회원정보 수정이 완료되었습니다.");
        System.out.println("수정된 데이터"+map);
        return map;
    }

////로그인
//
//    public Map<String, Object> goLogin(MemberDTO userDTO) {
//        Map<String, Object> map = new HashMap<>();
//        int loginIdCheck = userMapper.loginIdCheck(userDTO);
//        int loginPasswordCheck = userMapper.loginPassworkCheck(userDTO);
//
//        if (loginIdCheck == 0) {
//            map.put("code","error");
//            map.put("message","아이디를 확인해주세요.");
//            return map;
//        }
//        int loginPassworkCheck = userMapper.loginPassworkCheck(userDTO);
//        if (loginPassworkCheck == 0) {
//            map.put("code","error");
//            map.put("message","비밀번호를 확인해주세요.");
//            return map;
//        }
//
//        MemberDTO userLoginInfo = userMapper.goLogin(userDTO);
//
//        map.put("userLoginInfo", userLoginInfo);
//        map.put("code", "success");
//        map.put("message", "로그인 성공");
//
//        return map;
//    }

    //회원가입
//    public Map<String, Object> makeUser(MemberDTO userDTO) {
//        Map<String, Object> map = new HashMap<>();
//        int makeUserIdCheck = userMapper.makeUserIdCheck(userDTO);
//
//        if(makeUserIdCheck > 0) {
//            map.put("code", "error");
//            map.put("message", "아이디가 중복입니다.");
//            return map;
//        }
//
//        int makeUserEmailCheck = userMapper.makeUserEmailCheck(userDTO);
//
//        if (makeUserEmailCheck > 0) {
//            map.put("code", "error");
//            map.put("massage", "아이디가 중복입니다.");
//            return map;
//        }
//
//        userMapper.makeUser(userDTO);
//        map.put("code","success");
//        map.put("massage", "회원가입 성공");
//        return map;
//    }
}
