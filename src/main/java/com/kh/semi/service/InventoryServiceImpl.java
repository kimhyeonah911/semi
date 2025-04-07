package com.kh.semi.service;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.mappers.BoardMapper;
import com.kh.semi.mappers.InventoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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

}
