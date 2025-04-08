package com.kh.semi.service;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
    public List<Product> searchProduct(String status, Integer categoryNo, String keyword) {
        return productMapper.searchProduct(status, categoryNo, keyword);
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
}
