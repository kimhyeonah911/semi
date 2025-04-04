package com.kh.semi.mappers;

import com.kh.semi.domain.vo.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {

    ArrayList<Board> selectBoardList();

    int insertBoard(Board board);

    int deleteBoard(int boardNo);

    int noticeUpdate(Board board);
}
