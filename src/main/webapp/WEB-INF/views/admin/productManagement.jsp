<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품관리,수정</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #left-group {
            display: flex;
            gap: 10px; /* 요소 간격 조정 */
            align-items: center;
            margin-bottom: 0px;
        }

        #right-group{

        }


        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table {
            margin-top: 10px;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            font-size: 18px;
        }

        th {
            background-color: #FFC9A5;
            font-weight: bold;
        }

        td {
            border-bottom: 1px solid #ccc;
        }

        .action-buttons button {
            margin: 0 5px;
            padding: 5px 10px;
            font-size: 16px;
        }

        .modal-body form .form-control {
            font-size: 16px;
        }

        .modal-footer button {
            font-size: 16px;
        }
        #modalCategory, #enrollmodalCategory, #입고처 {
            width: 100px;  /* 원하는 너비로 조정 */
        }
        #enrollImage{
            width: 300px;
        }

        .mb-3 {
            display: flex;
            gap: 20px; /* 요소들 간 간격을 20px로 설정 */
            align-items: center; /* 세로 중앙 정렬 */
        }

        #sellSelect, #categorySelectBar{
            width: 200px;
        }

        .form-select, input[type="text"], button {
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 220px; /* 너비를 동일하게 설정 */
            box-sizing: border-box;
        }

        .form-select:focus, input[type="text"]:focus {
            border-color: #00A69F;
            outline: none;
        }


        button {
            background-color: #00A69F;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 220px; /* 버튼도 동일한 너비로 설정 */
        }

        button:hover {
            background-color: #008F8B;
        }

        .bottom{
            display: flex;
            justify-content: center; /* 버튼을 가운데 정렬 */
            gap: 15px; /* 버튼 사이 간격 */
            margin-top: 30px;
            padding: 15px;
        }

        .modal-body input{
            width: 300px;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
    <!-- Sidebar -->
    <jsp:include page="../common/sidebar.jsp"/>
    <!-- Main content -->
    <main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">제품관리</h1>
        </div>
        <div class="button-container">
            <!-- 왼쪽: 판매 상태, 카테고리, 검색, 조회 버튼 -->
            <form id="search-form">
            <div id="left-group">
                <select class="form-select" id="productStatusSelect" name="selectedStatus" aria-label="판매상태">
                    <option value="Y" selected>판매 상품</option>
                    <option value="P">판매 중지 상품</option>
                    <option value="D">판매 삭제된 상품</option>
                </select>
                <select class="form-select categorySelectBar" id="categorySelectBar" aria-label="카테고리" name="selectedCategory">
                </select>
                <input type="text" id="searchKeyword" placeholder="검색할 상품명을 입력하세요." name="searchedKeyword">
                <button type="submit" class="btn btn-primary">조회</button>
            </div>
            </form>
            <div id="right-group">
                <!-- 오른쪽: 상품 등록 버튼 -->
                <button id="enrollProductBtn" onclick="showEnrollForm()" class="btn btn-success">+ 상품 등록</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover" id="productTable">
                <thead>
                <tr>
                    <th></th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>카테고리</th>
                    <th>색상</th>
                    <th>사이즈</th>
                    <th>입고(구매)가격</th>
                    <th>출고(판매)가격</th>
                    <th>수정</th>
                </tr>
                </thead>
                <tbody id="product-list">
                    <%--상품 리스트 자리--%>
                </tbody>
            </table>
        </div>

        <div class="bottom">
            <button id="pauseButton" class="btn btn-warning" onclick="updateProductPause()">중지</button>
            <button id="deleteButton" class="btn btn-danger" onclick="updateProductDelete()">삭제</button>
        </div>

        <div class="pagebar-container mt-3">
            <jsp:include page="../common/pagebar.jsp"/>
        </div>


        <!-- 등록버튼 누를 시 나오는 모달 창 -->
        <div class="modal fade" id="enrollModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="enrollmodalTitle">제품 등록</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- 모달 본문 -->
                    <div class="modal-body">
                        <form id="enrollForm" action="/enrollProduct" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="enrollProductNo" class="form-label">상품번호</label>
                                <input disabled type="text" class="form-control" id="enrollProductNo" name="productNo" placeholder="자동 생성" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="enrollProductName" class="form-label">상품명</label>
                                <input type="text" class="form-control" id="enrollProductName" name="productName">
                            </div>
                            <div class="mb-3">
                                <label for="selectEnrollCategory" class="form-label">카테고리</label>
                                <select class="form-select categorySelectBar" id="selectEnrollCategory" aria-label="카테고리" name="categoryNo"></select>
                            </div>
                            <div class="mb-3">
                                <label for="enrollColor" class="form-label">색상</label>
                                <input type="text" class="form-control" id="enrollColor" name="color">
                            </div>
                            <div class="mb-3">
                                <label for="enrollSize" class="form-label">사이즈</label>
                                <input type="text" class="form-control" id="enrollSize" name="productSize">
                            </div>
                            <div class="mb-3">
                                <label for="enrollStockInPrice" class="form-label">입고가격</label>
                                <input type="text" class="form-control" id="enrollStockInPrice" name="stockInPrice">
                            </div>
                            <div class="mb-3">
                                <label for="enrollStockOutPrice" class="form-label">판매가격</label>
                                <input type="text" class="form-control" id="enrollStockOutPrice" name="stockOutPrice">
                            </div>
                            <div class="mb-3">
                                <label for="selectClient" class="form-label">입고처</label>
                                <select class="form-select clientSelectBar" id="selectClient" aria-label="입고처" name="clientId">
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="enrollImage" class="form-label">이미지 삽입</label>
                                <input type="file" class="form-control" id="enrollImage" accept="image/*" name="enrollImage">
                            </div>
                        </form>
                    </div>
                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="enrollSave()">등록</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- 수정 버튼 누를 시 나오는 모달 창 -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">제품 수정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- 모달 본문 -->
                    <div class="modal-body">
                        <form id="editForm" action="/updateProduct" method="post">
                            <input type="hidden" name="productNo" id="editProductNo">
                            <div class="mb-3">
                                <label for="editProductName" class="form-label">상품명</label>
                                <input type="text" class="form-control" id="editProductName" name="productName">
                            </div>
                            <div class="mb-3">
                                <label for="selectEditCategory" class="form-label">카테고리</label>
                                <select class="form-select categorySelectBar" id="selectEditCategory" aria-label="카테고리" name="categoryNo"></select>
                            </div>
                            <div class="mb-3">
                                <label for="editColor" class="form-label">색상</label>
                                <input type="text" class="form-control" id="editColor" name="color">
                            </div>
                            <div class="mb-3">
                                <label for="editSize" class="form-label">사이즈</label>
                                <input type="text" class="form-control" id="editSize" name="productSize">
                            </div>
                            <div class="mb-3">
                                <label for="editStockInPrice" class="form-label">입고가격</label>
                                <input type="text" class="form-control" id="editStockInPrice" name="stockInPrice">
                            </div>
                            <div class="mb-3">
                                <label for="editStockOutPrice" class="form-label">출고가격</label>
                                <input type="text" class="form-control" id="editStockOutPrice" name="stockOutPrice">
                            </div>
                        </form>
                    </div>

                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="editSave()">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>



    </main>
</div>





<c:if test="${not empty alert}">
<script>
    alert("${alert}");
</script>
</c:if>

<c:if test="${showModal eq 'enrollModal'}">
<script>
    $(document).ready(function() {
        $('#enrollModal').modal('show'); // 모달 자동 열기
    });
</script>
</c:if>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    //초기 리스트 불러오기
    $(document).ready(function() {
        $.ajax({
            url: '/api/getProductList',  // 서버로 요청
            method: 'GET',
            success: function(data) {
                let tbodyContent = '';
                data.forEach(function(p) {
                    tbodyContent +=
                        "<tr class='product-tr' data-category='" + p.categoryNo + "' data-status='" + p.status + "' data-product-id='" + p.productNo + "'>" +
                        "<td><input type='checkbox' name='product-checkbox'></td>" +
                        "<td class='td-productNo'>" + p.productNo + "</td>" +
                        "<td class='td-productName'>" + p.productName + "</td>" +
                        "<td class='td-categoryName'>" + p.categoryName + "</td>" +
                        "<td class='td-color'>" + p.color + "</td>" +
                        "<td class='td-productSize'>" + p.productSize + "</td>" +
                        "<td class='td-stockInPrice'>" + p.stockInPrice + "</td>" +
                        "<td class='td-stockOutPrice'>" + p.stockOutPrice + "</td>" +
                        "<td style='width: 100px;'>" +
                        "<button class='approve-btn btn btn-success' onclick='showEditForm(this)'>" +
                        "<i class='fas fa-edit'></i>" +
                        "</button>" +
                        "</td>" +
                        "</tr>";
                });
                $('#product-list').html(tbodyContent);   // 테이블에 동적으로 삽입
            },
            error: function(error) {
                console.error('데이터를 불러오는 데 실패했습니다:', error);
            }
        });
    });
</script>
<script> //카테고리 셀렉트바 출력
    $(document).ready(function() {
        getCategoryList(drawCategorySelect);
    });


    function getCategoryList(callback){
        $.ajax({
            url: "/api/categoryList",
            type: "get",
            success: function (res){
                callback(res);
            }, error: function(){
                console.log("category list ajax 요청 실패");
            }
        })
    }

function drawCategorySelect(res) {
    // 모든 select 요소 가져오기
    document.querySelectorAll(".categorySelectBar").forEach(categorySelectBar => {
        // 기존 옵션 제거
        categorySelectBar.innerHTML = "";

        //기본 선택 option 추가 (단, 모달에는 추가 X)
        if (!categorySelectBar.closest(".modal")) {
            const defaultOption = document.createElement("option");
            defaultOption.value = "";
            defaultOption.innerText = "전체";
            categorySelectBar.appendChild(defaultOption);
        }

        // 데이터 받아와서 option 추가
        res.forEach(category => {
            const option = document.createElement("option");
            option.value = category.categoryNo;
            option.innerText = category.categoryName;
            categorySelectBar.appendChild(option);
        });
    });
}

//입고처 셀렉트바 불러오기
// 모달이 열릴 때 클라이언트 리스트 다시 불러오기
    $('#enrollModal').on('show.bs.modal', function () {
        getClientList(drawClientSelect);
    });

function getClientList(callback) {
    $.ajax({
        url: "/api/clientList",
        type: "get",
        success: function (res) {
            callback(res);
        },
        error: function () {
            console.log("client list ajax 요청 실패");
        }
    });
}

function drawClientSelect(res) {
    // 모든 select 요소 가져오기
    document.querySelectorAll(".clientSelectBar").forEach(clientSelectBar => {
        // 기존 옵션 제거
        clientSelectBar.innerHTML = "";

        //placeholder 역할을 하는 기본 옵션 추가
        const placeholderOption = document.createElement("option");
        placeholderOption.value = "";
        placeholderOption.innerText = "옵션을 선택하세요";
        placeholderOption.disabled = true;
        placeholderOption.selected = true;
        clientSelectBar.appendChild(placeholderOption);

        // 데이터 받아와서 option 추가
        res.forEach(client => {
            const option = document.createElement("option");
            option.value = client.clientId;
            option.innerText = client.clientName;
            clientSelectBar.appendChild(option);
        });
    });
}


//판매 중지 버튼
function updateProductPause() {
    let selectedProductsNo = [];
    $('input[name="product-checkbox"]:checked').each(function() {
        selectedProductsNo.push($(this).closest("tr").data("product-id"));
    });

    if (selectedProductsNo.length === 0) {
        alert("상품을 선택해주세요.");
        return;
    }


    $.ajax({
        url: "/api/updateProductPause",
        type: "POST",
        data: { productNos: selectedProductsNo.join(",") },
        dataType: "text",
        success: function(res) {
            console.log("🔹 서버 응답 데이터:", res);
            console.log("🔹 응답 타입:", typeof res);

            if (res.trim() === "success") {
                alert("선택한 상품의 판매가 중지되었습니다.");
                location.reload();
            } else {
                alert("판매 중지에 실패했습니다. 다시 시도해주세요.");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            console.error("서버 응답:", xhr.responseText);
            alert("서버 오류 발생. 다시 시도해주세요.");
        }
    });
}

//판매 삭제 버튼
function updateProductDelete() {
    let selectedProductsNo = [];
    $('input[name="product-checkbox"]:checked').each(function() {
        selectedProductsNo.push($(this).closest("tr").data("product-id"));
    });

    if (selectedProductsNo.length === 0) {
        alert("상품을 선택해주세요.");
        return;
    }

    $.ajax({
        url: "/api/updateProductDelete",
        type: "POST",
        data: { productNos: selectedProductsNo.join(",") },
        dataType: "text",
        success: function(res) {
            console.log("🔹 서버 응답 데이터:", res);
            console.log("🔹 응답 타입:", typeof res);

            if (res.trim() === "success") {
                alert("선택한 상품이 삭제되었습니다.");
                location.reload();
            } else {
                alert("상품 삭제에 실패하였습니다. 다시 시도해주세요.");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            console.error("서버 응답:", xhr.responseText);
            alert("서버 오류 발생. 다시 시도해주세요.");
        }
    });
}

//판매 재시작 버튼
function updateProductRestart() {

    console.log("재시작함수실행");

    let selectedProductsNo = [];
    $('input[name="product-checkbox"]:checked').each(function() {
        selectedProductsNo.push($(this).closest("tr").data("product-id"));
    });

    if (selectedProductsNo.length === 0) {
        alert("상품을 선택해주세요.");
        return;
    }

    $.ajax({
        url: "/api/updateProductRestart",
        type: "POST",
        data: { productNos: selectedProductsNo.join(",") },
        dataType: "text",
        success: function(res) {
            if (res.trim() === "success") {
                alert("선택한 상품 판매가 재시작 되었습니다.");
                location.reload();
            } else {
                alert("상품 판매 재시작에 실패하였습니다. 다시 시도해주세요.");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            console.error("서버 응답:", xhr.responseText);
            alert("서버 오류 발생. 다시 시도해주세요.");
        }
    });
}


    //상품등록
    function showEnrollForm(){
        new bootstrap.Modal(document.querySelector("#enrollModal")).show();
    }

    function enrollSave(){
        const form = document.getElementById("enrollForm");

        // 필수 입력값 검증
        const requiredFields = [
            {id: "enrollProductName", message: "상품명을 입력해주세요."},
            {id: "selectEnrollCategory", message: "카테고리를 선택해주세요."},
            {id: "enrollColor", message: "색상을 입력해주세요."},
            {id: "enrollSize", message: "사이즈를 입력해주세요.", type: "number"},
            {id: "enrollStockInPrice", message: "입고 가격을 입력해주세요.", type: "number"},
            {id: "enrollStockOutPrice", message: "판매 가격을 입력해주세요.", type: "number"},
            {id: "selectClient", message: "입고처를 입력해주세요.", type: "select"},
            {id: "enrollImage", message: "이미지를 첨부해주세요.", type: "file"}
        ];

        for(const field of requiredFields){
            const input = document.getElementById(field.id);
            if(!input)continue;

            if(field.type==="select") {
                if (!input.value) {
                    alert(field.message);
                    input.focus();
                    return;
                }
            } else if(field.type==="file") {
                if (input.files.length === 0) {
                    alert(field.message);
                    input.focus();
                    return;
                }
            } else if (field.type === "number") {
                // 숫자인지 확인 (음수 포함 가능)
                if (!/^-?\d+$/.test(input.value.trim())) {
                    alert(field.message + " (숫자만 입력 가능합니다.)");
                    input.focus();
                    return;
                }
            } else {
                if (input.value.trim() === "") {
                    alert(field.message);
                    input.focus();
                    return;
                }
            }
        }

        form.action = "/enrollProduct";
        form.submit();
    }


    //상품 수정
    function showEditForm(button){
        new bootstrap.Modal(document.querySelector("#editModal")).show();

        const tr =$(button).closest("tr");

        const productNo = tr.data("product-id");
        const productName = tr.find(".td-productName").text().trim();
        const categoryNo = tr.data("category");
        const color = tr.find(".td-color").text().trim();
        const productSize = tr.find(".td-productSize").text().trim();
        const stockInPrice = tr.find(".td-stockInPrice").text().trim();
        const stockOutPrice = tr.find(".td-stockOutPrice").text().trim();

        $("#editProductNo").val(productNo);
        $("#editProductName").val(productName);
        $("#selectEditCategory").val(categoryNo).prop("selected", true);
        $("#editColor").val(color);
        $("#editSize").val(productSize);
        $("#editStockInPrice").val(Number(stockInPrice.replace(/[^0-9]/g, "")));
        $("#editStockOutPrice").val(Number(stockOutPrice.replace(/[^0-9]/g, "")));

        console.log("✅ 모달 값 설정 완료:", { productName, categoryNo, color, productSize, stockInPrice, stockOutPrice });
    }

    function editSave(){
        const form = document.getElementById("editForm");

        // 필수 입력값 검증
        const requiredFields = [
            {id: "editProductName", message: "상품명을 입력해주세요."},
            {id: "selectEditCategory", message: "카테고리를 선택해주세요."},
            {id: "editColor", message: "색상을 입력해주세요."},
            {id: "editSize", message: "사이즈를 입력해주세요.", type: "number"},
            {id: "editStockInPrice", message: "입고 가격을 입력해주세요.", type: "number"},
            {id: "editStockOutPrice", message: "판매 가격을 입력해주세요.", type: "number"},
        ];

        for(const field of requiredFields){
            const input = document.getElementById(field.id);
            if(!input)continue;

            if(field.type==="select") {
                if (!input.value) {
                    alert(field.message);
                    input.focus();
                    return;
                }
            } else if (field.type === "number") {
                // 숫자인지 확인 (음수 포함 가능)
                if (!/^-?\d+$/.test(input.value.trim())) {
                    alert(field.message + " (숫자만 입력 가능합니다.)");
                    input.focus();
                    return;
                }
            } else {
                if (input.value.trim() === "") {
                    alert(field.message);
                    input.focus();
                    return;
                }
            }
        }

        form.action="/updateProduct";
        form.submit();
    }

    //상품검색
    $(document).ready(function() {
        // 폼 제출 시 AJAX 요청 처리
        $('#search-form').on('submit', function(e) {
            e.preventDefault();  // 기본 폼 제출을 방지
            // 폼에 제출된 데이터 가져오기
            const keyword = document.getElementById('searchKeyword').value.trim();
            const status = document.getElementById('productStatusSelect').value;
            const categoryNo = document.getElementById('categorySelectBar').value;

            console.log(categoryNo);

            // AJAX 요청 보내기
            $.ajax({
                url: '/api/searchProduct',  // 서버로 요청
                method: 'GET',
                data: {
                    searchedKeyword: keyword,
                    selectedStatus: status,
                    selectedCategory: categoryNo
                },
                success: function(data) {
                    const tableBody = $('#product-list tbody');
                    tableBody.empty();  // 기존 결과 비우기

                    let tbodyContent = "";

                    if(data.length === 0){
                        tbodyContent = '<tr><td colspan="9" class="text-center">조회 결과가 없습니다.</td></tr>';
                    } else {
                        data.forEach(function (p) {
                            tbodyContent += "<tr class='product-tr' data-category='" + p.categoryNo + "' data-status='" + p.status + "' data-product-id='" + p.productNo + "'>" +
                                "<td><input type='checkbox' name='product-checkbox'></td>" +
                                "<td class='td-productNo'>" + p.productNo + "</td>" +
                                "<td class='td-productName'>" + p.productName + "</td>" +
                                "<td class='td-categoryName'>" + p.categoryName + "</td>" +
                                "<td class='td-color'>" + p.color + "</td>" +
                                "<td class='td-productSize'>" + p.productSize + "</td>" +
                                "<td class='td-stockInPrice'>" + p.stockInPrice + "</td>" +
                                "<td class='td-stockOutPrice'>" + p.stockOutPrice + "</td>" +
                                "<td style='width: 100px;'>" +
                                "<button class='approve-btn btn btn-success' onclick='showEditForm(this)'>" +
                                "<i class='fas fa-edit'></i>" +
                                "</button>" +
                                "</td>" +
                                "</tr>";
                        });
                    }
                    $('#product-list').html(tbodyContent);   // 테이블에 동적으로 삽입

                    changePauseBtn(status);

                    // 폼의 값들을 다시 설정 (검색 후에도 값들이 남도록)
                    $('#searchKeyword').val(keyword);
                    $('#productStatusSelect').val(status);
                    $('#categorySelectBar').val(categoryNo);

                },
                error: function(error) {
                    console.error('상품을 검색하는데 실패했습니다:', error);
                    alert('상품을 검색하는데 실패했습니다');
                }
            });
        });

        function changePauseBtn(status){
            const pauseBtn = document.getElementById("pauseButton");
            const deleteBtn = document.getElementById("deleteButton")

            if(status === "P"){
                pauseBtn.textContent = "재시작";
                pauseBtn.classList.remove("btn-warning");
                pauseBtn.classList.add("btn-primary");
                pauseBtn.disabled = false;
                pauseBtn.onclick = updateProductRestart;

                deleteBtn.textContent = "삭제";
                deleteBtn.classList.remove("btn-secondary");
                deleteBtn.classList.add("btn-danger");
                deleteBtn.disabled = false;
            } else if (status === "D") {
                pauseBtn.classList.remove("btn-warning", "btn-primary");
                pauseBtn.classList.add("btn-secondary");
                pauseBtn.disabled = true;
                pauseBtn.onclick = null;

                deleteBtn.classList.remove("btn-danger");
                deleteBtn.classList.add("btn-secondary");
                deleteBtn.disabled = true;
                deleteBtn.onclick = null;

            } else {
                pauseBtn.textContent = "중지";
                pauseBtn.classList.remove("btn-primary", "btn-secondary");
                pauseBtn.classList.add("btn-warning");
                pauseBtn.disabled = false;  // 버튼 활성화
                pauseBtn.onclick = updateProductPause;

                deleteBtn.textContent = "삭제";
                deleteBtn.classList.remove("btn-secondary");
                deleteBtn.classList.add("btn-danger");
                deleteBtn.disabled = false;
                deleteBtn.onclick = updateProductDelete;
            }
        }
    });



</script>
</body>
</html>