package com.kh.semi.service;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
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

    @Override
    public ArrayList<Category> getCategoryList() {
        return productMapper.getCategoryList();
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
