package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;

import java.util.ArrayList;

public interface BoardService {
    ArrayList<Board> selectBoardList();

    int insertBoard(Board board);

    int deleteBoard(int boardNo);

    int noticeUpdate(Board board);

    int countAllBoard();

    ArrayList<Member> selectBoardListByPage(PageInfo pi);
}
