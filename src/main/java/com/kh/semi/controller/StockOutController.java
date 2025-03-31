package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StockOutController {
    @GetMapping("stockOut.stOut")
    public String stockIn(){
        return "employee/stockOut";
    }
}