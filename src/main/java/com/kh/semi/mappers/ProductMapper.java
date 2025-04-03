package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ProductMapper {
    ArrayList<Product> selectProductList();
    ArrayList<Category> getCategoryList();

    ArrayList<Client> selectClientList();
    int insertClient(Client client);
    int updateClient(Client client);
    int deleteClient(int clientId);
}
