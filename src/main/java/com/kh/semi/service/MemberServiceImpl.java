package com.kh.semi.service;

import com.kh.semi.domain.vo.Member;
import com.kh.semi.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public Member loginMember(String memId, String memPwd) {
        System.out.println(memId);
        System.out.println(memPwd);
        return memberMapper.loginMember(memId, memPwd);
    }

}
