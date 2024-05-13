package com.march.studyjsp.domain.dailyJop.jobPosting;

import lombok.Data;

@Data
public class JopPostingDTO {

    private int jobId;
    private int userUuid;
    private String title;
    private String content;
    private String employmentType;
    private String requiredExperience;
    private String requiredEducation;
    private String location;
    private int numberOfStaff;
    private String endDate;
    private String salary;
    private String workingHours;
    private String workingDays;
    private int state;
    private int viewCount;
    private int scrapCount;
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;
}
