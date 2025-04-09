package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class StoreSales {
    private int storesalesNo;
    private int storeId;
    private int daySales;
    private Date salesDate;
    private int monthSales;
    private Date salesMonth;
}
