package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Member;

import com.kh.semi.domain.vo.PageInfo;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
    //로그인
    Member loginMember(String memId, String memPwd);
    int insertMember(Member member);
    int checkId(String checkId);

    ArrayList<Member> selectMemberList();

    int countEmployee();

    ArrayList<Member> acceptMemberList();

    int approveMember(@RequestParam String memId, @RequestParam String storeSelect);

    int rejectMember(@RequestParam String memId);

    ArrayList<Member> acceptManagerList();

    int approveManager(@RequestParam String storeId, @RequestParam String memId);

    ArrayList<String> getStoreList();

    List<Member> getEmployeesByStore(String store);

    int rejectManager(@RequestParam String storeId);


    int countAllMembers();

    ArrayList<Member> selectMemberListByPage(PageInfo pi);

    int updatePhone(String phone, String memId);

    int updatePwd(String encryptedPwd, String memId);


    int countMembersByStore(String storeName);

    ArrayList<Member> selectMemberListByStore(PageInfo pi, String storeName);

    Member selectMemberbyId(String memId);
}