package com.march.studyjsp.domain.member;

import lombok.Data;
//user_info
@Data
public class MemberDTO {

        private int memberNo;
        private String userId;
        private String password;
        private String name;
        private String nickname;
        private String email;
        private String phoneNumber;
        private String mobileNumber;
        private String status;
        private String grade;
        private int point;
        private String joinDate;
        private boolean consentSnsAd;
        private boolean passwordReset;
        private String passwordChangeDate;
        private String passwordChangeScheduledDate;
        private int loginFailures;
        private String lastLogin;
        private String withdrawalReasonCode;
        private String withdrawalReason;
        private String withdrawalDate;
        private String systemRegistrarId;
        private String systemRegisterDatetime;
        private String systemUpdaterId;
        private String systemUpdateDatetime;

}