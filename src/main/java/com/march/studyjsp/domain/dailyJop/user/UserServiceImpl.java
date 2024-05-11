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

    //로그인
    public Map<Object, Object> UserLogin(UserDTO userDTO) {
        System.out.println("====userServiceImple====");
        Map<Object, Object> map = new HashMap<>();

        //가입 정보를 아이디로 확인하기
        String userId = userDTO.getUserId();
        String userPassword = userDTO.getPassword();

        System.out.println(userId);
        System.out.println(userPassword);

        String hashedPassword = userMapper.getHashedPassword(userId); // 아이디롤 통해서 암호화된 비밀번호를 가져온다.
        System.out.println(hashedPassword); // 암호화된 비밀번호 확인

        if (hashedPassword == null) { // 암호화된 비밀번호가 없으면
            System.out.println("아이디가 존재하지 않음");
            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않습니다.");
            return map;
        }

        boolean check = passwordEncoder.matches(userPassword, hashedPassword); // 입력한 비번화 암호화된 비번이 맞는지 체크
        System.out.println(check); // 체크한 결과

        if(!check) { // 입력한 비번과 암호화된 비번이 일치하지 않으면
            userDTO.setPassword(hashedPassword);
            System.out.println("userDTO 확인::" + userDTO);
            UserDTO userInfo = userMapper.findUserInfo(userDTO);
            System.out.println(userInfo);

            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않습니다.");
            return map;
        } else {
            map.put("code","success");
            map.put("message","로그인 성공!");
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
