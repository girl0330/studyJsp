package com.march.studyjsp.domain.dailyJop.user;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //회원가입
    public Map<Object, Object> createUser(UserDTO userDTO) {
        System.out.println("====userServiceImple====");
        Map<Object, Object> map = new HashMap<>();


        // 아이디 중복 검사
        int idCheck = userMapper.idCheck(userDTO);

        if (idCheck > 0) {
            map.put("code", "error");
            map.put("message", "이미 사용중인 아이디 입니다.");
            return map;
        }

        //비밀번호 1,2 체크
        if(!userDTO.getPassword().equals(userDTO.getPassword2())) {
            map.put("code", "error");
            map.put("message", "비밀번호가 일치하지 않습니다.");
            return map;
        }

        // 이메일 중복 검사
        int emailCheck = userMapper.emailCheck(userDTO);

        if (emailCheck > 0) {
            map.put("code","error");
            map.put("message","이미 등록된 이메일 입니다.");
            return map;
        }

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        System.out.println("encodedPassword:::   "+encodedPassword);
        userDTO.setPassword(encodedPassword);
        userMapper.createUser(userDTO);
        map.put("code","success");
        map.put("message","회원가입성공");

        return map;
    }

    //개인 로그인
    public Map<Object, Object> personalUserService(UserDTO userDTO) {
        System.out.println("====personaluserServiceImple====");
        Map<Object, Object> map = new HashMap<>();

        String userId = userDTO.getUserId(); // 입력한 id값 가져오기
        String userPassword = userDTO.getPassword(); // 입력한 pw값 가져오기
        System.out.println(userId); // 입력한 id값 확인
        System.out.println(userPassword); // 입력한 pw값 확인

        String hashedPassword = userMapper.getHashedPassword(userId); // 아이디롤 통해서 암호화된 비밀번호를 DB에서 가져온다.
        System.out.println(hashedPassword); // 암호화된 비밀번호 확인

        if (hashedPassword == null) { // 암호화된 비밀번호가 없으면
            System.out.println("아이디가 존재하지 않음");
            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않습니다.");
            return map;
        }

        boolean check = passwordEncoder.matches(userPassword, hashedPassword); // 입력한 비번화 암호화된 비번이 맞는지 체크
        System.out.println(check); // 체크한 결과 (일치: ture/ 불일치: false 로 반환)
            if(!check) { // false 이면
                System.out.println("false임");
                map.put("code", "error");
                map.put("message", "비밀번호가 틀립니다.");
                return map;
            }
        System.out.println("ture임");
        userDTO.setPassword(hashedPassword); // 암호화된 비빌번호 dto에 넣기
        System.out.println("userDTO 확인::" + userDTO); // 암호화된 비빌번호가 들어갔느지 확인
        UserDTO userInfo = userMapper.findUserInfo(userDTO); // pw를 바꾼 dto로 입력한 id와 일치한 user정보 가져오기
        System.out.println("why??????????"+userInfo); // 가져온 user정보 확인

        String gradeCheck = userInfo.getGradeCode(); // 가져온 user정보에서 gradeCode만 가져오기
        System.out.println("hello!!!?  "+gradeCheck); // 가져온 gradeCode 확인
            if ("10".equals(gradeCheck)) { // gradeCode가 20면 개인 로그인 성공
                map.put("userInfo",userInfo);
                map.put("code","success");
                map.put("message","로그인 성공!");
                System.out.println("성공"+map);
                return map;
            } else { // 10이 아니면 개인 로그인 실패
                map.put("code", "error");
                map.put("message", "로그인 실패.");
                System.out.println("실패"+map);
                return map;
            }
    }

    //기업 로그인
    public Map<Object, Object> businessUserService(UserDTO userDTO) {
        System.out.println("====businessUserServiceImple====");
        Map<Object, Object> map = new HashMap<>();

        String userId = userDTO.getUserId(); // 입력한 id값 가져오기
        String userPassword = userDTO.getPassword(); // 입력한 pw값 가져오기
        System.out.println(userId); // 입력한 id값 확인
        System.out.println(userPassword); // 입력한 pw값 확인

        String hashedPassword = userMapper.getHashedPassword(userId); // 아이디롤 통해서 암호화된 비밀번호를 DB에서 가져온다.
        System.out.println(hashedPassword); // 암호화된 비밀번호 확인

        if (hashedPassword == null) { // 암호화된 비밀번호가 없으면
            System.out.println("아이디가 존재하지 않음");
            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않습니다.");
            return map;
        }

        boolean check = passwordEncoder.matches(userPassword, hashedPassword); // 입력한 비번화 암호화된 비번이 맞는지 체크
        System.out.println(check); // 체크한 결과 (일치: ture/ 불일치: false 로 반환)
        if(!check) { // false 이면
            System.out.println("false임");
            map.put("code", "error");
            map.put("message", "비밀번호가 틀립니다.");
            return map;
        }
        System.out.println("ture임");
        userDTO.setPassword(hashedPassword); // 암호화된 비빌번호 dto에 넣기
        System.out.println("userDTO 확인::" + userDTO); // 암호화된 비빌번호가 들어갔느지 확인
        UserDTO userInfo = userMapper.findUserInfo(userDTO); // pw를 바꾼 dto로 입력한 id와 일치한 user정보 가져오기
        System.out.println(userInfo); // 가져온 user정보 확인

        String gradeCheck = userInfo.getGradeCode(); // 가져온 user정보에서 gradeCode만 가져오기
        System.out.println(gradeCheck); // 가져온 gradeCode 확인
        if ("20".equals(gradeCheck)) { // gradeCode가 20면 개인 로그인 성공
            map.put("code","success");
            map.put("message","로그인 성공!");
            return map;
        } else { // 20이 아니면 기업 로그인 실패
            map.put("code", "error");
            map.put("message", "로그인 실패.");
            return map;
        }
    }

    //회원정보
//    public UserDTO findUser (UserDTO userDTO) {
//        System.out.println("====userServiceImple====");
//        UserDTO user = userMapper.findId(userDTO);
//        System.out.println("데이터를 잘 가져왔는지 확인함"+user);
//        return user;
//    }

    public UserDTO findUser(String userId) {
        System.out.println("====userServiceImple====");
        UserDTO user = userMapper.findId(userId);
        System.out.println(user);
        return user;
    }

    // 회원수정
    public Map<Object, Object> userUpdate(UserDTO userDTO) {
        System.out.println("====userServiceImple====");
        Map<Object, Object> infomation = userMapper.userUpdate(userDTO);
        System.out.println("수정된 정보 확인::;;;;;"+infomation);
        return infomation;
    }
}
