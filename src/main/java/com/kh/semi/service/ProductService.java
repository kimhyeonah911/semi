package com.kh.semi.service;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface ProductService {
    ArrayList<Product> selectProductList();
    ArrayList<Category> getCategoryList();

    ArrayList<Client> selectClientList();
    int insertClient(Client client);
    int updateClient(Client client);
    int deleteClient(int clientId);

}
