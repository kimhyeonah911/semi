package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Storage {
    private int storageNo;
    private String storageLocation;
    private int ableAmount;
    private int currentAmount;
    private int storeId;
}
