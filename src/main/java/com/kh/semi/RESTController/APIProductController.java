package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

    @PostMapping("update.cl")
    public String updateClient(Client client) {
        Client c = new Client();
        c.setClientId(client.getClientId());
        c.setClientName(client.getClientName());
        c.setClientCeo(client.getClientCeo());
        c.setClientPhone(client.getClientPhone());
        c.setClientAddress(client.getClientAddress());

        int result = productService.updateClient(c);
        if (result > 0) {
            return "success";
        } else {
            return "fail";
        }
    }

    @PostMapping("delete.cl")
    public String deleteClient(int clientId) {
        int result = productService.deleteClient(clientId);
        if (result > 0) {
            return "success";
        } else {
            return "fail";
        }
    }



}
