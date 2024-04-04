package com.march.studyjsp.domain.user;

import lombok.Data;
//user_info
@Data
public class UserDTO {

        private int userNo ;
        private String userId ;
        private String userPw ;
        private String userName ;
        private String userEmail ;
        private String userAuth ;
        private String systemRegistrarId;
        private String systemUpdaterId;
        private String systemRegistrarDatetime;
        private String systemUpdateDatetime;

}