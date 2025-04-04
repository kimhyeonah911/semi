package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Attendance;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.List;

public interface AttendanceService {
    ArrayList<Attendance> getAttendanceList();

    ArrayList<Attendance> getAttendanceMy(int empNo);

    ArrayList<Attendance> getMyAttendanceList(String storeId);

}