package com.kh.semi.service;

import com.kh.semi.domain.vo.PageInfo;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.domain.vo.StockProduct;
import com.kh.semi.mappers.StockMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class StockServiceImpl implements StockService {
    private final StockMapper stockMapper;

    @Override
    public int insertStockIn(Stock stock) {
        return stockMapper.insertStockIn(stock);
    }

    @Override
    public int insertStockOut(Stock stock) {
        return stockMapper.insertStockOut(stock);
    }

    @Override
    public int insertStockProduct(StockProduct stockProduct) {
        return stockMapper.insertStockProduct(stockProduct);
    }

    @Override
    public ArrayList<StockProduct> selectStockProductList(int empNo) {
        return stockMapper.selectStockProductList(empNo);
    }

    @Override
    public int updateStockInStatus(int stockNo) {
        return stockMapper.updateStockInStatus(stockNo);
    }

    @Override
    public int updateStockOutStatus(int stockNo) {
        return stockMapper.updateStockOutStatus(stockNo);
    }

    @Override
    public int deleteStock(int stockNo) {
        return stockMapper.deleteStock(stockNo);
    }

    public int deleteStockProduct(int stockNo){
        return stockMapper.deleteStockProduct(stockNo);
    }

    @Override
    public Stock selectStock(int stockNo) {
        return stockMapper.selectStock(stockNo);
    }

    @Override
    public ArrayList<StockProduct> selectStockProduct(int stockNo) {
        return stockMapper.selectStockProduct(stockNo);
    }

    @Override
    public int updateCompletedStockIn() {
        return stockMapper.updateCompletedStockIn();
    }

    @Override
    public ArrayList<Stock> selectCompletedStockIn() {
        return stockMapper.selectCompletedStockIn();
    }

    @Override
    public int updateStockProcessedStatus(int stockNo) {
        return stockMapper.updateStockProcessedStatus(stockNo);
    }

    // 입고 페이지 페이징 처리(였던것)
//    @Override
//    public int selectStockListforPaging(int empNo, String status) {
//        return stockMapper.selectStockListforPaging(empNo, status);
//    }
//
//    @Override
//    public ArrayList<Stock> selectStockListByPage(PageInfo pi, int empNo, String status) {
//        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//        return stockMapper.selectStockListByPage(empNo, status , rowBounds);
//    }


    public int updateCompletedStockOut() {
        return stockMapper.updateCompletedStockOut();
    }

    @Override
    public ArrayList<Stock> selectCompletedStockOut() {
        return stockMapper.selectCompletedStockOut();
    }

    @Override
    public int selectStockOutListforPaging(int empNo, String status) {
        return stockMapper.selectStockOutListforPaging(empNo, status);
    }

    @Override
    public ArrayList<Stock> selectStockOutListByPage(PageInfo pi, int empNo, String status) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return stockMapper.selectStockOutListByPage(empNo, status, rowBounds);


    }
    @Override
    public int countStockIn(int empNo) {
        return stockMapper.countStockIn(empNo);
    }

    @Override
    public int countStockOut(int empNo) {
        return stockMapper.countStockOut(empNo);
    }

    @Override
    public int selectStockInListforPaging(int empNo, String status, String startDate, String endDate) {
        return stockMapper.selectStockInListforPaging(empNo, status, startDate, endDate);
    }

    @Override
    public ArrayList<Stock> selectStockInListByPage(PageInfo pi, int empNo, String status, String startDate, String endDate) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return stockMapper.selectStockInListByPage(empNo, status, startDate, endDate , rowBounds);
    }

    @Override
    public int selectStockOutListforPaging(int empNo, String status, String startDate, String endDate) {
        return stockMapper.selectStockOutListforPaging(empNo, status, startDate, endDate);
    }

    @Override
    public ArrayList<Stock> selectStockOutListByPage(PageInfo pi, int empNo, String status, String startDate, String endDate) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return stockMapper.selectStockOutListByPage(empNo, status, startDate, endDate , rowBounds);
    }
}
