package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.mappers.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public ArrayList<Board> selectBoardList() {
//        ArrayList<Board> boardList = boardMapper.selectBoardList();
//        System.out.println("서비스에서 가져온 공지사항 리스트: " + boardList);
        return boardMapper.selectBoardList();
    }

    @Override
    public int insertBoard(Board board) {
        return boardMapper.insertBoard(board);
    }

    @Override
    public int deleteBoard(int boardNo) {
        return boardMapper.deleteBoard(boardNo);
    }

    @Override
    public int noticeUpdate(Board board) {
        return boardMapper.noticeUpdate(board);
    }
}
