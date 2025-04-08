package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Storage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface StorageMapper {

    ArrayList<Storage> selectStorage();
    int insertStorage(Storage storage);
    int deleteStorage(int storageNo);


    int storageCount();
    ArrayList<Storage> selectStorageCount(RowBounds rowBounds);
    ArrayList<Storage> getStorageList();
<<<<<<< HEAD
    int updateStorageAmount(int storageNo, int amount);
=======

>>>>>>> a8afa2b4c9da8781ab798819110fb891c4a6aaf3
}
