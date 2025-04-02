package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;

import java.util.ArrayList;

public interface MemberService {
    //로그인
    Member loginMember(String memId, String memPwd);

    ArrayList<Member> selectMemberList();
}