package com.kh.semi.service;

import com.kh.semi.domain.vo.Store;
import com.kh.semi.domain.vo.StoreSales;
import com.kh.semi.mappers.StoreMapper;
import com.kh.semi.mappers.StoresalesMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Transactional
@RequiredArgsConstructor
@Service
public class StoresalesServiceImpl implements StoresalesService {


    private final StoresalesMapper storesalesMapper;

    @Override
    public int updateStoreSales(int storeId, int daySales) {
        System.out.println(">> updateStoreSales 호출됨! storeId=" + storeId + ", daySales=" + daySales);
        //오늘 날짜 구해서 오늘날짜의 매출이 있으면 update해서 +하고 없으면 새로 insert함
        java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

        StoreSales existing = storesalesMapper.selectTodaySales(storeId, today);
        System.out.println(">> selectTodaySales 결과: " + existing);

        if (existing != null) {
            System.out.println(">> 기존 매출 존재함! update 실행됨");
            System.out.println(">> 기존 매출: " + existing);
            int result = storesalesMapper.updateTodaySales(storeId, daySales, today);
            System.out.println(">> update 결과: " + result);
            return result;
        } else {
            System.out.println(">> 기존 매출 없음! insert 실행됨");
            StoreSales newSales = new StoreSales();
            newSales.setStoreId(storeId);
            newSales.setDaySales(daySales);
            newSales.setSalesDate(today);


            LocalDate now = LocalDate.now();
            LocalDate firstDayOfMonth = now.withDayOfMonth(1);
            java.sql.Date salesMonth = java.sql.Date.valueOf(firstDayOfMonth);
            newSales.setSalesMonth(salesMonth); // 2025-04-01 같이 들어감

            // 월 매출 관련 필드도 계산해서 저장

            newSales.setMonthSales(daySales); // 처음 생성이니 초기값은 당일 매출

            return storesalesMapper.insertTodaySales(newSales);
        }
    }

    @Override
    public List<Map<String, Object>> getMonthSales(int storeId) {
        return storesalesMapper.getMonthSales(storeId);
    }
}
