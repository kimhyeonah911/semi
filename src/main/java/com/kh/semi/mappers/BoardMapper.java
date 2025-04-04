package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {

    ArrayList<Board> selectBoardList();

    int insertBoard(Board board);

    int deleteBoard(int boardNo);

    int noticeUpdate(Board board);

    int countAllBoard();

    ArrayList<Member> selectBoardListByPage(RowBounds rowBounds);
}
