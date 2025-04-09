package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.*;
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

    @GetMapping("/selectProductList")
    public List<Product> selectProductList(int clientId) {
        List<Product> list = productService.selectProductList(clientId);
        return list;
    }

    @GetMapping("/searchProductName")
    public List<Product> searchProductName(String productName) {
        List<Product> list = productService.searchProductName(productName);
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

    @PostMapping("/updateProductRestart")
    @ResponseBody
    public String updateProductRestart(@RequestParam("productNos") String productNos) { //1,2,3이런 형태로 들어옴
        //1,2,3 형태로 들어온 번호들을 리스트로 추출
        List<Integer> productNoList = Arrays.stream(productNos.split(",")) //split -> ["1", "2", "3" ..]배열로 바뀜 //Arrays.stream -> Stream<String> = "1", "2", ..형태로 변환
                .map(Integer::parseInt) //"1"를 1로 변환 (문자열을 숫자로 변)
                .toList(); //최종적으로 숫자 리스트로 변환

        int result = productService.updateProductRestart(productNoList);

        return result > 0 ? "success" : "fail";
    }

    @GetMapping("/searchProduct")
    public Map<String, Object> searchProduct(@RequestParam(required = false) String selectedStatus,
                                @RequestParam(required = false) String selectedCategory,
                                @RequestParam(required = false) String searchedKeyword,
                                @RequestParam(defaultValue = "1") int page,
                                @RequestParam(defaultValue = "10") int pageSize) {
        String status = (selectedStatus != null) ? selectedStatus : "Y";
        Integer categoryNo = (selectedCategory != null && !selectedCategory.isEmpty())
                ? Integer.parseInt(selectedCategory)
                : null;
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        int offset = (page - 1) * pageSize;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("status", status);
        paramMap.put("categoryNo", categoryNo);
        paramMap.put("keyword", keyword);
        paramMap.put("offset", offset);
        paramMap.put("limit", pageSize);


        List<Product> list = productService.searchProduct(paramMap);

        int totalCount = productService.countProduct(paramMap);
        int maxPage = (int)Math.ceil((double)totalCount / pageSize);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("currentPage", page);
        pageInfo.put("maxPage", maxPage);

        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("totalCount", totalCount);
        result.put("pageInfo", pageInfo);

        System.out.println("result : " + result);

        return result;
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

    @GetMapping("getProductSales")
    public Map<String, Object> getProductSales(HttpSession session) {
        int storeId = (int) session.getAttribute("storeId");
        List<Product> productSalesList = productService.getProductSales(storeId);

        List<String> productName = productSalesList.stream()
                                    .map(Product::getProductName)
                                    .toList();
        List<Integer> totalAmount = productSalesList.stream()
                                    .map(Product::getTotalAmount)
                                    .toList();

        Map<String, Object> result = new HashMap<>();
        result.put("productName", productName);
        result.put("totalAmount", totalAmount);

        return result;
    }



}
