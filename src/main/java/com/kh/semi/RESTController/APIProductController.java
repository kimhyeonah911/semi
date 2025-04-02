package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api")
public class APIProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/categoryList")
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = productService.getCategoryList();
        if (list == null) {
            System.out.println("🚨 카테고리 리스트가 NULL입니다!");
        } else {
            System.out.println("✅ 카테고리 리스트: " + list);
        }
        System.out.println("카테고리 리스트: " + list);
        return list;
    }

}
