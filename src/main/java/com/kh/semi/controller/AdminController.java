package com.kh.semi.controller;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;


@RequiredArgsConstructor
@Controller
public class AdminController {
    private final MemberService memberService;

    @GetMapping("accept.ma")
    public String acceptManager() {
        return "admin/managerManagement";
    }

    @GetMapping("accept.me")
    public String acceptMember(Model model) {
        ArrayList<Member> list = memberService.acceptMemberList();
        model.addAttribute("acceptMember", list);
        System.out.println("직원 승인 : " + list);
        return "admin/memberManagement";
    }

    @GetMapping("list.bo")
    public String selectBoardList() {
        return "admin/boardListView-admin";
    }

    @GetMapping("enroll.bo")
    public String enrollForm() {
        return "admin/boardEnrollForm-admin";
    }

    @GetMapping("update.bo")
    public String updateForm() {
        return "admin/boardUpdate-admin";
    }

    @GetMapping("dash.bo")
    public String dashBoard() {
        return "admin/dashBoard-admin";
    }

    @GetMapping("sales.bo")
    public String saleBoard() {
        return "admin/salesBoard";
    }

    @GetMapping("product.bo")
    public String productManagement() {
        return "admin/productManagement";
    }

    @GetMapping("delivery.ma")
    public String deliveryManagement() {
        return "admin/deliveryManagement";
    }

    @GetMapping("employee.in")
    public String employeeInfoView(Model model) {
        ArrayList<Member> list = memberService.selectMemberList();
        model.addAttribute("member", list);
        System.out.println("회원 리스트: " + list);
        return "admin/employeeInfoView";
    }

    @GetMapping("adminmypage.bo")
    public String adminPage() {return "adminMypage";}

    @PostMapping("/approveMember")
    public String approveMember(@RequestParam String memId, @RequestParam String storeSelect, HttpSession session, Model model) {
        System.out.println(storeSelect);
        int result = memberService.approveMember(memId,storeSelect);
        if(result > 0){
            session.setAttribute("alertMsg","직원 승인 완료");
            return "admin/memberManagement";
        } else{
            model.addAttribute("errorMsg", "직원 승인 실패");
            return "common/errorPage";
        }
    }
}
