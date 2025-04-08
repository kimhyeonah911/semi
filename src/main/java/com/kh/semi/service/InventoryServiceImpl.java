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
import java.util.Map;

@RequiredArgsConstructor
@Service
public class InventoryServiceImpl implements InventoryService {


    private final InventoryMapper inventoryMapper;


    @Override
    public ArrayList<Inventory> getInventoryList() {
        return inventoryMapper.getInventoryList();
    }

    @Override
    public ArrayList<Inventory> searchInventoryList(Map<String, Object> paramMap) {
        return inventoryMapper.searchInventoryList(paramMap);
    }

    @Override
    public int countInventoryList(Map<String, Object> paramMap) {
        return inventoryMapper.countInventoryList(paramMap);
    }


    public List<StockProduct> searchStockProductList(Map<String, Object> paramMap) {
        return inventoryMapper.searchStockProductList(paramMap);
    }

    public int countStockProductList(Map<String, Object> paramMap) {
        return inventoryMapper.countStockProductList(paramMap);
    }

}
