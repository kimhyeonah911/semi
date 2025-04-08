package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Attendance;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface AttendanceService {
    ArrayList<Attendance> getAttendanceList();

    ArrayList<Attendance> getAttendanceMy(int empNo);

    ArrayList<Attendance> getMyAttendanceList(String storeId);

    int updateAttendance(Attendance attendance);

    ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap);

    int insertClockIn(Attendance attendance);
    int updateClockOut(Attendance attendance);
    boolean isClockedIn(int empNo);
}