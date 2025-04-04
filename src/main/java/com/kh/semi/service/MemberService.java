package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
    //로그인
    Member loginMember(String memId, String memPwd);
    int insertMember(Member member);
    int checkId(String checkId);

    ArrayList<Member> selectMemberList();


    ArrayList<Member> acceptMemberList();

    int approveMember(@RequestParam String memId, @RequestParam String storeSelect);

    int rejectMember(@RequestParam String memId);


    ArrayList<String> getStoreList();

    List<Member> getEmployeesByStore(String store);

    ArrayList<Member> acceptManagerList();

    int approveManager(@RequestParam String storeId, @RequestParam String memId);

    int rejectManager(@RequestParam String storeId);

}