package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;

import java.util.ArrayList;

public interface BoardService {
    ArrayList<Board> selectBoardList();
}
