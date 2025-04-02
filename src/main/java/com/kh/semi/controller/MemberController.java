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

    @GetMapping("logout.me")
    public String logout() {

        return "index";
    }

    @PostMapping("login.me")
    public ModelAndView login(@ModelAttribute Member member, ModelAndView mv, HttpSession session) {
        // Member 객체에서 memId, memPwd 추출
        String memId = member.getMemId();
        String memPwd = member.getMemPwd();

        // MemberService의 loginMember 호출
        Member loginMember = memberService.loginMember(memId, memPwd);
        System.out.println("로그인한 회원 정보: " + loginMember);

        // 로그인 성공 여부 확인
        if (loginMember == null) {
            session.setAttribute("alertMsg", "아이디나 비밀번호가 일치하지 않습니다.");
            mv.setViewName("redirect:/");
        } else {
            session.setAttribute("loginUser", loginMember); // 로그인된 회원 정보 저장

            // 헤더에서 쓸 사용자 이름 추출
            session.setAttribute("memName", loginMember.getMemName()); // 사용자 이름 저장

            // 콘솔에서 확인 (디버깅)
            System.out.println("세션에 저장된 userName: " + session.getAttribute("userName"));

            mv.setViewName("redirect:/insert.co"); // 로그인 성공 후 이동
        }
        return mv;
    }

    }


