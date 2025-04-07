package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import com.kh.semi.service.InventoryService;
import com.kh.semi.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIInventoryController {

    @Autowired
    private InventoryService inventoryService;

    @GetMapping("/getInventoryList")
    public ArrayList<Inventory> getInventoryList(){
        ArrayList<Inventory> list = inventoryService.getInventoryList();
        if(list == null){
            System.out.println("inventory list is null");
        } else {
            System.out.println("inventory list : " + list);
        }
        return inventoryService.getInventoryList();
    }

    @GetMapping("/searchInventoryList")
    public ArrayList<Inventory> searchInventoryList( @RequestParam(required = false) String selectedStorageNo,
                                                     @RequestParam(required = false) String searchedKeyword){
        Integer storageNo = (selectedStorageNo != null && !selectedStorageNo.isEmpty()) ? Integer.parseInt(selectedStorageNo) : null;
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        ArrayList<Inventory> list = inventoryService.searchInventoryList(storageNo, keyword);

        return list;
    }

    @GetMapping("/searchStockProductList")
    public Map<String, Object> searchStockProductList(
            @RequestParam(required = false) String selectedStartDate,
            @RequestParam(required = false) String selectedEndDate,
            @RequestParam(required = false) String searchedKeyword,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int pageSize
    ){

        //전체 데이터 개수
        int totalCount = inventoryService.countStockProductList(
                selectedStartDate, selectedEndDate, searchedKeyword );

        //PageInfo 객체 생성
        PageInfo pageInfo = new PageInfo(totalCount, page, pageSize, pageSize);


        //입출고 목록 가져오기
        List<StockProduct> stockList = inventoryService.searchStockProductList(
                selectedStartDate, selectedEndDate, searchedKeyword, pageInfo);


        // 응답에 포함할 데이터 준비
        Map<String, Object> result = new HashMap<>();
        result.put("list", stockList);
        result.put("totalCount", totalCount);
        result.put("pageInfo", pageInfo);  // PageInfo 추가

        System.out.println(stockList);
        return result;

    }
}
