package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.StoreSales;
import com.kh.semi.service.StoresalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIStoreSalesController {
    @Autowired
    private StoresalesService storesalesService;

    @GetMapping("/monthSalesTotal")
    public List<Map<String, Object>> getMonthSalesTotal() {
        List<Map<String, Object>> result = storesalesService.getMonthSalesTotal();
        System.out.println("월 매출 조회 결과: " + result); // 이거 찍어봐
        return result;
    }

}
