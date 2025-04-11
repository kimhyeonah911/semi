package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.StockProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface InventoryMapper {
    ArrayList<Inventory> searchInventoryList(Map<String, Object> paramMap);
    int countInventoryList(Map<String, Object> paramMap);
    List<StockProduct> searchStockProductList(Map<String, Object> paramMap);
    int countStockProductList(Map<String, Object> paramMap);
    List<Inventory> selectLowInventoryTop4(int storeId);
    Inventory selectInventory(int storageNo, int storeId, int productNo);
    int updateInventoryQuantity(@Param("storeId") int storeId,
                                @Param("storageNo") int storageNo,
                                @Param("productNo") int productNo,
                                @Param("quantity") int quantity);
    int insertInventory(Inventory inventory);
    int minusInventoryQuantity(@Param("productNo") int productNo,
                               @Param("storageNo") int storageNo,
                               @Param("quantity") int quantity);
}
