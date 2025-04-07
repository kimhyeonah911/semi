package com.kh.semi.service;

import com.kh.semi.domain.vo.Attendance;
import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.mappers.BoardMapper;
import com.kh.semi.mappers.MemberMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;


    @Override
    public Member loginMember(String memId, String memPwd) {
        return memberMapper.loginMember(memId, memPwd);
    }

    @Override
    public int insertMember(Member member) {
        return memberMapper.insertMember(member);
    }

    @Override
    public int checkId(String checkId) {
        return memberMapper.checkId(checkId);
    }

    @Override
    public ArrayList<Member> selectMemberList() {
        return memberMapper.selectMemberList();
    }

    @Override
    public ArrayList<Member> acceptMemberList() {
        return memberMapper.acceptMemberList();
    }

    @Override
    public int approveMember(String memId, String storeSelect) {
        return memberMapper.approveMember(memId,storeSelect);
    }

    @Override
    public int rejectMember(String memId) {
        return memberMapper.rejectMember(memId);
    }

    @Override
    public ArrayList<Member> acceptManagerList() {
        return memberMapper.acceptManagerList();
    }

    @Transactional
    @Override
    public int approveManager(String storeId, String memId) {
        int storeresult = memberMapper.approveManagerStore(storeId);
        int positionresult = memberMapper.approveManagerPosition(memId);

        if(storeresult>0 && positionresult>0){
            System.out.println("지점 상태 및 직원 직급 변경 성공");
        }else{
            System.out.println("지점 상태 및 직원 직급 변경 실패");
        }
        return storeresult + positionresult;
    }

    @Override
    public ArrayList<String> getStoreList() {
        return memberMapper.getStoreList();
    }


    @Override
    public List<Member> getEmployeesByStore(String store) {
        return memberMapper.getEmployeesByStore(store);
    }

    @Override
    public int rejectManager(String storeId) {
        return memberMapper.rejectManager(storeId);
    }

    @Override
    public int countAllMembers() {
        return memberMapper.countAllMembers();
    }

    @Override
    public ArrayList<Member> selectMemberListByPage(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return memberMapper.selectMemberListByPage(rowBounds);
    }


    @Override
    public int updatePhone(String phone, String memId) {
        return memberMapper.updatePhone(phone,memId);
    }

    @Override
    public int updatePwd(String newPwd, String memPwd, String memId) {
        return memberMapper.updatePwd(newPwd, memPwd, memId);
    }

    @Override
    public int countMembersByStore(String storeName) {
        return memberMapper.countMembersByStore(storeName);
    }

    @Override
    public ArrayList<Member> selectMemberListByStore(PageInfo pi, String storeName) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return memberMapper.selectMemberListByStore(storeName, rowBounds);
    }




}