package com.kh.semi.service;

import com.kh.semi.domain.vo.Storage;

import java.util.ArrayList;

public interface StorageService {
    ArrayList<Storage> selectStorage();
    int insertStorage(Storage storage);
    int deleteStorage(int storageNo);
    ArrayList<Storage> getStorageList();

}
