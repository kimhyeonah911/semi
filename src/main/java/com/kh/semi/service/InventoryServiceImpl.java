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

    @Override
    public List<Inventory> selectLowInventoryTop4(int storeId) {
        return inventoryMapper.selectLowInventoryTop4(storeId);
    }

    @Override
    public int minusInventoryQuantity(int productNo, int storageNo, int quantity) {
        return inventoryMapper.minusInventoryQuantity(productNo, storageNo, quantity);
    }

    @Override
    public Inventory selectInventory(int storageNo, int storeId, int productNo) {
        return inventoryMapper.selectInventory(storageNo, storeId, productNo);
    }

    @Override
    public int updateInventoryQuantity(int storeId, int productNo, int storageNo, int quantity) {
        return inventoryMapper.updateInventoryQuantity(storeId, productNo,storageNo,quantity);
    }

    @Override
    public int insertInventory(Inventory inventory) {
        return inventoryMapper.insertInventory(inventory);
    }

}
