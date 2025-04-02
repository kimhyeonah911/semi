package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
    Member loginMember(String memId, String memPwd);
    int insertMember(Member member);
}
