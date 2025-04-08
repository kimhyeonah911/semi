package com.kh.semi.service;

import com.kh.semi.domain.vo.Store;
import com.kh.semi.mappers.StoreMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@RequiredArgsConstructor
@Service
public class StoreServiceImpl implements StoreService {
    private final StoreMapper storeMapper;


    @Override
    public int insertCompany(Store storename) {
        return storeMapper.insertCompany(storename);
    }

    @Override
    public ArrayList<Store> getStores() {
        return storeMapper.getStores();
    }
}
