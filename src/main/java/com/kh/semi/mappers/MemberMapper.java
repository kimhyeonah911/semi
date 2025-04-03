package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {
    Member loginMember(String memId, String memPwd);
    int insertMember(Member member);
    int checkId(@Param("memId") String checkId);

    ArrayList<Member> selectMemberList();
    ArrayList<Member> acceptMemberList();
    int approveMember(@Param("memId") String memId, @Param("storeSelect") String storeSelect);
    int rejectMember(@Param("memId") String memId);

}
