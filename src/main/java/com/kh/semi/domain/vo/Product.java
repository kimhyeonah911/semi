package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
    private int productNo;
    private int clientId;
    private int categoryNo;
    private String productName;
    private String color;
    private int productSize;
    private Date registrationDate;
    private int stockInPrice;
    private int stockOutPrice;
    private String imageUrl;
    private String status;

    private String categoryName;
    private int totalAmount;
}