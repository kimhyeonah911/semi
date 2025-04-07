package com.kh.semi.service;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.StockProduct;

import java.util.ArrayList;
import java.util.List;

public interface InventoryService {
    ArrayList<Inventory> getInventoryList();
    ArrayList<Inventory> searchInventoryList(Integer storageNo, String keyword);
    List<StockProduct> searchStockProductList(String startDate, String endDate, String keyword, PageInfo pageInfo);
    int countStockProductList(String startDate, String endDate, String keyword);

}
