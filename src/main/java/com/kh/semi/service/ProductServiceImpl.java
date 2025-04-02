package com.kh.semi.service;

import com.kh.semi.domain.vo.Product;
import com.kh.semi.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;

    @Override
    public ArrayList<Product> selectProductList() {
        return productMapper.selectProductList();
    }
}
