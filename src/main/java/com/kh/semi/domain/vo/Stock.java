package com.kh.semi.domain.vo;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Stock {
    private int stockNo;
    private int stockEmp;
    private String stockDate;
    private String expDate;
    private String stockStatus;
    private String memName;

    //상품재고(stock-product)
    private String storageLocation;
    private int productNo;
    private String productName;
    private String categoryName;
    private String color;
    private int productSize;
    private int amount;
    private int price;
    private int storageNo;
    private int storeId;
}
