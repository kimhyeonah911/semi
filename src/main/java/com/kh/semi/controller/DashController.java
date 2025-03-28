package com.kh.semi.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@RequiredArgsConstructor
@Controller
public class DashController {

    @GetMapping("dash.bo")
    public String dashBoard() {
        return "board/dashBoard-admin";
    }

    @GetMapping("dash-manager.bo")
    public String dashManager() {
        return "board/dashBoard-manager";
    }

}
