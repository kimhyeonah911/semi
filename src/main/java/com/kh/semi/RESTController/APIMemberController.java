package com.kh.semi.RESTController;

import com.kh.semi.service.MemberService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/member")
public class APIMemberController {
    private final MemberService memberService;

    public APIMemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    //아이디 중복 확인
    @GetMapping("/id")
    public String checkId(String checkId) {
        int result = memberService.checkId(checkId);

        if(result > 0){
            return "NNN";
        } else{
            return "YYY";
        }
    }
}
