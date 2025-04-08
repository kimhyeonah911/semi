package com.kh.semi.service;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
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

    @Override
    public int insertStock(Stock stock) {
        return stockMapper.insertStock(stock);
    }

    @Override
    public int insertStockProduct(StockProduct stockProduct) {
        return stockMapper.insertStockProduct(stockProduct);
    }

    @Override
    public ArrayList<StockProduct> selectStockProductList() {
        return stockMapper.selectStockProductList();
    }

    @Override
    public int updateStockStatus(int stockNo) {
        return stockMapper.updateStockStatus(stockNo);
    }

    @Override
    public int deleteStock(int stockNo) {
        return stockMapper.deleteStock(stockNo);
    }

    public int deleteStockProduct(int stockNo){
        return stockMapper.deleteStockProduct(stockNo);
    }

    @Override
    public Stock selectStock(int stockNo) {
        return stockMapper.selectStock(stockNo);
    }

    @Override
    public ArrayList<StockProduct> selectStockProduct(int stockNo) {
        return stockMapper.selectStockProduct(stockNo);
    }

    @Override
    public int updateCompletedStockIn() {
        return stockMapper.updateCompletedStockIn();
    }

    @Override
    public ArrayList<Stock> selectCompletedStockIn() {
        return stockMapper.selectCompletedStockIn();
    }

    @Override
    public int updateStockProcessedStatus(int stockNo) {
        return stockMapper.updateStockProcessedStatus(stockNo);
    }

}
