package com.kh.semi.controller;

import com.kh.semi.domain.vo.Board;
import com.kh.semi.domain.vo.Member;
import com.kh.semi.domain.vo.Product;
import com.kh.semi.service.BoardService;
import com.kh.semi.service.MemberService;
import com.kh.semi.service.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.List;


@RequiredArgsConstructor
@Controller
public class AdminController {
    private final MemberService memberService;
    private final ProductService productService;
    private final BoardService boardService;

    @GetMapping("accept.ma")
    public String acceptManager() {
        return "admin/managerManagement";
    }

    @GetMapping("accept.me")
    public String acceptMember(Model model) {
        ArrayList<Member> list = memberService.acceptMemberList();
        model.addAttribute("acceptMember", list);
        System.out.println("직원 승인 : " + list);
        return "admin/memberManagement";
    }


    @GetMapping("list.bo")
    public String selectBoardList(Model model) {
        ArrayList<Board> boardlist = boardService.selectBoardList();
        model.addAttribute("board", boardlist);
        System.out.println("공지사항 정보 : " + boardlist);
        return "admin/boardListView";
    }

    @PostMapping("insertlist.bo")
    public String boardList(Board board, HttpSession session, Model model) {
        board.setEmpNo(1);
        System.out.println("게시글 정보 : " + board);

        int result = boardService.insertBoard(board);
        if(result > 0){
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:/list.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 작성 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("delete.bo")
    public String deleteBoard(int boardNo, Model model, HttpSession session) {
        int result = boardService.deleteBoard(boardNo);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글을 삭제하였습니다.");
            return "redirect:/list.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 삭제 실패");
            return "redirect:/list.bo";
        }
    }

    @GetMapping("enroll.bo")
    public String enrollForm() {
        return "admin/boardEnrollForm-admin";
    }

    @GetMapping("update.bo")
    public String updateForm() {
        return "admin/boardUpdate-admin";
    }

    @PostMapping("noticeupdate.bo")
    public String noticeUpdate(@RequestParam("boardNo") int boardNo, Board board,  HttpSession session) {
        int result = boardService.noticeUpdate(board);

        if(result > 0){
            session.setAttribute("alertMsg", "게시글 수정 성공");
        } else {
            session.setAttribute("alertMsg", "게시글 수정 실패 관리자에게 문의");
        }
        return "redirect:/list.bo";
    }

    @GetMapping("dash.bo")
    public String dashBoard() {
        return "admin/dashBoard-admin";
    }

    @GetMapping("sales.bo")
    public String saleBoard() {
        return "admin/salesBoard";
    }

    @GetMapping("product.bo")
    public String productManagement(Model model) {
        ArrayList<Product> list = productService.selectProductList();
        System.out.println("제품 리스트: " + list);
        model.addAttribute("product", list);
        return "admin/productManagement";
    }

    @GetMapping("delivery.ma")
    public String deliveryManagement() {return "admin/deliveryManagement";
    }

    @GetMapping("employee.in")
    public String employeeInfoView(Model model) {
        ArrayList<Member> list = memberService.selectMemberList();
        model.addAttribute("member", list);
        System.out.println(list);

        // DB에서 중복 없는 지점 목록 가져오기
        ArrayList<String> storeList = memberService.getStoreList();
        model.addAttribute("storeList", storeList);
        return "admin/employeeInfoView";
    }

    @GetMapping("employeeList")
    @ResponseBody // JSON 형태로 반환
    public List<Member> getFilteredEmployees(@RequestParam(value = "store", required = false) String store) {
        System.out.println("선택된 지점: " + store); // 디버깅용 출력

        List<Member> filteredList;
        if (store == null || store.equals("전체")) {
            filteredList = memberService.selectMemberList(); // 전체 직원 조회
        } else {
            filteredList = memberService.getEmployeesByStore(store); // 특정 지점 직원 조회
        }

        System.out.println("조회된 직원 목록: " + filteredList); // 디버깅용 출력
        return filteredList;
    }


    @GetMapping("adminmypage.bo")
    public String adminPage() {return "admin/adminMypage";}



    @PostMapping("/approveMember")
    public String approveMember(@RequestParam String memId, @RequestParam String storeSelect, HttpSession session, Model model) {
        System.out.println(storeSelect);
        int result = memberService.approveMember(memId,storeSelect);
        if(result > 0){
            session.setAttribute("alertMsg","직원 승인 완료");
            return "admin/memberManagement";
        } else{
            model.addAttribute("errorMsg", "직원 승인 실패");
            return "common/errorPage";
        }
    }

    @PostMapping("/rejectMember")
    public String rejectMember(@RequestParam String memId,HttpSession session, Model model) {
        System.out.println(memId);
        int result = memberService.rejectMember(memId);
        if(result > 0){
            session.setAttribute("alertMsg","직원 승인거부 완료");
            return "admin/memberManagement";
        } else{
            model.addAttribute("errorMsg", "직원 승인거부 실패");
            return "common/errorPage";
        }
    }

}
