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

    @GetMapping("searchStock")
    public ArrayList<Stock> searchStockList(String stockStatus, String startDate, String endDate ){
        return stockService.searchStockList(stockStatus, startDate, endDate);
    }

    @PostMapping("insertStock")
    public String insertStock(@RequestBody Map<String, Object> requestData) {
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
            if (stockService.insertStock(stock) > 0) {
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

    @PostMapping("/updateStock")
    public String updateStockStatus(@RequestBody Map<String, List<Integer>> payload) {
        List<Integer> stockNos = payload.get("stockNos");
        int result = 0;

        try {
            for (int stockNo : stockNos) {
                result = stockService.updateStockStatus(stockNo);
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
