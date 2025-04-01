package com.kh.semi.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@RequiredArgsConstructor
@Controller
public class AdminController {

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
    public String productManagement() {
        return "admin/productManagement";
    }

    @GetMapping("delivery.ma")
    public String deliveryManagement() {
        return "admin/deliveryManagement";
    }

    @GetMapping("employee.in")
    public String employeeInfoView() {
        return "admin/employeeInfoView";
    }

    @GetMapping("adminmypage.bo")
    public String adminPage() {return "admin/adminMyPage";}

}
