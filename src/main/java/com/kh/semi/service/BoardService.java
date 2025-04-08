package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;

import java.util.ArrayList;

public interface BoardService {


    int insertBoard(Board board);

    int deleteBoard(int boardNo);

    int noticeUpdate(Board board);

    int countAllBoard();

    ArrayList<Board> selectBoardList();

    ArrayList<Board> selectBoardListByPage(PageInfo pi);

    ArrayList<Board> selectBoardListTop3();
}
