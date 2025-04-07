package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface AttendanceMapper {

    ArrayList<Attendance> getAttendanceList();
    ArrayList<Attendance> getAttendanceMy(@Param("empNo")int empNo);
    ArrayList<Attendance> getMyAttendanceList(@Param("storeId") String storeId);
    int updateAttendance(Attendance attendance);
    ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap);
    int insertClockIn(Attendance attendance);
    int updateClockOut(Attendance attendance);
    boolean isClockedIn(int empNo);
}
