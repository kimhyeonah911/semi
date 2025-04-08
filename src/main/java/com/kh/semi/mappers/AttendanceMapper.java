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
    ArrayList<Attendance> getMyAttendanceList(@Param("storeId") String storeId);
    int updateAttendance(Attendance attendance);
    ArrayList<Attendance> selectAttendance(Map<String, Object> paramMap);
    int insertClockIn(Attendance attendance);
    int updateClockOut(Attendance attendance);
    boolean isClockedIn(int empNo);

    // 근태관리 페이징 바
    int getTotalAttendanceCount(int empNo);
    ArrayList<Attendance> selectAttendancListByPage(Map<String, Object> paramMap, RowBounds rowBounds);

    int getAttendanceCount(String storeId);

    ArrayList<Attendance> selectAttendanceListPage(String storeId, RowBounds rowBounds);

}
