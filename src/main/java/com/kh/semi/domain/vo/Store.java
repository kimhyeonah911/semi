package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Store {
    private int storeId;
    private String storeName;
    private String phone;
    private String address;
    private Date createDate;
    private String status;
}
