package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.ProductService;
import com.kh.semi.service.StoresalesService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


@RestController
@RequestMapping("/api")
public class APIProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private StoresalesService storesalesService;

    @GetMapping("/selectProductList")
    public List<Product> selectProductList(int clientId) {
        List<Product> list = productService.selectProductList(clientId);
        return list;
    }

    @GetMapping("/searchProductName")
    public List<Product> searchProductName(String productName, int clientId) {
        List<Product> list = productService.searchProductName(productName, clientId);
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

//        System.out.println("result : " + result);

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

    @GetMapping("getMonthSales")
    public Map<String, Object> getMonthSales(HttpSession session) {
        int storeId = (int) session.getAttribute("storeId");
        List<Map<String, Object>> monthlySales = storesalesService.getMonthSales(storeId);

        // 월별 매출을 저장할 Map
        Map<String, Integer> salesMap = new HashMap<>();
        for (Map<String, Object> row : monthlySales) {
            // 월별 매출과 매출 월
            String month = (String) row.get("SALESMONTH");  // yyyy-MM 형태의 월
            Object monthSalesObj = row.get("MONTHSALES"); // 월별 매출
            // null 체크 후, 매출 값이 null이면 0으로 처리
            Integer sales = (monthSalesObj != null) ? ((Number) monthSalesObj).intValue() : 0;
            // Map에 저장
            salesMap.put(month, sales);
        }

        // 12개월 기준의 매출 데이터를 준비
        List<String> months = new ArrayList<>();
        List<Integer> salesLastYear = new ArrayList<>();
        List<Integer> salesThisYear = new ArrayList<>();

        LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

        for (int i = 23; i >= 0; i--) {
            LocalDate targetMonth = now.minusMonths(i);
            String monthStr = targetMonth.format(formatter);
            months.add(monthStr);

            // Map에서 월별 매출 가져오기, 없으면 0으로 처리
            Integer sales = salesMap.get(monthStr);
            if (sales == null) {
                sales = 0; // 없으면 0으로 처리
            }

            if (i >= 12) {
                salesLastYear.add(sales); // 1년 전 데이터
            } else {
                salesThisYear.add(sales); // 최근 12개월 데이터
            }
        }

        // 반환할 데이터 구성
        Map<String, Object> response = new HashMap<>();
        response.put("month", months.subList(12, 24)); // 최근 12개월만
        response.put("salesLastYear", salesLastYear); // 1년 전 매출
        response.put("salesThisYear", salesThisYear); // 현재 매출

        return response;
    }

    @GetMapping("getDaySales")
    public Map<String, Object> getDaySales() {
        List<Map<String, Object>> daySalesList = storesalesService.selectTodaySalesDash();

        // 반환할 데이터 구성
        Map<String, Object> response = new HashMap<>();
        List<String> labels = new ArrayList<>(); // 지점명
        List<Integer> data = new ArrayList<>();  // 매출액

        for (Map<String, Object> row : daySalesList) {
            labels.add((String) row.get("STORE_NAME")); // 지점명
            Object saleObj = row.get("DAY_SALES");
            int sale = saleObj != null ? ((Number) saleObj).intValue() : 0;
            data.add(sale);
        }

        response.put("labels", labels);
        response.put("data", data);
        return response;
    }









}
