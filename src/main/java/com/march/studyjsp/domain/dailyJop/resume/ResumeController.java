package com.march.studyjsp.domain.dailyJop.resume;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/resume")
public class ResumeController {
    @GetMapping("/write")
    public String resumeWrite () {
        return "jsp/form/resume_write";
    }
}
