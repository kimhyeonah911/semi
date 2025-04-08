package com.kh.semi.service;


import com.kh.semi.domain.vo.Store;

import java.util.ArrayList;

public interface StoreService {
    int insertCompany(Store store);
    ArrayList<Store> getStores();
}
