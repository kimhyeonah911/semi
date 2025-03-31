package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Product {
    @GetMapping("product.bo")
    public String product() {
        return "admin/productManagement";
    }
    @GetMapping("price.bo")
    public String price() {
        return "admin/priceManagement";
    }
    @GetMapping("manager.bo")
    public String manager() {
        return "admin/managerManagement";
    }
    @GetMapping("member.bo")
    public String member() {
        return "admin/memberManagement";
    }
    @GetMapping("shop.bo")
    public String shop() {
        return "admin/shopManagement";
    }
    @GetMapping("company.bo")
    public String company() {
        return "admin/companyManagement";
    }
}
