package com.kh.semi.controller;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;


@Controller
public class MemberController {

    private final MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;

    }

    @GetMapping("enrollForm.me")
    public String enrollMemberForm() {

        return "member/memberEnrollForm";
    }

    @PostMapping("login.me")
    public ModelAndView loginMember(@ModelAttribute Member member, HttpSession session, ModelAndView mv) {
        // 로그인을 위한 ID와 비밀번호가 들어온 Member 객체 확인
        System.out.println("Requested memId: " + member.getMemId());
        System.out.println("Requested memPwd: " + member.getMemPwd());

        // 서비스 호출하여 로그인 처리
        Member loginMember = memberService.loginMember(member.getMemId(), member.getMemPwd());

        if (loginMember == null) {
            mv.addObject("errorMsg", "아이디나 비밀번호가 일치하지 않습니다.");
            mv.setViewName("common/errorPage");

        } else {
            mv.addObject("loginUser", loginMember);  // 로그인된 회원 정보 저장
            mv.setViewName("employee/companyManagement");  // 로그인 성공 시 지점생성 페이지 이동
            System.out.println(loginMember);
        }

        return mv;
    }





    @GetMapping("logout.me")
    public String logout() {

        return "index";
    }

}


