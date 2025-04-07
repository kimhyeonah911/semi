package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Inventory;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface InventoryMapper {
    ArrayList<Inventory> getInventoryList();
    ArrayList<Inventory> searchInventoryList(Integer storageNo, String keyword);
}
