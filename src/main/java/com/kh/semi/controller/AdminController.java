package com.kh.semi.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;


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




}
