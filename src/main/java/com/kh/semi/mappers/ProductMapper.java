package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> getProductLIst();
    List<Product> selectProductList(int clientId);
    List<Product> searchProductName(String productName);

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
}
