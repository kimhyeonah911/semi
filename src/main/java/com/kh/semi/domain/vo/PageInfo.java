package com.kh.semi.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageInfo {
    private int listCount;
    private int currentPage;
    private int pageLimit;
    private int boardLimit;
    private int maxPage;
    private int startPage;
    private int endPage;
    private int offset;
    private int startRow;
    private int endRow;

    public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;

        this.maxPage = (int) Math.ceil((double) listCount / boardLimit);
        this.startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        this.endPage = Math.min(startPage + pageLimit - 1, maxPage);
        this.offset = (currentPage - 1) * boardLimit;

        this.startRow = (currentPage - 1) * boardLimit + 1;
        this.endRow = startRow + boardLimit - 1;
    }
}


