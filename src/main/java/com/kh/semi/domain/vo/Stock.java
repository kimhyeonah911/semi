package com.kh.semi.domain.vo;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Stock {
    private int stockNo;
    private String stockEmp;
    private String stockDate;
    private String expDate;
    private String stockStatus;
}
