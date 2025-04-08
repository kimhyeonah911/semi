package com.kh.semi.service;

import com.kh.semi.domain.vo.Storage;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.mappers.ProductMapper;
import com.kh.semi.mappers.StorageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class StorageServiceImpl implements StorageService {

    private final StorageMapper storageMapper;

    @Override
    public ArrayList<Storage> selectStorage() {
        return storageMapper.selectStorage();
    }

    @Override
    public int insertStorage(Storage storage) {
        return storageMapper.insertStorage(storage);
    }

    @Override
    public int deleteStorage(int storageNo) {
        return storageMapper.deleteStorage(storageNo);
    }

    @Override
    public ArrayList<Storage> getStorageList() { return storageMapper.getStorageList(); }

    @Override
    public int updateStorageAmount(int storageNo, int amount) {
        return storageMapper.updateStorageAmount(storageNo, amount);
    }
}
