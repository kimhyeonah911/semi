package com.kh.semi.domain.vo;

import lombok.*;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Attendance {
    private int attendanceNo;
    private int empNo;
    private Date workDay;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date clockIn;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date clockOut;
    private String status;
    private String workTime;
    private String empName;
}
