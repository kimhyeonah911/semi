package com.kh.semi.controller;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.service.AttendanceService;
import com.kh.semi.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {

    private final MemberService memberService;
    private final AttendanceService attendanceService;

    @Autowired
    public MemberController(MemberService memberService, AttendanceService attendanceService) {
        this.memberService = memberService;
        this.attendanceService = attendanceService;
    }

    @GetMapping("enrollForm.me")
    public String enrollMemberForm() {

        return "member/memberEnrollForm";
    }

    @GetMapping("logout.me")
    public String logout(HttpSession session) {
        session.setAttribute("alertMsg", "로그아웃 되었습니다.");
        session.setAttribute("loginUser", null);
        return "index";
    }

    @PostMapping("login.me")
    public ModelAndView login(@ModelAttribute Member member, ModelAndView mv, HttpSession session) {
        // 입력값
        String memId = member.getMemId();
        String memPwd = member.getMemPwd();

        // 로그인 시도
        Member loginMember = memberService.loginMember(memId, memPwd);
        System.out.println("로그인한 회원 정보: " + loginMember);

        if (loginMember == null) {
            session.setAttribute("alertMsg", "아이디나 비밀번호가 일치하지 않습니다.");
            mv.setViewName("redirect:/");
        } else {
            session.setAttribute("loginUser", loginMember);
            session.setAttribute("memName", loginMember.getMemName());
            session.setAttribute("position", loginMember.getPosition());
            session.setAttribute("empNo", loginMember.getEmpNo());
            session.setAttribute("storeId", loginMember.getStoreId());

            session.setAttribute("loginMember", loginMember);
            boolean isWorking = attendanceService.isClockedIn(loginMember.getEmpNo());
            session.setAttribute("isWorking", isWorking); //



            String position = loginMember.getPosition();
            if ("admin".equals(position)) {
                mv.setViewName("redirect:/dash.bo");
            } else if ("manager".equals(position))  {
                mv.setViewName("redirect:/dash-manager.bo");
            } else if ("employee".equals(position)) {
                mv.setViewName("redirect:/dash-employee.bo");
            } else {
                // 정의되지 않은 포지션일 경우 기본 페이지로
                mv.setViewName("forward:/insert.co");
            }
        }
        return mv;
    }

    @PostMapping("insert.me")
    public String insertMember(@ModelAttribute Member member, ModelAndView mv, HttpSession session) {
        // Member 객체에서 memId, memPwd, memName, phone 추출
        String phone = member.getPhone().replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
        Member m = new Member();
        m.setMemId(member.getMemId());
        m.setMemPwd(member.getMemPwd());
        m.setMemName(member.getMemName());
        m.setPhone(phone);

        // MemberService의 insertMember 호출
        int result = memberService.insertMember(m);
        // 회원가입 성공 여부 확인
        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입을 완료하였습니다.");
            return "redirect:/";
        } else {
            mv.addObject("errorMsg", "회원가입에 실패하였습니다.");
            return "common/errorPage";
        }
    }

    @PostMapping("updatePhone")
    public String updatePhone(String phone, String memId, HttpSession session, Model model) {
        int result = memberService.updatePhone(phone, memId);
        if (result > 0){
            Member loginUser = (Member) session.getAttribute("loginUser");
            loginUser.setPhone(phone);
            session.setAttribute("loginUser", loginUser);
            session.setAttribute("alertMsg","전화번호 변경 완료");
            return "common/mypage";
        } else{
            model.addAttribute("errorMsg", "전화번호 변경 실패");
            return "common/mypage";
        }
    }

    @GetMapping("mypage.bo")
    public String adminPage() {
        return "common/mypage";
    }

    @ResponseBody
    @PostMapping("/updatePwd")
    public String updatePwd(String newPwd, String memPwd, String memId, HttpSession session, Model model) {


        int result = memberService.updatePwd(newPwd, memPwd, memId);
        System.out.printf("result  : " + result);
        if (result > 0){
            Member loginUser = (Member) session.getAttribute("loginUser");
            loginUser.setMemPwd(newPwd);
            session.setAttribute("loginUser", loginUser);
            return "success";
        } else{
            return "false";
        }
    }
}


