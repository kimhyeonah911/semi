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
}

