package com.kh.semi.domain.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Attendance {
    private int attendanceNo;
    private int empNo;
    private Date workDay;
    private Date clockIn;
    private Date clockOut;
    private String status;
    private String workTime;
    private String empName;
}
