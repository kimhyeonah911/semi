package com.kh.semi.controller;

import com.kh.semi.domain.vo.*;
import com.kh.semi.service.AttendanceService;
import com.kh.semi.service.BoardService;
import com.kh.semi.service.MemberService;
import com.kh.semi.service.StoreService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;


@RequiredArgsConstructor
@Controller

public class EmployeeController {
    private final AttendanceService attendanceService;
    private final StoreService storeService;
    private final MemberService memberService;
    private final BoardService boardService;

    @GetMapping("employee.bo")
    public String employeeBoardList() {
        return "admin/boardListView";
    }

    @PostMapping("insert.co")
    public String showInsertPage() {
        return "employee/companyManagement"; // JSP 페이지 반환
    }

    @PostMapping("insertShop.co")
    public String insertCompany(HttpSession session, Model model, Store company) {

        Member loginUser = (Member) session.getAttribute("loginUser");

        // 로그인한 사용자의 정보 확인
        String userId = loginUser.getMemId();  // 예시: 사용자 아이디 가져오기
        String position = loginUser.getPosition();  // 예시: 사용자 포지션 가져오기

        System.out.println("현재 지점장으로 승인시킬 로그인된 계정: " + userId);
        System.out.println("사용자 포지션: " + position);

        model.addAttribute("store", company);
        int result = storeService.insertCompany(company);


        if (result > 0) {
            // 지점 생성 성공 시 지점 목록 페이지로 리다이렉트
            model.addAttribute("alertMessage", "지점이 성공적으로 신청되었습니다."); // 예시: store/list 페이지로 이동
            return "employee/companyManagement";
        } else {
            // 실패 시 에러 페이지로 이동
            model.addAttribute("errorMessage", "지점 생성에 실패했습니다.");
            return "common/errorPage";
        }
    }

    @GetMapping("/attendance.em")
    public String attendancePage(@RequestParam(defaultValue = "1") int cpage,
                                 @RequestParam("empNo") int empNo,
                                 Model model) {

        // 페이징 처리 관련 변수
        int listCount = attendanceService.getTotalAttendanceCount(empNo); // → empNo 기준으로 count
        int pageLimit = 5;
        int boardLimit = 10;
        PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit);

        // 리스트 조회
        ArrayList<Attendance> listpage = attendanceService.selectAttendancListByPage(empNo, pi);

        // model에 담기
        model.addAttribute("pageUrl", "attendance.em?empNo=" + empNo); // empNo 유지
        model.addAttribute("listpage", listpage);
        model.addAttribute("pi", pi);
        model.addAttribute("empNo", empNo); // empNo를 뷰에서도 쓸 수 있게 전달

        return "employee/employeeAttendanceView";
    }

    @GetMapping("/dash-employee.bo")
    public String dashEmployee(Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        String storeId = loginUser.getStoreId();

        // ✅ 공지사항 top 3 조회
        ArrayList<Board> noticeList = boardService.selectBoardListTop3();
        model.addAttribute("noticeList", noticeList);

        // 근무 현황
        int workingCount = attendanceService.countWorkingEmployees(storeId);
        int notWorkingCount = attendanceService.countNotWorkingEmployees(storeId);
        model.addAttribute("workingCount", workingCount);
        model.addAttribute("notWorkingCount", notWorkingCount);

        return "employee/dashBoard-employee";
    }


    @ResponseBody
    @PostMapping("/clockInOut")
    public String clockInOut(@RequestParam String type, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        Attendance attendance = new Attendance();
        attendance.setEmpNo(loginUser.getEmpNo());

        if ("in".equals(type)) {
            attendance.setClockIn(new Date());
            attendance.setStatus("W");
            int result = attendanceService.insertClockIn(attendance);
            if(result > 0){
                session.setAttribute("isWorking", true);
                return "redirect:/attendance.em?empNo=" + loginUser.getEmpNo();
            } else {
                return "출근 실패";
            }
        } else if ("out".equals(type)) {
            attendance.setClockOut(new Date());
            attendance.setStatus("L");
            int result = attendanceService.updateClockOut(attendance);
            if(result > 0){
                session.setAttribute("isWorking", false);
                return "redirect:/attendance.em?empNo=" + loginUser.getEmpNo();
            } else {
                return "퇴근 실패";
            }
        }
        return "잘못된 요청";
    }

}
