package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;

public interface MemberService {
    //로그인
    Member loginMember(String memId, String memPwd);
}