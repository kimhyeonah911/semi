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

public class EmployeeController {

    @GetMapping("employee.bo")
    public String employeeBoardList() {
        return "employee/boardListView-employee";
    }

    @GetMapping("insert.co")
    public String insertCompany() {
        return "employee/companyManagement";
    }

    @GetMapping("attendance.em")
    public String attendanceManagement() {
        return "employee/employeeAttendanceView";
    }

    @GetMapping("dash-employee.bo")
    public String dashEmployee() {
        return "employee/dashBoard-employee";
    }



}
