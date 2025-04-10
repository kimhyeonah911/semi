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
    private int storeId;
    private String storageLocation;
    private int ableAmount;
    private int currentAmount;
}
