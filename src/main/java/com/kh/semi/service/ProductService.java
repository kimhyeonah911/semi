package com.kh.semi.service;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface ProductService {
    ArrayList<Product> selectProductList();
    ArrayList<Category> getCategoryList();
}
