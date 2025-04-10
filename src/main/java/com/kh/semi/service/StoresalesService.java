package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.StoreSales;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface StoresalesService {
    int updateStoreSales(int storeId, int daySales);
    List<Map<String, Object>> getMonthSales(int storeId);
    int getTodayTotalSales(int storeId);

    List<Map<String, Object>> getAllStoresMonthSales();
    List<Map<String, Object>> selectTodaySalesDash();

}