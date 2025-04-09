package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.mappers.AttendanceMapper;
import com.kh.semi.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
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
    public ArrayList<Attendance> getMyAttendanceList(int storeId) {
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

    @Override
    public int getTotalAttendanceCount(int empNo) {
        return attendanceMapper.getTotalAttendanceCount(empNo);
    }

    @Override
    public ArrayList<Attendance> selectAttendancListByPage(int empNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("empNo", empNo);

        return attendanceMapper.selectAttendancListByPage(paramMap, rowBounds);
    }

    @Override
    public int getAttendanceCount(Map<String, Object> paramMap) {
        return attendanceMapper.getAttendanceCount(paramMap);
    }

    @Override
    public ArrayList<Attendance> selectAttendanceListPage(Map<String, Object> paramMap) {
        PageInfo pi = (PageInfo) paramMap.get("pi");
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return attendanceMapper.selectAttendanceListPage(paramMap, rowBounds);
    }

    @Override
    public int countWorkingEmployees(String storeId) {
        return attendanceMapper.countByStatus(storeId, "W");
    }

    @Override
    public int countNotWorkingEmployees(String storeId) {
        return attendanceMapper.countByStatus(storeId, "L");
    }

    public int countWork(int storeId) {return attendanceMapper.countWork(storeId);}

    @Override
    public int countEmp(int storeId) {return attendanceMapper.countEmp(storeId);}

}

