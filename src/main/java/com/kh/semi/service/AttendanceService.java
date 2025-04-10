package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;

import com.kh.semi.domain.vo.PageInfo;

import java.util.ArrayList;

import java.util.Map;

public interface AttendanceService {
    ArrayList<Attendance> getAttendanceList();

    ArrayList<Attendance> getAttendanceMy(int empNo);

    ArrayList<Attendance> getMyAttendanceList(int storeId);

    int updateAttendance(Attendance attendance);

    ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap);

    int insertClockIn(Attendance attendance);
    int updateClockOut(Attendance attendance);
    boolean isClockedIn(int empNo);

    int getTotalAttendanceCount(int empNo);

    ArrayList<Attendance> selectAttendancListByPage(int empNo, PageInfo pi);

    int getAttendanceCount(Map<String, Object> paramMap);
    ArrayList<Attendance> selectAttendanceListPage(Map<String, Object> paramMap);

    int countWorkingEmployees(int storeId);
    int countNotWorkingEmployees(int storeId);

    int countWork(int storeId);
    int countEmp(int storeId);


}