package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Stock;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface StockMapper {
    ArrayList<Stock> selectStockList();
    ArrayList<Stock> searchStockList(@Param("stockStatus") String stockStatus,
                                     @Param("startDate") String startDate,
                                     @Param("endDate") String endDate);

}
