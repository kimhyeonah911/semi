package com.kh.semi.controller;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.MemberService;
import com.kh.semi.service.ProductService;
import com.kh.semi.utils.Template;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }


    @PostMapping("/enrollProduct")
    public String enrollProduct(@ModelAttribute Product product, @RequestParam(value = "enrollImage", required = false) MultipartFile enrollImage, RedirectAttributes redirectAttributes, HttpSession session) {
        //product객체에서 productName, categoryNo, color, productSize, stockInPrice, stockOutPrice, clientId, imageUrl
        Product p = new Product();
        p.setProductName(product.getProductName());
        p.setCategoryNo(product.getCategoryNo());
        p.setColor(product.getColor());
        p.setProductSize(product.getProductSize());
        p.setStockInPrice(product.getStockInPrice());
        p.setStockOutPrice(product.getStockOutPrice());
        p.setClientId(product.getClientId());

        if (enrollImage != null && !enrollImage.isEmpty()) {
            String imageUrl = Template.saveFile(enrollImage, session, "/resources/productImg/");
            if (imageUrl != null) {
                p.setImageUrl("/resources/productImg/" + imageUrl);
            }

        }

        int result = productService.enrollProduct(p);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("alert", "성공적으로 상품이 등록되었습니다.");
            return "redirect:/product.bo";
        } else {
            redirectAttributes.addFlashAttribute("productData", product); // 입력 데이터 유지
            redirectAttributes.addFlashAttribute("showModal", "enrollModal"); // 어떤 모달을 열지 지정
            return "redirect:/product.bo"; // 모달이 포함된 JSP로 이동
        }
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@ModelAttribute Product product, RedirectAttributes redirectAttributes) {
        Product p = new Product();
        p.setProductNo(product.getProductNo());
        p.setProductName(product.getProductName());
        p.setCategoryNo(product.getCategoryNo());
        p.setColor(product.getColor());
        p.setProductSize(product.getProductSize());
        p.setStockInPrice(product.getStockInPrice());
        p.setStockOutPrice(product.getStockOutPrice());

        int result = productService.updateProduct(p);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("alert", "성공적으로 상품이 수정되었습니다.");
            return "redirect:/product.bo";
        } else {
            redirectAttributes.addFlashAttribute("productData", product); // 입력 데이터 유지
            redirectAttributes.addFlashAttribute("showModal", "editModal"); // 어떤 모달을 열지 지정
            return "redirect:/product.bo"; // 모달이 포함된 JSP로 이동
        }

    }

}
