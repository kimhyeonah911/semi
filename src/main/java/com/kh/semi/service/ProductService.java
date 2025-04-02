package com.kh.semi.service;

import com.kh.semi.domain.vo.Product;

import java.util.ArrayList;

public interface ProductService {
    ArrayList<Product> selectProductList();
}
