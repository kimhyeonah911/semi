package com.kh.semi.service;

import com.kh.semi.domain.vo.Store;
import com.kh.semi.mappers.StoreMapper;
import com.kh.semi.mappers.StoresalesMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@RequiredArgsConstructor
@Service
public class StoresalesServiceImpl implements StoresalesService {
    private final StoresalesMapper storesalesMapper;



}
