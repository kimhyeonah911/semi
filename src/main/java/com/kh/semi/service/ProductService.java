package com.kh.semi.service;

import com.kh.semi.domain.vo.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public interface ProductService {
    List<Product> getProductLIst();
    ArrayList<Category> getCategoryList();
    ArrayList<Client> getClientList();
    int updateProductPause(List<Integer> productNoList);
    int updateProductDelete(List<Integer> productNoList);
    int updateProductRestart(List<Integer> productNoList);
    int enrollProduct(Product p);
    int updateProduct(Product p);
    List<Product> searchProduct(String status, Integer categoryNo, String keyword);

    ArrayList<Client> selectClientList();
    int insertClient(Client client);
    int updateClient(Client client);
    int deleteClient(int clientId);

//    int countAllProducts();
//
//    ArrayList<Product> selectProductListByPage(PageInfo pi);

    int deliveryCount();

    ArrayList<Client> selectdeliveryListByPage(PageInfo pi);
}

