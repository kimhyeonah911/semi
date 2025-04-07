package com.kh.semi.mappers;

import org.apache.catalina.Store;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface StoreMapper {

   int insertCompany(com.kh.semi.domain.vo.Store storename);
}
