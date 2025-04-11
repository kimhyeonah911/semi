package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Inventory {
    private int storageNo;
    private int productNo;
    private int quantity;
    private Date stockInDate;
    private Date stockOutDate;

    private String storageLocation;
    private String productName;
    private String categoryName;
    private String color;
    private int productSize;
    private int storeId;
}
