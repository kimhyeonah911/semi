package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class APIProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/getProductList")
    public List<Product> getProductLIst() {
        List<Product> list = productService.getProductLIst();
        return list;
    }

    @GetMapping("/categoryList")
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = productService.getCategoryList();
        if (list == null) {
            System.out.println("category list null");
        } else {
            System.out.println("category list: " + list);
        }
        return list;
    }

    @GetMapping("/clientList")
    public ArrayList<Client> getClientList() {
        ArrayList<Client> list = productService.getClientList();
        if (list == null) {
            System.out.println("client list null");
        } else {
            System.out.println("client list: " + list);
        }
        return list;
    }

    @PostMapping("/updateProductPause")
    @ResponseBody
    public String updateProductPause(@RequestParam("productNos") String productNos) { //1,2,3이런 형태로 들어옴
        //1,2,3 형태로 들어온 번호들을 리스트로 추출

            System.out.println("🔹 updateProductPause 실행됨! productNos: " + productNos);
            List<Integer> productNoList = Arrays.stream(productNos.split(",")) //split -> ["1", "2", "3" ..]배열로 바뀜 //Arrays.stream -> Stream<String> = "1", "2", ..형태로 변환
                    .map(Integer::parseInt) //"1"를 1로 변환 (문자열을 숫자로 변)
                    .toList(); //최종적으로 숫자 리스트로 변환

            int result = productService.updateProductPause(productNoList);

            String response =  result > 0 ? "success" : "fail";

            return response;

    }

    @PostMapping("/updateProductDelete")
    @ResponseBody
    public String updateProductDelete(@RequestParam("productNos") String productNos) { //1,2,3이런 형태로 들어옴
        //1,2,3 형태로 들어온 번호들을 리스트로 추출
        List<Integer> productNoList = Arrays.stream(productNos.split(",")) //split -> ["1", "2", "3" ..]배열로 바뀜 //Arrays.stream -> Stream<String> = "1", "2", ..형태로 변환
                .map(Integer::parseInt) //"1"를 1로 변환 (문자열을 숫자로 변)
                .toList(); //최종적으로 숫자 리스트로 변환

        int result = productService.updateProductDelete(productNoList);

        return result > 0 ? "success" : "fail";
    }

    @GetMapping("/searchProduct")
    public List<Product> searchProduct(@RequestParam(required = false) String selectedStatus,
                                @RequestParam(required = false) String selectedCategory,
                                @RequestParam(required = false) String searchedKeyword,
                                HttpSession session, Model model) {

        String status = (selectedStatus != null) ? selectedStatus : "Y";
        Integer categoryNo = (selectedCategory != null && !selectedCategory.isEmpty())
                ? Integer.parseInt(selectedCategory)
                : null;
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        List<Product> list = productService.searchProduct(status, categoryNo, keyword);
        System.out.println(list);
        model.addAttribute("list", list);
        return list;
    }


}
