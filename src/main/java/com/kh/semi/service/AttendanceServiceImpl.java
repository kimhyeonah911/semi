package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.mappers.AttendanceMapper;
import com.kh.semi.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class AttendanceServiceImpl implements AttendanceService {

    private final AttendanceMapper attendanceMapper;

    @Override
    public ArrayList<Attendance> getAttendanceList() {
        return attendanceMapper.getAttendanceList();
    }

    @Override
    public ArrayList<Attendance> getAttendanceMy(int empNo) {
        System.out.println(">>> empNo: " + empNo);
        return attendanceMapper.getAttendanceMy(empNo);
    }

    @Override
    public ArrayList<Attendance> getMyAttendanceList(String storeId) {
        return attendanceMapper.getMyAttendanceList(storeId);
    }

    @Override
    public int updateAttendance(Attendance attendance) {
        return attendanceMapper.updateAttendance(attendance);
    }

    @Override
    public ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap) {
        return attendanceMapper.selectAttendance(paramMap);
    }

    @Override
    public int insertClockIn(Attendance attendance) {
        return attendanceMapper.insertClockIn(attendance);
    }

    @Override
    public int updateClockOut(Attendance attendance) {
        return attendanceMapper.updateClockOut(attendance);
    }

    @Override
    public boolean isClockedIn(int empNo) {
        return attendanceMapper.isClockedIn(empNo);
    }


}

