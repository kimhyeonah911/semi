package com.kh.semi.service;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import com.kh.semi.mappers.BoardMapper;
import com.kh.semi.mappers.InventoryMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class InventoryServiceImpl implements InventoryService {


    private final InventoryMapper inventoryMapper;


    @Override
    public ArrayList<Inventory> getInventoryList() {
        return inventoryMapper.getInventoryList();
    }

    @Override
    public ArrayList<Inventory> searchInventoryList(Integer storageNo, String keyword) {
        return inventoryMapper.searchInventoryList(storageNo, keyword);
    }

    @Override
    public List<StockProduct> searchStockProductList(String startDate, String endDate, String keyword, PageInfo pageInfo) {
        // PageInfo에서 offset, limit 값 가져오기
        int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
        int limit = pageInfo.getBoardLimit();

        // RowBounds 생성
        RowBounds rowBounds = new RowBounds(offset, limit);

        // RowBounds의 값 출력 (디버깅용)
        System.out.println("Offset: " + rowBounds.getOffset());
        System.out.println("Limit: " + rowBounds.getLimit());

        // 매퍼 호출 시 RowBounds를 전달
        return inventoryMapper.searchStockProductList(startDate, endDate, keyword, rowBounds);
    }

    @Override
    public int countStockProductList(String startDate, String endDate, String keyword) {
        return inventoryMapper.countStockProductList(startDate, endDate, keyword);
    }

}
