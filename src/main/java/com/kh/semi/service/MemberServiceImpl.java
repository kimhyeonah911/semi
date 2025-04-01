package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.mappers.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public Member loginMember(String memId, String memPwd) {
        return memberMapper.loginMember(memId, memPwd);
    }

}
