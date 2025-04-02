package com.kh.semi.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
    private int empNo;
    private String storeId;
    private String memId;
    private String memPwd;
    private String memName;
    private String phone;
    private String position;
    private String status;
    private Date createDate;
    private Date modifyDate;
    private Date hireDate;
    private int salary;
    private String storeName;
}
