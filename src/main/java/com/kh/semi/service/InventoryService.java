package com.kh.semi.service;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.Stock;

import java.util.ArrayList;

public interface InventoryService {
    ArrayList<Inventory> getInventoryList();
    ArrayList<Inventory> searchInventoryList(Integer storageNo, String keyword);
}
