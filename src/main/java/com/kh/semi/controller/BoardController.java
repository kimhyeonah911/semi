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
public class BoardController {

    @GetMapping("list.bo")
    public String selectBoardList() {
        return "board/boardListView-admin";
    }

    @GetMapping("enroll.bo")
    public String enrollForm() {
        return "board/boardEnrollForm-admin";
    }

    @GetMapping("update.bo")
    public String updateForm() {
        return "board/boardUpdate-admin";
    }

    @GetMapping("manager.bo")
    public String managerBoardList() {
        return "board/boardListView-manager";
    }

    @GetMapping("employee.bo")
    public String employeeBoardList() {
        return "board/boardListView-employee";
    }

    @GetMapping("managerenroll.bo")
    public String managerEnrollForm() {
        return "board/boardEnrollForm-manager";
    }

}
