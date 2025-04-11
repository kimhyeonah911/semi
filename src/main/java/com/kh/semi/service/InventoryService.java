package com.kh.semi.service;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.StockProduct;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface InventoryService {
    ArrayList<Inventory> searchInventoryList(Map<String, Object> paramMap);
    int countInventoryList(Map<String, Object> paramMap);
    List<StockProduct> searchStockProductList(Map<String, Object> paramMap);
    int countStockProductList(Map<String, Object> paramMap);
    Inventory selectInventory(int storageNo, int storeId, int productNo);
    int updateInventoryQuantity(int storeId, int productNo, int storageNo, int quantity);
    int insertInventory(Inventory inventory);
    List<Inventory> selectLowInventoryTop4(int storeId);
    int minusInventoryQuantity(int productNo, int storageNo, int quantity);
}
