package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.security.core.parameters.P;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface MemberMapper {
    Member loginMember(String memId, String memPwd);
    int insertMember(Member member);
    int checkId(@Param("memId") String checkId);

    ArrayList<Member> selectMemberList();
    ArrayList<Member> acceptMemberList();
    int approveMember(@Param("memId") String memId, @Param("storeSelect") String storeSelect);
    int rejectMember(@Param("memId") String memId);


    ArrayList<String> getStoreList();

    List<Member> getEmployeesByStore(String store);

    ArrayList<Member> acceptManagerList();
    int approveManagerStore(@Param("storeId") String storeId);
    int approveManagerPosition(@Param("memId") String memId);
    int rejectManager(@Param("storeId") String storeId);

    // 직원정보 페이징 바
    int countAllMembers();
    ArrayList<Member> selectMemberListByPage(RowBounds rowBounds);

    int updatePhone(@Param("phone") String phone, @Param("memId") String memId);
    int updatePwd(@Param("newPwd") String newPwd, @Param("memPwd") String memPwd, @Param("memId") String memId);

    int countMembersByStore(String storeName);

    ArrayList<Member> selectMemberListByStore(String storeName, RowBounds rowBounds);
}
