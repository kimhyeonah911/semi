package com.kh.semi.service;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.mappers.StockMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class StockServiceImpl implements StockService {
    private final StockMapper stockMapper;

    @Override
    public ArrayList<Stock> selectStockList() {
        return stockMapper.selectStockList();
    }

    @Override
    public ArrayList<Stock> searchStockList(String stockStatus, String startDate, String endDate) {
        return stockMapper.searchStockList(stockStatus, startDate, endDate);
    }

}
