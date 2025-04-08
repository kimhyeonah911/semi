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

=======
>>>>>>> 16aef471423d16bb9c6f1f28c33407c8fc06a628
    int updateStorageAmount(int storageNo, int amount);
}
