package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface StockMapper {
    ArrayList<Stock> selectStockList();
    ArrayList<Stock> searchStockList(@Param("stockStatus") String stockStatus,
                                     @Param("startDate") String startDate,
                                     @Param("endDate") String endDate);
    int insertStock(Stock stock);
    int insertStockProduct(StockProduct stockProduct);
    ArrayList<StockProduct> selectStockProductList();
    int updateStockStatus(int stockNo);
    int deleteStock(int stockNo);
    int deleteStockProduct(int stockNo);
    Stock selectStock(int stockNo);
    ArrayList<StockProduct> selectStockProduct(int stockNo);
    int updateCompletedStockIn();
    ArrayList<Stock> selectCompletedStockIn();
    int updateStockProcessedStatus(int stockNo);
}
