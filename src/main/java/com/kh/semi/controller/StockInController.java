package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StockInController {
    @GetMapping("stockIn.stIn")
    public String stockIn(){
        return "employee/stockIn";
    }
}
