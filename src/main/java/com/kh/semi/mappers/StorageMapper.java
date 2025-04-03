package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Storage;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface StorageMapper {

    ArrayList<Storage> selectStorage();
    int insertStorage(Storage storage);
    int deleteStorage(int storageNo);
}
