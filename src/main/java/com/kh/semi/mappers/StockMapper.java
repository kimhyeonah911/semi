package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface StockMapper {
    ArrayList<Stock> selectStockList();
    ArrayList<Stock> searchStockInList(@Param("stockStatus") String stockStatus,
                                     @Param("startDate") String startDate,
                                     @Param("endDate") String endDate);
    ArrayList<Stock> searchStockOutList(@Param("stockStatus") String stockStatus,
                                       @Param("startDate") String startDate,
                                       @Param("endDate") String endDate);
    int insertStockIn(Stock stock);
    int insertStockOut(Stock stock);
    int insertStockProduct(StockProduct stockProduct);
    ArrayList<StockProduct> selectStockProductList();
    int updateStockInStatus(int stockNo);
    int updateStockOutStatus(int stockNo);
    int deleteStock(int stockNo);
    int deleteStockProduct(int stockNo);
    Stock selectStock(int stockNo);
    ArrayList<StockProduct> selectStockProduct(int stockNo);
    
    //입고완료
    int updateCompletedStockIn();
    ArrayList<Stock> selectCompletedStockIn();
    int updateStockProcessedStatus(int stockNo);

    //출고완료
    int updateCompletedStockOut();
    ArrayList<Stock> selectCompletedStockOut();
}
