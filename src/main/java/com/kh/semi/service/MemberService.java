package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

public interface MemberService {
    //로그인
    Member loginMember(String memId, String memPwd);

    ArrayList<Member> selectMemberList();


    ArrayList<Member> acceptMemberList();

    int approveMember(@RequestParam String memId, @RequestParam String storeSelect);

    int rejectMember(@RequestParam String memId);

}