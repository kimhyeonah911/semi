package com.kh.semi.controller;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.service.AttendanceService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;


@RequiredArgsConstructor
@Controller

public class EmployeeController {
    private final AttendanceService attendanceService;

    @GetMapping("employee.bo")
    public String employeeBoardList() {
        return "admin/boardListView";
    }

    @GetMapping("insert.co")
    public String insertCompany() {
        return "employee/companyManagement";
    }

    @GetMapping("/attendance.em")
    public String attendancePage(@RequestParam("empNo") int empNo, Model model) {
        ArrayList<Attendance> attendList = attendanceService.getAttendanceMy(empNo);
        model.addAttribute("attendList", attendList);
        System.out.println(attendList);
        return "employee/employeeAttendanceView";
    }

    @GetMapping("dash-employee.bo")
    public String dashEmployee() {
        return "employee/dashBoard-employee";
    }

    @ResponseBody
    @PostMapping("/clockInOut")
    public String clockInOut(@RequestParam String type, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "로그인 필요";
        }

        Attendance attendance = new Attendance();
        attendance.setEmpNo(loginUser.getEmpNo());

        if ("in".equals(type)) {
            attendance.setClockIn(new Date());
            attendance.setStatus("W");
            int result = attendanceService.insertClockIn(attendance);
            System.out.println(result);
            if(result>0){
                session.setAttribute("isWorking", true);
                return "출근 완료";
            }else{
                return "출근 실패";
            }

        } else if ("out".equals(type)) {
            attendance.setClockOut(new Date()); //
            attendance.setStatus("L");
            int result = attendanceService.updateClockOut(attendance);
            if(result>0){
                session.setAttribute("isWorking", false);
                return "퇴근 완료";
            }else{
                return "퇴근 실패";
            }
        }

        return "잘못된 요청";
    }




}
