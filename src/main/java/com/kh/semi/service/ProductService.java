package com.kh.semi.service;

import com.kh.semi.domain.vo.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public interface ProductService {
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
    int deliveryCount();
    ArrayList<Client> selectdeliveryListByPage(PageInfo pi);
    List<Product> top4product(int storeId);
    List<Product> top4productAdmin();
    List<Product> getProductSales(int storeId);

}

