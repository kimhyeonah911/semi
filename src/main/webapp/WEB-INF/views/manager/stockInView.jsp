<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String position = (String)session.getAttribute("position");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <title>Title</title>
    <style>

        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
        }

        .stockIn-management{
            width: 100%;
            height: 100%;
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }

        .table1, .table2{
            width: 49%;
            max-height: 700px;
            overflow-y: auto;
        }

        select{
            border-radius: 8px;
        }

        #search-bar{
            display: flex;
            justify-content: space-between;
        }

        #search-bar-1{
            width: 440px;
            display:flex;
            align-items: center;
            justify-content: space-between;
        }

        #date1, #date2 {
            width: 130px;
            height: 30px;
            font-size: 13px;
            padding: 8px;
            border-radius: 5px;
            appearance: none;
        }

        #date1::-webkit-calendar-picker-indicator,
        #date2::-webkit-calendar-picker-indicator {
            height: 20px;
            width: 20px;
        }


        #stockIn-search-bar{
            width: 80px;
            height: 30px;
            font-size: 14px;
        }

        .search-btn{
            width: 60px;
            height: 30px;
            font-size: 18px;
            border-radius: 8px;
            background: white;
        }

        .storage-btn {
            margin-left: auto;
            background-color: #343a40;
            color: white;
            border: none;
            padding: 5px 10px 4px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
        }

        .storage-btn:hover{
            background-color: rgba(52, 58, 64, 0.95);
        }

        tr th,td{
            text-align: center;
        }

        .table{
            margin-top: 10px;
        }

        .table tr td{
            height: 72.5px;
            vertical-align: middle;
        }

        .price-place{
            width: calc(100% - 200px);
            display: flex;
            justify-content: space-between;
            position: relative;
        }

        .table2-container {
            height: 33px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .list-table-item {
            display: flex;
            align-items: center;
        }

        .product-info {
            display: flex;
            flex-direction: column;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 150px;

        }

        .list-table-item img {
            margin-right: 10px;
        }

        .product-info p{
            margin: -2PX;
            text-align: justify;
            text-overflow: ellipsis;
            max-width: 100%;
            margin-left: 1px;
            margin-right: 1px;
        }

        .modal-content {
            height: 800px;
            padding: 20px;
            border-radius: 10px;
            position: relative;
            text-align: left;
        }

        .input-space{
            width: 48%;
            height: 100%;
            max-height: 600px;
            overflow-y: auto;
            position: absolute;
            left: 10px;
        }

        .input-space> input, .input-space> select{
            width: 80%;
            height: 40px;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .list-space{
            width: 52%;
            height: 100%;
            max-height: 600px;
            overflow-y: auto;
            position: absolute;
            right: 10px;
        }

        .add-product-btn {
            margin-left: auto;
            background-color: #343a40;
            color: white;
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 8px;
        }

        .add-product-btn:hover {
            background-color: rgba(52, 58, 64, 0.95);
        }

        .input-space2{
            width: 100%;
            height: 10%;
            display: flex;
            gap: 10px;
        }

        .list-space2{
            width: 100%;
            height: 90%;
            max-height: 560px;
            overflow-y: auto;
        }

        .input-space2>input:nth-child(1){
            width: 200px;
            height: 30px;
            font-size: 16px;
            border-radius: 8px;
            background: white;
        }

        .input-space2>input:nth-child(2){
            width: 60px;
            height: 30px;
            font-size: 18px;
            border-radius: 8px;
            background: white;
        }

        .row-checkbox{
            height: 20px;
            width: 20px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #000000;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #717171;
        }

        .pagination .active {
            background-color: #000000;
            color: white;
            border: 1px solid #000000;
        }

        .pagination .disabled {
            color: #ccc;
            cursor: not-allowed;
        }

        .table-container .pagination {
            margin-bottom: auto;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">

    <jsp:include page="../common/sidebar.jsp"/>

    <main>

        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">입고</h1>
        </div>

        <div class="stockIn-management">
            <div class="table1">
                <div id="search-bar">
                    <div id="search-bar-1">
                        <select id="stockIn-search-bar">
                            <option value="0">전체</option>
                            <option value="1">입고 등록</option>
                            <option value="2">입고중</option>
                            <option value="3">입고 완료</option>
                        </select>
                        <input type="date"
                               id="date1"
                               max="2050-12-31"
                               min="2020-01-01">
                        ~
                        <input type="date"
                               id="date2"
                               max="2050-12-31"
                               min="2020-01-01">
                        <button type="button" class="search-btn" id="submit-btn" onclick="searchStock()">조회</button>
                    </div>
                    <button class="storage-btn" id="storage-submit-btn" onclick="showModal()">입고서 등록</button>
                </div>
                <div>
                    <table class="table table1 table-striped table-hover" id="stock-table">
                        <thead>
                        <tr>
                            <th>입고번호</th>
                            <th>상태</th>
                            <th>작성일자</th>
                            <th>입고일자</th>
                            <th>입고금액</th>
                            <th>요청자</th>
                            <th>수정</th>
                            <th>취소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty stock}">
                                <c:forEach var="s" items="${stock}">
                                    <c:if test="${s.stockStatus eq 'STOCK_IN_REGISTERED' or s.stockStatus eq 'STOCK_IN_PROGRESS' or s.stockStatus eq 'STOCK_IN_COMPLETED'}">

                                        <tr data-storage-no="${s.stockNo}">
                                            <td>${s.stockNo}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${s.stockStatus eq 'STOCK_IN_REGISTERED'}">
                                                        <button type="button" class="btn btn-secondary btn-sm" disabled>입고 등록</button>
                                                    </c:when>
                                                    <c:when test="${s.stockStatus eq 'STOCK_IN_PROGRESS'}">
                                                        <button type="button" class="btn btn-warning btn-sm" disabled>입고중</button>
                                                    </c:when>
                                                    <c:when test="${s.stockStatus eq 'STOCK_IN_COMPLETED'}">
                                                        <button type="button" class="btn btn-success btn-sm" disabled>입고 완료</button>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>${s.stockDate}</td>
                                            <td>${s.expDate}</td>
                                            <td>아직모룸</td>
                                            <td>${s.stockEmp}</td>
                                            <td><button type="button" class="btn btn-outline-success btn-sm" onclick="showUpdateModal()">수정</button></td>
                                            <td><button type="button" class="btn btn-outline-danger btn-sm">취소</button></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5">입고 데이터가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                        </tbody>

                    </table>
                    <div class="pagebar-container mt-3">
                        <jsp:include page="../common/pagebar.jsp"/>
                    </div>

                </div>
            </div>

            <div class="table2">
                <div class="table2-container">
                    <div class="price-place">
                        <div style="font-weight: bold; font-size: 14px;">1 품목</div>
                        <div style="font-weight: bold; font-size: 14px;">총 수량 2</div>
                        <div style="font-weight: bold; font-size: 14px;">총 공급가액 1,200원 + 총 부가세 120원 = 총 합계금액 1,320원</div>
                    </div>
                    <% if (position.equals("manager")) { %>
                    <td>
                        <button class="storage-btn" id="storage-approve-btn">입고 승인</button>
                    </td>
                    <% } %>
                </div>

                <div>
                    <table class="table table2 table-striped table-hover">
                        <thead>
                        <tr>
                            <th colspan="2" style="width: 35%;">품목</th>
                            <th>입고수량</th>
                            <th>구매단가</th>
                            <th>공급가액</th>
                            <th>부가세</th>
                            <th>합계금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="2" class="list-table-item">
                                <img src="/resources/logo.png" style="width: 50px; height: 50px;" alt="제품사진">
                                <div class="product-info">
                                    <p style="font-size: 14px;">238-654-13</p>
                                    <p style="font-weight:600; font-size: 14px;">나이키 에어 포스 1 ‘07</p>
                                    <p style="font-size: 12px;">운동화 WHITE 230</p>
                                </div>
                            </td>
                            <td></td>

                            <td>2</td>
                            <td>47,000</td>
                            <td>47,000</td>
                            <td>1,560</td>
                            <td>48,560</td>

                        </tr>
                        </tbody>
                    </table>
                    <div class="pagebar-container mt-3">
                        <jsp:include page="../common/pagebar.jsp"/>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<%--입고서 모달--%>
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">입고서 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <form>
                    <div class="input-space">
                        <h6>입고 번호</h6>
                        <input type="text" placeholder="자동 생성" readonly >
                        <h6>요청자</h6>
                        <input type="text" placeholder="session에서 가져온 유저id">
                        <h6>입고처</h6>
                        <select id="client-search-bar">
                            <option value="0">입고처1</option>
                            <option value="1">입고처2</option>
                            <option value="2">입고처3</option>
                            <option value="3">입고처4</option>
                        </select>
                        <h6>입고 예정 일자</h6>
                        <input type="text" placeholder="Today + 3" readonly >
                        <h6>창고 번호</h6>
                        <select id="storage-search-bar">
                            <option value="0">창고1</option>
                            <option value="1">창고2</option>
                            <option value="2">창고3</option>
                            <option value="3">창고4</option>
                        </select>
                    </div>
                    <div class="list-space">
                        <div style="padding-bottom: 10px; display: flex; justify-content: space-between; align-items: center;">
                            <h6>입고 품목 정보</h6>
                            <button type="button" class="add-product-btn" id="add-product-btn" onclick="showModal2()">+ 품목 추가</button>
                        </div>

                        <h6 style="font-size: 13px;">2 품목 총 수량 3 합계금액 67,000원 + 부가세 660원 = 총 67,660원</h6>
                        <hr>
                        <table class="table modal-table1 table-striped table-hover" id="stockIn-table">
                            <thead>
                            <tr>
                                <th colspan="2" style="width: 35%;">품목</th>
                                <th>입고수량</th>
                                <th>구매단가</th>
                                <th>과세여부</th>
                                <th>삭제</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="2" class="list-table-item">
                                    <img src="/resources/logo.png" style="width: 50px; height: 50px;" alt="제품사진">
                                    <div class="product-info">
                                        <p style="font-size: 14px;">238-654-13</p>
                                        <p style="font-weight:600; font-size: 14px;">나이키 에어 포스 1 ‘07s</p>
                                        <p style="font-size: 12px;">운동화 WHITE 230</p>
                                    </div>
                                </td>
                                <td></td>
                                <td><label>
                                    <input type="number" min="1" value="1" style="width:50px;">
                                </label></td>
                                <td>47,000</td>
                                <td><select id="taxation">
                                    <option value="0">과세</option>
                                    <option value="1">비과세</option>
                                </select></td>
                                <td><button type="button" class="btn btn-outline-danger btn-sm">삭제</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>

<%--입고서 수정 모달--%>
<div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="UpdatemodalTitle">입고서 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <form>
                    <div class="input-space">
                        <h6>입고 번호</h6>
                        <input type="text" placeholder="자동 생성" readonly >
                        <h6>요청자</h6>
                        <input type="text" placeholder="session에서 가져온 유저id">
                        <h6>입고처</h6>
                        <select id="update-client-search-bar">
                            <option value="0">입고처1</option>
                            <option value="1">입고처2</option>
                            <option value="2">입고처3</option>
                            <option value="3">입고처4</option>
                        </select>
                        <h6>입고 예정 일자</h6>
                        <input type="text" placeholder="Today + 3" readonly >
                        <h6>창고 번호</h6>
                        <select id="storage-update-search-bar">
                            <option value="0">창고1</option>
                            <option value="1">창고2</option>
                            <option value="2">창고3</option>
                            <option value="3">창고4</option>
                        </select>
                    </div>
                    <div class="list-space">
                        <div style="padding-bottom: 10px; display: flex; justify-content: space-between; align-items: center;">
                            <h6>입고 품목 정보</h6>
                            <button type="button" class="add-product-btn" id="update-add-product-btn" onclick="showModal2()">+ 품목 추가</button>
                        </div>

                        <h6 style="font-size: 13px;">2 품목 총 수량 3 합계금액 67,000원 + 부가세 660원 = 총 67,660원</h6>
                        <hr>
                        <table class="table modal-table1 table-striped table-hover">
                            <thead>
                            <tr>
                                <th colspan="2" style="width: 35%;">품목</th>
                                <th>입고수량</th>
                                <th>구매단가</th>
                                <th>과세여부</th>
                                <th>삭제</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="2" class="list-table-item">
                                    <img src="/resources/logo.png" style="width: 50px; height: 50px;" alt="제품사진">
                                    <div class="product-info">
                                        <p style="font-size: 14px;">238-654-13</p>
                                        <p style="font-weight:600; font-size: 14px;">나이키 에어 포스 1 ‘07</p>
                                        <p style="font-size: 12px;">운동화 WHITE 230</p>
                                    </div>
                                </td>
                                <td></td>
                                <td><label>
                                    <input type="number" min="1" value="1" style="width:50px;">
                                </label></td>
                                <td>47,000</td>
                                <td><select id="update-taxation">
                                    <option value="0">과세</option>
                                    <option value="1">비과세</option>
                                </select></td>
                                <td><button type="button" class="btn btn-outline-danger btn-sm">삭제</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>

<%--물품 추가 모달--%>
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle2">품목 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <form>
                    <div class="input-space2">
                        <input type="text" placeholder="품목명">
                        <input type="button" value="조회">
                    </div>
                    <div class="list-space2">
                        <table class="table modal-table1 table-striped table-hover" id="product-table">
                            <thead>
                            <tr>
                                <th colspan="2" style="width: 35%;">품목</th>
                                <th>구매단가</th>
                                <th>판매단가</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="product-selection-btn">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        const today = new Date();
        const formatted = today.toISOString().slice(0, 10); // YYYY-MM-DD 형식으로 자르기

        document.getElementById("date1").value = formatted;
        document.getElementById("date2").value = formatted;
    }

    //검색 조건으로 입고 리스트 가져오기
    function searchStock() {
        let stockStatus = $("#stockIn-search-bar").val();
        let startDate = $("#date1").val();
        let endDate = $("#date2").val();

        $.ajax({
            url: "/api/searchStock",
            type: "GET",
            data: {
                stockStatus: stockStatus,
                startDate: startDate,
                endDate: endDate
            },
            dataType: "json",
            success: function (response) {
                console.log(response);
                updateStockTable(response);
            },
            error: function () {
                console.error("ajax 통신 오류");
            }
        });
    }

    //조회한 정보들로 테이블 그리기
    function updateStockTable(data) {
        let tableBody = $("#stock-table tbody");
        tableBody.empty(); // 기존 tbody 비우기

        if (data.length === 0) {
            tableBody.append("<tr><td colspan='8'>검색 결과가 없습니다.</td></tr>");
            return;
        }

        data.forEach(stock => {
            let statusBtn = "";
            editBtn = `<button type="button" class="btn btn-outline-success btn-sm" onclick="showUpdateModal()">수정</button>`;
            removeBtn = `<button type="button" class="btn btn-outline-danger btn-sm">취소</button>`
            switch (stock.stockStatus) {
                case "STOCK_IN_REGISTERED":
                    statusBtn = `<button type="button" class="btn btn-secondary btn-sm" disabled>입고 등록</button>`;
                    break;
                case "STOCK_IN_PROGRESS":
                    statusBtn = `<button type="button" class="btn btn-warning btn-sm" disabled>입고중</button>`;
                    break;
                case "STOCK_IN_COMPLETED":
                    statusBtn = `<button type="button" class="btn btn-success btn-sm" disabled>입고 완료</button>`;
                    break;
            }

            const stockTr = document.createElement("tr");
            stockTr.setAttribute("data-storage-no", stock.stockNo);

            // 각 칸 만들어서 추가
            const tdNo = document.createElement("td");
            tdNo.innerText = stock.stockNo;
            stockTr.appendChild(tdNo);

            const tdStatus = document.createElement("td");
            tdStatus.innerHTML = statusBtn; // HTML로 버튼 삽입
            stockTr.appendChild(tdStatus);

            const tdDate = document.createElement("td");
            tdDate.innerText = stock.stockDate;
            stockTr.appendChild(tdDate);

            const tdExp = document.createElement("td");
            tdExp.innerText = stock.expDate;
            stockTr.appendChild(tdExp);

            const tdMoney = document.createElement("td");
            tdMoney.innerText = "아직 모룸";
            stockTr.appendChild(tdMoney);

            const tdEmp = document.createElement("td");
            tdEmp.innerText = stock.stockEmp;
            stockTr.appendChild(tdEmp);

            const tdUpdate = document.createElement("td");
            tdUpdate.innerHTML = editBtn;
            stockTr.appendChild(tdUpdate);

            const tdCancel = document.createElement("td");
            tdCancel.innerHTML = removeBtn;
            stockTr.appendChild(tdCancel);

            tableBody.append(stockTr);
        });
    }

    // 입고서 등록 모달
    function showModal() {
        var modalElement = document.getElementById('modal1');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }

    //물품 추가 모달
    function showModal2() {
        var modalElement = document.getElementById('modal2');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        $.ajax({
            url: "/api/productList",
            type: "GET",
            dataType: "json",
            success: function (response) {
                var modal = new bootstrap.Modal(modalElement);
                modal.show();
                createProductTable(response);
            },
            error: function () {
                console.error("제품 리스트 로딩 실패");
            }
        });
    }

    //제품 정보들로 테이블 구성
    function createProductTable(data) {
        let tableBody = $("#product-table tbody");
        tableBody.empty(); // 기존 tbody 비우기

        if (data.length === 0) {
            tableBody.append("<tr><td colspan='8'>제품이 없습니다.</td></tr>");
            return;
        }

        data.forEach(product => {
            let checkBox = `<input type="checkbox" class="row-checkbox">`;

            // 이미지가 비어있으면 기본 이미지로 대체
            let imageUrl = product.imageUrl && product.imageUrl.trim() !== "" ? product.imageUrl : "/resources/default.png";
            let imgSrc = '<img src="' + imageUrl + '" style="width: 50px; height: 50px;" alt="제품사진">';

            // 제품 정보 텍스트
            let productInfo =
                "<div class=\"product-info\">" +
                "<p style=\"font-size: 14px;\">" + product.productNo + "</p>" +
                "<p style=\"font-weight:600; font-size: 14px;\">" + product.productName + "</p>" +
                "<p style=\"font-size: 12px;\">" + product.categoryName + " " + product.color + " " + product.productSize + "</p>" +
                "</div>";

            const productTr = document.createElement("tr");
            productTr.setAttribute("data-product-no", product.productNo);

            const tdCheck = document.createElement("td");
            tdCheck.innerHTML = checkBox;
            productTr.appendChild(tdCheck);

            const tdProduct = document.createElement("td");
            tdProduct.classList.add("list-table-item");
            tdProduct.innerHTML = imgSrc + productInfo;
            productTr.appendChild(tdProduct);

            const tdInPrice = document.createElement("td");
            tdInPrice.innerText = product.stockInPrice;
            productTr.appendChild(tdInPrice);

            const tdOutPrice = document.createElement("td");
            tdOutPrice.innerText = product.stockOutPrice;
            productTr.appendChild(tdOutPrice);

            tableBody.append(productTr);
        });

    }


    // 입고서 수정 모달
    function showUpdateModal() {
        var modalElement = document.getElementById('modal3');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }

    let selectedRows = []; // 선택된 행 데이터를 저장하는 배열

    document.addEventListener("click", function (event) {
        const row = event.target.closest("tr");

        if (row) {
            const targetCheckbox = row.querySelector(".row-checkbox");

            // 체크박스가 아닌 곳 클릭 시 체크박스 토글
            if (event.target.type !== "checkbox") {
                targetCheckbox.checked = !targetCheckbox.checked;
            }

            const productInfoDiv = row.querySelector(".product-info");

            // 각 정보 추출
            const productNo = productInfoDiv.querySelector("p:nth-child(1)")?.innerText.trim();
            const productName = productInfoDiv.querySelector("p:nth-child(2)")?.innerText.trim();
            const etcInfo = productInfoDiv.querySelector("p:nth-child(3)")?.innerText.trim();
            const [categoryName, color, productSize] = etcInfo.split(" ");

            const stockInPrice = row.querySelector("td:nth-child(3)")?.innerText.trim();
            const stockOutPrice = row.querySelector("td:nth-child(4)")?.innerText.trim();
            const imageUrl = row.querySelector("img")?.getAttribute("src");

            const rowData = {
                productNo,
                productName,
                categoryName,
                color,
                productSize,
                stockInPrice,
                stockOutPrice,
                imageUrl
            };

            if (targetCheckbox.checked) {
                // 중복 추가 방지
                if (!selectedRows.some(item => item.productNo === rowData.productNo)) {
                    selectedRows.push(rowData);
                }
            } else {
                // 체크 해제 시 해당 항목 제거
                selectedRows = selectedRows.filter(item => item.productNo !== rowData.productNo);
            }

            console.log("선택된 행 데이터:", selectedRows);
        }
    });

    // 선택 버튼 클릭 시 데이터 전달
    document.getElementById("product-selection-btn").addEventListener("click", function () {
        if (selectedRows.length === 0) {
            console.warn("선택된 제품이 없습니다.");
            return;
        }
        console.log("최종 선택된 데이터:", selectedRows);
        createStockInTable(selectedRows);
    });

    //입고서 테이블 구성
    function createStockInTable(data) {
        let tableBody = $("#stockIn-table tbody");
        tableBody.empty(); // 기존 tbody 비우기

        if (data.length === 0) {
            tableBody.append("<tr><td colspan='8'>제품이 없습니다.</td></tr>");
            return;
        }

        data.forEach(product => {
            // 이미지가 비어있으면 기본 이미지로 대체
            let imageUrl = product.imageUrl && product.imageUrl.trim() !== "" ? product.imageUrl : "/resources/default.png";
            let imgSrc = '<img src="' + imageUrl + '" style="width: 50px; height: 50px;" alt="제품사진">';
            let inputAmount = `<input type="number" min="1" value="1" style="width:50px;">`;
            let selectTax = `<select id="update-taxation">
                                    <option value="0">과세</option>
                                    <option value="1">비과세</option>
                                	</select>`;

            // 제품 정보 텍스트
            let productInfo =
                "<div class=\"product-info\">" +
                "<p style=\"font-size: 14px;\">" + product.productNo + "</p>" +
                "<p style=\"font-weight:600; font-size: 14px;\">" + product.productName + "</p>" +
                "<p style=\"font-size: 12px;\">" + product.categoryName + " " + product.color + " " + product.productSize + "</p>" +
                "</div>";

            const productTr = document.createElement("tr");
            productTr.setAttribute("data-product-no", product.productNo);

            const tdProduct = document.createElement("td");
            tdProduct.classList.add("list-table-item");
            tdProduct.innerHTML = imgSrc + productInfo;
            productTr.appendChild(tdProduct);

            const tdNone = document.createElement("td");
            productTr.appendChild(tdNone);

            const tdInput = document.createElement("td");
            tdInput.innerHTML = inputAmount;
            productTr.appendChild(tdInput);

            const tdInPrice = document.createElement("td");
            tdInPrice.innerText = product.stockInPrice;
            productTr.appendChild(tdInPrice);

            const tdselect = document.createElement("td");
            tdselect.innerHTML = selectTax;
            productTr.appendChild(tdselect);

            tableBody.append(productTr);
        });

    }

    //date2는 date1보다 나중값 입력되기
    document.getElementById("date1").addEventListener("change", function () {
        let date1 = this.value;
        let date2 = document.getElementById("date2");

        // date2의 최소값을 date1보다 하루 이후로 설정
        date2.min = date1 ? new Date(new Date(date1).setDate(new Date(date1).getDate() + 1)).toISOString().split("T")[0] : "2020-01-01";

        // 만약 date2가 date1보다 이전 날짜라면 초기화
        if (date2.value && date2.value <= date1) {
            date2.value = "";
        }
    });
</script>

</body>
</html>