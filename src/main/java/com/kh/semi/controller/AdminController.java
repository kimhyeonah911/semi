package com.kh.semi.controller;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.MemberService;
import com.kh.semi.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;


@RequiredArgsConstructor
@Controller
public class AdminController {
    private final MemberService memberService;
    private final ProductService productService;

    @GetMapping("accept.ma")
    public String acceptManager() {
        return "admin/managerManagement";
    }

    @GetMapping("accept.me")
    public String acceptMember() {
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
    public String productManagement(Model model) {
        ArrayList<Product> list = productService.selectProductList();
        System.out.println("제품 리스트: " + list);
        model.addAttribute("product", list);
        return "admin/productManagement";
    }

    @GetMapping("delivery.ma")
    public String deliveryManagement() {return "admin/deliveryManagement";
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


}
