package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ProductMapper {
    ArrayList<Product> selectProductList();
}
