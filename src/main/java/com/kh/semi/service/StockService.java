package com.kh.semi.service;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;

import java.util.ArrayList;

public interface StockService {
    ArrayList<Stock> selectStockList(int empNo);
    ArrayList<Stock> searchStockInList(String stockStatus, String startDate, String endDate, int empNo);
    ArrayList<Stock> searchStockOutList(String stockStatus, String startDate, String endDate, int empNo);
    int insertStockIn(Stock stock);
    int insertStockOut(Stock stock);
    int insertStockProduct(StockProduct stockProduct);
    ArrayList<StockProduct> selectStockProductList(int empNo);
    int updateStockInStatus(int stockNo);
    int updateStockOutStatus(int stockNo);
    int deleteStock(int stockNo);
    int deleteStockProduct(int stockNo);
    Stock selectStock(int stockNo);
    ArrayList<StockProduct> selectStockProduct(int stockNo);

    //입고완료
    int updateCompletedStockIn();
    ArrayList<Stock> selectCompletedStockIn(); // COMPLETED + Y 인 애들
    int updateStockProcessedStatus(int stockNo); // STATUS = 'C'로 변경

    //출고완료
    int updateCompletedStockOut();
    ArrayList<Stock> selectCompletedStockOut();

    int countStockIn(int empNo);
    int countStockOut(int empNo);
}
