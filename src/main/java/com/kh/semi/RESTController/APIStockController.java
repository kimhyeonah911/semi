package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api")
public class APIStockController {
    @Autowired
    private StockService stockService;

    @GetMapping("searchStock")
    public ArrayList<Stock> searchStockList(String stockStatus, String startDate, String endDate ){
        System.out.println("stockStatus = " + stockStatus);
        System.out.println("startDate = " + startDate);
        System.out.println("endDate = " + endDate);
        return stockService.searchStockList(stockStatus, startDate, endDate);
    }


}
