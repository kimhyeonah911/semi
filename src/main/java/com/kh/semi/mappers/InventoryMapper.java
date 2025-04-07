package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.StockProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface InventoryMapper {
    ArrayList<Inventory> getInventoryList();
    ArrayList<Inventory> searchInventoryList(Integer storageNo, String keyword);
    List<StockProduct> searchStockProductList(@Param("startDate") String startDate,
                                              @Param("endDate") String endDate,
                                              @Param("keyword") String keyword,
                                              RowBounds rowBounds);

    int countStockProductList(@Param("startDate") String startDate,
                              @Param("endDate") String endDate,
                              @Param("keyword") String keyword);
}
