package com.march.studyjsp.domain.dailyJop.user;

import lombok.Data;
@Data
public class UserDTO {

    private int uuid;
    private String userId;
    private String password;
    private String password2;
    private String name;
    private String birthday;
    private String genderCode;
    private int age;
    private String email;
    private String phoneNumber;
    private String businessRegistrationNumber;
    private String gradeCode;
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;

}
