package com.kh.semi.controller;

import com.kh.semi.domain.vo.*;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.Storage;

import com.kh.semi.service.AttendanceService;
import com.kh.semi.service.MemberService;
import com.kh.semi.service.StockService;
import com.kh.semi.service.StorageService;
import com.kh.semi.domain.vo.*;
import com.kh.semi.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Controller
public class ManagerController {
    private final StorageService storageService;
    private final StockService stockService;
    private final AttendanceService attendanceService;
    private final ProductService productService;


    @GetMapping("manager.bo")
    public String managerBoardList() {
        return "admin/boardListView";
    }


    @GetMapping("managerenroll.bo")
    public String managerEnrollForm() {
        return "manager/boardEnrollForm-manager";
    }

    @GetMapping("dash-manager.bo")
    public String dashManager() {

        return "manager/dashBoard-manager";
    }

    @GetMapping("attendance.ma")
    public String attendanceManagement(@RequestParam(defaultValue = "1") int cpage, Model model, String storeId, HttpSession session) {

        ArrayList<Attendance> list = attendanceService.getMyAttendanceList(storeId);
        Set<String> empNameList = list.stream()
                .map(Attendance::getEmpName)
                .collect(Collectors.toSet());
        model.addAttribute("empNameList", empNameList);
        System.out.println(list);
        model.addAttribute("list", list);

        Member loginMember = (Member) session.getAttribute("loginMember");
        storeId = loginMember.getStoreId();

        // 페이징 처리 관련 변수
        int listCount = attendanceService.getAttendanceCount(storeId); // → empNo 기준으로 count
        int pageLimit = 5;
        int boardLimit = 10;

        PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit);
        System.out.println("페이징 정보 : " + pi);

        ArrayList<Attendance> listpage = attendanceService.selectAttendanceListPage(storeId, pi);
        model.addAttribute("listpage", listpage); // jsp el 태그에서 db 값 불러올 때 clent 변수로 불러옴 << 확인 부탁
        model.addAttribute("pi", pi);
        return "manager/managerAttendanceView";
    }

    @GetMapping("salesManager.bo")
    public String saleManagerBoard() {
        return "manager/managerSalesView";
    }

    @GetMapping("storage.lo")
    public String storageManagement(@RequestParam(defaultValue = "1") int cpage, Model model) {
        // 페이징바 처리 코드
        int listCount = storageService.StorageCount();
        int pageLimit = 5;     // 하단에 보여질 페이징 바 수
        int boardLimit = 10;   // 한 페이지에 보여질 입고처 수
        model.addAttribute("pageUrl", "storage.lo");
        PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit);

        ArrayList<Storage> listpage = storageService.selectStorageCount(pi);
        model.addAttribute("storage", listpage); // jsp el 태그에서 db 값 불러올 때 clent 변수로 불러옴 << 확인 부탁
        model.addAttribute("pi", pi);

        return "manager/storageManagementView";
    }

    @PostMapping("insert.sto")
    public String insertStorage(Storage storage, HttpSession session, ModelAndView mv) {
        Storage s = new Storage();
        s.setStorageLocation(storage.getStorageLocation());
        s.setAbleAmount(storage.getAbleAmount());
        int result = storageService.insertStorage(s);
        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 창고를 등록하였습니다.");
            return "redirect:/storage.lo";
        } else {
            mv.addObject("errorMsg", "창고 등록에 실패하였습니다.");
            return "common/errorPage";
        }
    }

    @GetMapping("stockManage.bo")
    public String stockManagement() {
        return "manager/stockManageView";
    }

    @GetMapping("stockIn.sto")
    public String stockInManagement(Model model) {
        ArrayList<Stock> list = stockService.selectStockList();
        ArrayList<Storage> list2 = storageService.selectStorage();
        ArrayList<Client> list3 = productService.selectClientList();
        ArrayList<StockProduct> list4 = stockService.selectStockProductList();
        model.addAttribute("stock", list);
        model.addAttribute("storage", list2);
        model.addAttribute("client", list3);
        model.addAttribute("stockProduct", list4);
        return "manager/stockInView";
    }

    @GetMapping("stockOut.sto")
    public String stockOutManagement() {
        return "manager/stockOutView";
    }

    @PostMapping("updateAttendance.ma")
    public String updateAttendance(Attendance attendance, HttpSession session) {

        int result = attendanceService.updateAttendance(attendance);
        if(result > 0){
            session.setAttribute("alertMsg", "근태 관리 수정 성공");
        } else {
            session.setAttribute("alertMsg", "근태 관리 수정 실패");
        }
        return "redirect:/attendance.ma";
    }

    @GetMapping("selectAttendance.ma")
    public String selectAttendance(@RequestParam(required = false) String empName,
                                   @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
                                   @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate,
                                   HttpSession session, Model model) {
        // 기존 코드
        int result = attendanceService.updateAttendance(attendance);
        if(result > 0){
            session.setAttribute("alertMsg", "근태 관리 수정 성공");
        } else {
            session.setAttribute("alertMsg", "근태 관리 수정 실패");
        }
        return "redirect:/attendance.ma";
    }

    @GetMapping("selectAttendance.ma")
    public String selectAttendance(@RequestParam(defaultValue = "1") int cpage,
                                   @RequestParam(required = false) String empName,
                                   @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
                                   @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate,
                                   HttpSession session, Model model) {
        String storeId = ((Member) session.getAttribute("loginUser")).getStoreId();

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("storeId", storeId);
        paramMap.put("empName", empName);
        paramMap.put("startDate", startDate);
        paramMap.put("endDate", endDate);

        // 필터링 리스트
        ArrayList<Attendance> list = attendanceService.selectAttendance(paramMap);
        model.addAttribute("listpage", list);

        // 전체 직원 리스트
        ArrayList<Attendance> allList = attendanceService.getMyAttendanceList(storeId);
        Set<String> empNameList = allList.stream()
                .map(Attendance::getEmpName)
                .collect(Collectors.toSet());
        model.addAttribute("empNameList", empNameList);

        model.addAttribute("selectedEmpName", empName);
        model.addAttribute("selectedStartDate", startDate);
        model.addAttribute("selectedEndDate", endDate);

        System.out.println("empName = " + empName);
        System.out.println("startDate = " + startDate);
        System.out.println("endDate = " + endDate);

        // 점심 먹고 조회버튼 클릭시 페이징 처리 넣기

//        // 페이징 처리 관련 변수
//        int listCount = attendanceService.getAttendanceCount(storeId); // → empNo 기준으로 count
//        int pageLimit = 5;
//        int boardLimit = 10;
//
//        PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit);
//        System.out.println("페이징 정보 : " + pi);
//
//        ArrayList<Attendance> listpage = attendanceService.selectAttendanceListPage(storeId, pi);
//        model.addAttribute("list", listpage);
//        model.addAttribute("pi", pi);

        return "manager/managerAttendanceView";
    }
}

