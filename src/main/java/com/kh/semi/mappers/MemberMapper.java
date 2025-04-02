package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {

    Member loginMember(String memId, String memPwd);

    ArrayList<Member> acceptMember();
}
