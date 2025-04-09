package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    List<Product> getProductLIst();
    List<Product> selectProductList(int clientId);
    List<Product> searchProductName(String productName);

    ArrayList<Product> selectImageUrl();
    ArrayList<Category> getCategoryList();
    ArrayList<Client> getClientList();
    int updateProductPause(List<Integer> productNoList);
    int updateProductDelete(List<Integer> productNoList);
    int updateProductRestart(List<Integer> productNoList);
    int enrollProduct(Product p);
    int updateProduct(Product p);
    List<Product> searchProduct(Map<String, Object> paramMap);
    int countProduct(Map<String, Object> paramMap);
    ArrayList<Client> selectClientList();
    int insertClient(Client client);
    int updateClient(Client client);
    int deleteClient(int clientId);

    // 입고처 관리 페이징 바
    int deliveryCount();
    ArrayList<Client> selectdeliveryListByPage(RowBounds rowBounds);

    List<Product> top4product(int storeId);
    List<Product> top4productAdmin();
}
