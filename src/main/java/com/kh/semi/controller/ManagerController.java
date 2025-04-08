package com.kh.semi.controller;

import com.kh.semi.domain.vo.*;
import com.kh.semi.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


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
    public String attendanceManagement(Model model, String storeId) {
        ArrayList<Attendance> list = attendanceService.getMyAttendanceList(storeId);
        model.addAttribute("list", list);
        return "manager/managerAttendanceView";
    }

    @GetMapping("salesManager.bo")
    public String saleManagerBoard() {
        return "manager/managerSalesView";
    }

    @GetMapping("storage.lo")
    public String storageManagement(Model model) {
        ArrayList<Storage> list = storageService.selectStorage();
        model.addAttribute("storageList", list);
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



}
