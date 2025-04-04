package com.kh.semi.service;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.mappers.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public ArrayList<Board> selectBoardList() {
        ArrayList<Board> boardList = boardMapper.selectBoardList();

//        // 공지사항 리스트 출력
//        System.out.println("📌 서비스에서 가져온 공지사항 리스트: " + boardList);
//        // boardContent 값 개별 출력
//        for (Board board : boardList) {
//            System.out.println("📌 공지사항 내용: " + board.getBoardContent());
//        }
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

    @Override
    public int countAllBoard() {
        return boardMapper.countAllBoard();
    }

    @Override
    public ArrayList<Board> selectBoardListByPage(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return boardMapper.selectBoardListByPage(rowBounds);
    }

    @Override
    public ArrayList<Board> selectBoardListTop3() {
        return boardMapper.selectBoardListTop3();
    }
}
