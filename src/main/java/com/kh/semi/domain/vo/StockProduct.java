package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class StockProduct {
    private int stockNo;
    private int productNo;
    private int storageNo;
    private int amount;
    private int price;
    private int taxPrice;
    private String tax;

    private String stockStatus;
    private String productName;
    private String color;
    private int productSize;
    private Date stockDate;
}
