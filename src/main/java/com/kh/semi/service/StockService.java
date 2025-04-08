package com.kh.semi.service;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;

import java.util.ArrayList;

public interface StockService {
    ArrayList<Stock> selectStockList();
    ArrayList<Stock> searchStockList(String stockStatus, String startDate, String endDate);
    int insertStock(Stock stock);
    int insertStockProduct(StockProduct stockProduct);
    ArrayList<StockProduct> selectStockProductList();
    int updateStockStatus(int stockNo);
    int deleteStock(int stockNo);
    int deleteStockProduct(int stockNo);
    Stock selectStock(int stockNo);
    ArrayList<StockProduct> selectStockProduct(int stockNo);
    int updateCompletedStockIn();
    ArrayList<Stock> selectCompletedStockIn(); // COMPLETED + Y 인 애들
    int updateStockProcessedStatus(int stockNo); // STATUS = 'C'로 변경
}
