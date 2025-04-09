package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface AttendanceMapper {

    ArrayList<Attendance> getAttendanceList();
    ArrayList<Attendance> getAttendanceMy(@Param("empNo")int empNo);
    ArrayList<Attendance> getMyAttendanceList(@Param("storeId") int storeId);
    int updateAttendance(Attendance attendance);
    ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap);
    int insertClockIn(Attendance attendance);
    int updateClockOut(Attendance attendance);
    boolean isClockedIn(int empNo);


    // 근태관리 페이징 바
    int getTotalAttendanceCount(int empNo);
    ArrayList<Attendance> selectAttendancListByPage(Map<String, Object> paramMap, RowBounds rowBounds);
    int getAttendanceCount(Map<String, Object> paramMap);
    ArrayList<Attendance> selectAttendanceListPage(Map<String, Object> paramMap, RowBounds rowBounds);

    // 직원 대시보드 출근 현황판
    int countByStatus(@Param("storeId") String storeId, @Param("status") String status);


    int countWork(int storeId);
    int countEmp(int storeId);
}
