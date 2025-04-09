package com.kh.semi.service;

import com.kh.semi.domain.vo.*;
import com.kh.semi.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;

    @Override
    public List<Product> getProductLIst() {
        return productMapper.getProductLIst();
    }

    @Override
    public List<Product> selectProductList(int clientId) {
        return productMapper.selectProductList(clientId);
    }

    @Override
    public List<Product> searchProductName(String productName) {
        return productMapper.searchProductName(productName);
    }

    @Override
    public ArrayList<Product> selectImageUrl() {
        return productMapper.selectImageUrl();
    }

    @Override
    public ArrayList<Category> getCategoryList() {
        return productMapper.getCategoryList();
    }

    @Override
    public ArrayList<Client> getClientList() {
        return productMapper.getClientList();
    }

    @Override
    public int updateProductPause(List<Integer> productNoList) {
        return productMapper.updateProductPause(productNoList);
    }

    @Override
    public int updateProductDelete(List<Integer> productNoList) {
        return productMapper.updateProductDelete(productNoList);
    }

    @Override
    public int updateProductRestart(List<Integer> productNoList) {
        return productMapper.updateProductRestart(productNoList);
    }

    @Override
    public int enrollProduct(Product p) {
        return productMapper.enrollProduct(p);
    }

    @Override
    public int updateProduct(Product p) {
        return productMapper.updateProduct(p);
    }

    @Override
    public List<Product> searchProduct(Map<String, Object> paramMap) {
        return productMapper.searchProduct(paramMap);
    }

    @Override
    public int countProduct(Map<String, Object> paramMap) {
        return productMapper.countProduct(paramMap);
    }

    @Override
    public ArrayList<Client> selectClientList() {
        return productMapper.selectClientList();
    }

    @Override
    public int insertClient(Client client) {
        return productMapper.insertClient(client);
    }

    @Override
    public int updateClient(Client client) {
        return productMapper.updateClient(client);
    }

    @Override
    public int deleteClient(int clientId) {
        return productMapper.deleteClient(clientId);
    }

//    @Override
//    public int countAllProducts() {
//        return productMapper.countAllProducts();
//    }


    @Override
    public int deliveryCount() {
        return productMapper.deliveryCount();
    }

    @Override
    public ArrayList<Client> selectdeliveryListByPage(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productMapper.selectdeliveryListByPage(rowBounds);
    }

    @Override
    public List<Product> top4product(int storeId) {return productMapper.top4product(storeId);}

    @Override
    public List<Product> top4productAdmin() {return productMapper.top4productAdmin();}
}
