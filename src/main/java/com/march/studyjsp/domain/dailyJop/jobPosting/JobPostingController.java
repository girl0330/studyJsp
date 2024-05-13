package com.march.studyjsp.domain.dailyJop.jobPosting;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/job")
public class JobPostingController {
    @GetMapping("/write")
    public String resumeWrite () {
        System.out.println("기업이 작성");
        return "jsp/form/job_posting_write";
    }
}
