package com.march.studyjsp.domain.dailyJop.resume;

import lombok.Data;

@Data
public class ResumeDTO {

    private int resumeId;
    private String userId;
    private String title;
    private String content;
    private String education;
    private String schoolName;
    private String major;
    private String address;
    private String priorExperience;
    private String priorCompanyName;
    private String priorCompanyTenure;
    private String careerObjective;
    private String certification;
    private String createdDate;
    private String createdDatetime;
    private int viewCount;
    private int scrapCount;

}
