package com.kh.semi.service;

import com.kh.semi.domain.vo.Stock;

import java.util.ArrayList;

public interface StockService {
    ArrayList<Stock> selectStockList();
    ArrayList<Stock> searchStockList(String stockStatus, String startDate, String endDate);
}
