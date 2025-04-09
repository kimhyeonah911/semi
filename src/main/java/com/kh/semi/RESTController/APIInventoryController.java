package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import com.kh.semi.service.InventoryService;
import com.kh.semi.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class APIInventoryController {

    @Autowired
    private InventoryService inventoryService;


    @GetMapping("/searchInventoryList")
    public Map<String, Object> searchInventoryList( @RequestParam (required = false) String storeId,
                                                     @RequestParam(required = false) String selectedStorageNo,
                                                     @RequestParam(required = false) String searchedKeyword,
                                                     @RequestParam(defaultValue = "1") int page,
                                                     @RequestParam(defaultValue = "10") int pageSize){
        Integer memStoreId = Integer.parseInt(storeId);
        Integer storageNo = (selectedStorageNo != null && !selectedStorageNo.isEmpty()) ? Integer.parseInt(selectedStorageNo) : null;
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        int offset = (page - 1) * pageSize;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("storeId", memStoreId);
        paramMap.put("storageNo", storageNo);
        paramMap.put("keyword", keyword);
        paramMap.put("offset", offset);
        paramMap.put("limit", pageSize);

        List<Inventory> list = inventoryService.searchInventoryList(paramMap);

        int totalCount = inventoryService.countInventoryList(paramMap);
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


    @GetMapping("/searchStockProductList")
    @ResponseBody
    public Map<String, Object> searchStockProductList( @RequestParam(required = false) String selectedStartDate,
                                                       @RequestParam(required = false) String selectedEndDate,
                                                       @RequestParam(required = false) String searchedKeyword,
                                                       @RequestParam(defaultValue = "1") int page,
                                                       @RequestParam(defaultValue = "5") int pageSize) {
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        int offset = (page - 1) * pageSize;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("startDate", selectedStartDate);
        paramMap.put("endDate", selectedEndDate);
        paramMap.put("keyword", keyword);
        paramMap.put("offset", offset);
        paramMap.put("limit", pageSize);

        // 리스트 가져오기
        List<StockProduct> list = inventoryService.searchStockProductList(paramMap);

        // 전체 개수 (페이징 계산용)
        int totalCount = inventoryService.countStockProductList(paramMap);
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
}
