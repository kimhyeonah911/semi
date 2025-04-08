package com.kh.semi.RESTController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import com.kh.semi.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIStockController {
    @Autowired
    private StockService stockService;

    @GetMapping("searchStockIn")
    public List<Map<String, Object>> searchStockInList(@RequestParam String stockStatus,
                                                     @RequestParam String startDate,
                                                     @RequestParam String endDate) {
        List<Stock> stockList = stockService.searchStockInList(stockStatus, startDate, endDate);

        List<StockProduct> allProducts = stockService.selectStockProductList();

        List<Map<String, Object>> result = new ArrayList<>();

        for (Stock stock : stockList) {
            Map<String, Object> map = new HashMap<>();
            map.put("stock", stock);

            // 해당 입고 번호에 맞는 품목만 필터링
            List<StockProduct> filteredProducts = new ArrayList<>();
            for (StockProduct product : allProducts) {
                if (product.getStockNo() == stock.getStockNo()) {
                    filteredProducts.add(product);
                }
            }

            map.put("stockProductList", filteredProducts);
            result.add(map);
        }

        return result;
    }

    @GetMapping("searchStockOut")
    public List<Map<String, Object>> searchStockOutList(@RequestParam String stockStatus,
                                                     @RequestParam String startDate,
                                                     @RequestParam String endDate) {
        List<Stock> stockList = stockService.searchStockOutList(stockStatus, startDate, endDate);

        List<StockProduct> allProducts = stockService.selectStockProductList();

        List<Map<String, Object>> result = new ArrayList<>();

        for (Stock stock : stockList) {
            Map<String, Object> map = new HashMap<>();
            map.put("stock", stock);

            // 해당 입고 번호에 맞는 품목만 필터링
            List<StockProduct> filteredProducts = new ArrayList<>();
            for (StockProduct product : allProducts) {
                if (product.getStockNo() == stock.getStockNo()) {
                    filteredProducts.add(product);
                }
            }

            map.put("stockProductList", filteredProducts);
            result.add(map);
        }

        return result;
    }

    @PostMapping("insertStockIn")
    public String insertStockIn(@RequestBody Map<String, Object> requestData) {
        ObjectMapper mapper = new ObjectMapper(); // Jackson 라이브러리 사용

        try {
            // stock 데이터 파싱
            Stock stock = mapper.convertValue(requestData.get("stock"), Stock.class);

            // stockProductList 데이터 파싱
            List<StockProduct> stockProductList = mapper.convertValue(
                    requestData.get("stockProductList"),
                    new TypeReference<List<StockProduct>>() {}
            );

            int result = 0;
            if (stockService.insertStockIn(stock) > 0) {
                for (StockProduct sp : stockProductList) {
                    sp.setStockNo(stock.getStockNo());
                    result = stockService.insertStockProduct(sp);
                }
            } else {
                return "fail";
            }

            return result > 0 ? "success" : "fail";

        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @PostMapping("insertStockOut")
    public String insertStockOut(@RequestBody Map<String, Object> requestData) {
        ObjectMapper mapper = new ObjectMapper(); // Jackson 라이브러리 사용

        try {
            // stock 데이터 파싱
            Stock stock = mapper.convertValue(requestData.get("stock"), Stock.class);

            // stockProductList 데이터 파싱
            List<StockProduct> stockProductList = mapper.convertValue(
                    requestData.get("stockProductList"),
                    new TypeReference<List<StockProduct>>() {}
            );

            int result = 0;
            if (stockService.insertStockOut(stock) > 0) {
                for (StockProduct sp : stockProductList) {
                    sp.setStockNo(stock.getStockNo());
                    result = stockService.insertStockProduct(sp);
                }
            } else {
                return "fail";
            }

            return result > 0 ? "success" : "fail";

        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @PostMapping("/updateStockIn")
    public String updateStockInStatus(@RequestBody Map<String, List<Integer>> payload) {
        List<Integer> stockNos = payload.get("stockNos");
        int result = 0;

        try {
            for (int stockNo : stockNos) {
                result = stockService.updateStockInStatus(stockNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result > 0 ? "success" : "fail";
    }

    @PostMapping("/updateStockOut")
    public String updateStockOutStatus(@RequestBody Map<String, List<Integer>> payload) {
        List<Integer> stockNos = payload.get("stockNos");
        int result = 0;

        try {
            for (int stockNo : stockNos) {
                result = stockService.updateStockOutStatus(stockNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result > 0 ? "success" : "fail";
    }

    @PostMapping("/deleteStock")
    public String deleteStock(int stockNo) {
        System.out.println(stockNo);
        int result1 = stockService.deleteStock(stockNo);
        int result2 = stockService.deleteStockProduct(stockNo);
        int result = result1 * result2;

        return result > 0 ? "success" : "fail";
    }

    @GetMapping("selectStock")
    public Map<Object, Object>  selectStock(int stockNo) {
        Map<Object, Object> result = new HashMap<>();
        Stock stock = stockService.selectStock(stockNo);
        ArrayList<StockProduct> stockProduct = stockService.selectStockProduct(stockNo);
        result.put("stock", stock);
        result.put("stockProducts", stockProduct);

        return result;
    }
}
