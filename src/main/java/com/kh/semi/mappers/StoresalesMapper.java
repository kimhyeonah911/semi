package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Store;
import com.kh.semi.domain.vo.StoreSales;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface StoresalesMapper {

    StoreSales selectTodaySales(@Param("storeId") int storeId, @Param("today") Date today);
    int updateTodaySales(@Param("storeId") int storeId, @Param("daySales") int daySales, @Param("today") Date today);
    int insertTodaySales(StoreSales sales);
    List<Map<String, Object>> getMonthSalesTotal();
}
