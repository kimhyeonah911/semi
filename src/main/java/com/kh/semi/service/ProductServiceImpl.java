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
    public ArrayList<Product> selectProductList() {
        return productMapper.selectProductList();
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
    public int enrollProduct(Product p) {
        return productMapper.enrollProduct(p);
    }

    @Override
    public int updateProduct(Product p) {
        return productMapper.updateProduct(p);
    }
}
