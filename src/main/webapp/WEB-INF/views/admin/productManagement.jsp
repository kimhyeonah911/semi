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

        .left-group {
            display: flex;
            gap: 10px; /* 요소 간격 조정 */
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
            width: 100px;
        }

        .main-content {
            padding-left: 2rem;
            padding-right: 2rem;
        }

        .mb-3 {
            display: flex;
            gap: 20px; /* 요소들 간 간격을 20px로 설정 */
            align-items: center; /* 세로 중앙 정렬 */
            margin-bottom: 10px;
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

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
    <!-- Sidebar -->
    <jsp:include page="../common/sidebar-admin.jsp"/>
    <!-- Main content -->
    <main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">제품관리</h1>
        </div>
        <div class="button-container">
            <!-- 왼쪽: 판매 상태, 카테고리, 검색, 조회 버튼 -->
            <div class="left-group mb-3" >
                <select  class="form-select" id="sellSelect" aria-label="판매상태">
                    <option value="sell">판매 상품</option>
                    <option value="stop">판매 중지 상품</option>
                    <option value="deleted">판매 삭제된 상품</option>
                </select>
                <select class="form-select categorySelectBar" id="categorySelectBar" aria-label="카테고리">
                    <option value="all">전체</option>
                </select>
                <input type="text" id="searchProduct" placeholder="검색할 상품명을 입력하세요.">
                <button class="btn btn-primary" >조회</button>
            </div>
            <!-- 오른쪽: 상품 등록 버튼 -->
            <button id="enrollProductBtn" onclick="showEnrollForm()" class="btn btn-success mb-2">+ 상품 등록</button>
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
                <tbody>
                <c:forEach var="p" items="${product}">
                    <tr class="product-tr" data-category="${p.categoryNo}" data-status="${p.status}" data-product-id="${p.productNo}">
                        <td><input type="checkbox" name="product-checkbox"></td>
                        <td>${p.productNo}</td>
                        <td>${p.productName}</td>
                        <td>${p.categoryName}</td>
                        <td>${p.color}</td>
                        <td>${p.productSize}</td>
                        <td>${p.stockInPrice}</td>
                        <td>${p.stockOutPrice}</td>
                        <td style="width: 100px;"><button class="approve-btn btn btn-success" onclick="showEditForm(this)"><i class="fas fa-edit"></i></button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="bottom">
            <button id="pauseButton" class="btn btn-warning" onclick="updateProductStatus()">중지</button>
            <button id="deleteButton" class="btn btn-danger" onclick="updateProductStatus()">삭제</button>
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
                        <form id="enrollForm">
                            <div class="mb-3">
                                <label for="enrollProductNo" class="form-label">상품번호</label>
                                <input type="text" class="form-control" id="enrollProductNo" name="productNo" placeholder="자동 생성" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="enrollProductName" class="form-label">상품명</label>
                                <input type="text" class="form-control" id="enrollProductName" name="productName">
                            </div>
                            <div class="mb-3">
                                <label for="selectCategory" class="form-label">카테고리</label>
                                <select class="form-select categorySelectBar" id="selectCategory" aria-label="카테고리" name="categoryNo"></select>
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
                                <select class="form-select ClientSelectBar" id="selectClient" aria-label="입고처" name="clientId">
                                    <option value="">입고처 선택</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="enrollImage" class="form-label">이미지 삽입</label>
                                <input type="file" class="form-control" id="enrollImage" accept="image/*" name="ImageUrl">
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
                        <form id="editForm">
                            <div class="mb-3">
                                <label for="modalShoeName" class="form-label">상품명</label>
                                <input type="text" class="form-control" id="modalShoeName">
                            </div>
                            <div class="mb-3">
                                <label for="modalCategory" class="form-label">카테고리</label>
                                <select class="form-select categorySelectBar" id="modalCategory">
                                    <option value="구두">구두</option>
                                    <option value="운동화">운동화</option>
                                    <option value="슬리퍼">슬리퍼</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="modalColor" class="form-label">색상</label>
                                <input type="text" class="form-control" id="modalColor">
                            </div>
                            <div class="mb-3">
                                <label for="modalSize" class="form-label">사이즈</label>
                                <input type="text" class="form-control" id="modalSize">
                            </div>
                            <div class="mb-3">
                                <label for="modalPrice" class="form-label">가격</label>
                                <input type="text" class="form-control" id="modalPrice">
                            </div>
                        </form>
                    </div>

                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="saveChanges()">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>



    </main>
</div>


</body>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
$(document).ready(function() {
    getClientList(drawClientSelect);
});


function getClientList(callback){
    $.ajax({
        url: "/api/clientList",
        type: "get",
        success: function (res){
            callback(res);
        }, error: function(){
            console.log("client list ajax 요청 실패");
        }
    })
}

function drawClientSelect(res) {
    // 모든 select 요소 가져오기
    document.querySelectorAll(".clientSelectBar").forEach(clientSelectBar => {
        // 기존 옵션 제거
        clientSelectBar.innerHTML = "";

        // //기본 선택 option 추가 (단, 모달에는 추가 X)
        // if (!categorySelectBar.closest(".modal")) {
        //     const defaultOption = document.createElement("option");
        //     defaultOption.value = "";
        //     defaultOption.innerText = "전체";
        //     categorySelectBar.appendChild(defaultOption);
        // }

        // 데이터 받아와서 option 추가
        res.forEach(client => {
            const option = document.createElement("option");
            option.value = client.clientId;
            option.innerText = client.clientName;
            clientSelectBar.appendChild(option);
        });
    });
}

</script>

<script> //판매 중지, 삭제 버튼
    $(document).ready(function() {
        $("#pauseButton").click(function() {
            updateProductStatus("/api/updateProductPause", "선택 상품 판매가 중지되었습니다.", "선택 상품 판매 중지에 실패했습니다. 다시 시도해주세요."); // 판매 중지
        });

        $("#deleteButton").click(function() {
            updateProductStatus("/api/updateProductDelete", "선택 상품이 삭제되었습니다.", "선택 상품 삭제에 실패했습니다. 다시 시도해주세요."); // 상품 삭제
        });
    });

    function updateProductStatus(url, successMsg, errorMsg) {
        let selectedProductsNo = [];
        $('input[name="product-checkbox"]:checked').each(function() {
            selectedProductsNo.push($(this).closest("tr").data("product-id"));
        });

        if (selectedProductsNo.length === 0) {
            alert("상품을 선택해주세요.");
            return;
        }

        $.ajax({
            url: url,
            type: "POST",
            data: {productNos: selectedProductsNo.join(",")},
            success: function(res) {
                if (res.success) {
                    alert(successMsg);
                    location.reload();
                } else {
                    alert(errorMsg);
                }
            },
            error: function() {
                alert("서버 오류 발생. 다시 시도해주세요.");
            }
        });
    }
</script>



<script>
    function showEnrollForm(){
        // 등록 모달 띄우기
        new bootstrap.Modal(document.querySelector("#enrollModal")).show();
    }

    function enrollSave(){
        const form = document.getElementById("enrollForm");
        const formData = new FormData(form);

        // 필수 입력값 검증
        const requiredFields = [
            {id: "enrollProductName", message: "상품명을 입력해주세요."},
            {id: "selectCategory", message: "카테고리를 선택해주세요."},
            {id: "enrollColor", message: "색상을 입력해주세요."},
            {id: "enrollSize", message: "사이즈를 입력해주세요."},
            {id: "enrollStockInPrice", message: "입고 가격을 입력해주세요."},
            {id: "enrollStockOutPrice", message: "판매 가격을 입력해주세요."},
            {id: "selectClient", message: "입고처를 입력해주세요."},
            {id: "enrollImage", message: "이미지를 첨부해주세요."}
        ];

        for (const field of requiredFields) {
            const input = document.getElementById(field.id);
            if (!input || input.value.trim() === "") {
                alert(field.message);
                input.focus(); // 입력이 안 된 필드로 포커스 이동
                return;
            }
        }


        $.ajax({
                    type: "POST",
                    url: "/api/enrollProduct",
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: function () {
                        alert("상품이 등록되었습니다!");
                        $("#enrollForm")[0].reset(); // 입력 필드 초기화
                        $("#enrollModal").hide(); // 모달 닫기
                    },
                    error: function () {
                        alert("상품 등록에 실패했습니다.");
                    }
                });
    }



    function showEditForm(button) {
        var row = button.closest("tr");
        // 기존에 "editing-row"가 있던 행에서 제거
        document.querySelectorAll(".editing-row").forEach(r => r.classList.remove("editing-row"));

        // 현재 클릭한 행에 "editing-row" 추가
        row.classList.add("editing-row");
        // tr에서 각 셀 값 가져오기
        var shoeName = row.cells[1].textContent.trim();
        var category = row.cells[2].textContent.trim();
        var color = row.cells[3].textContent.trim();
        var size = row.cells[4].textContent.trim();
        var price = row.cells[5].textContent.trim();

        // 모달 입력 필드에 값 설정
        document.getElementById("modalShoeName").value = shoeName;
        document.getElementById("modalCategory").value = category;
        document.getElementById("modalColor").value = color;
        document.getElementById("modalSize").value = size;
        document.getElementById("modalPrice").value = price;

        // 모달 띄우기
        var modal = new bootstrap.Modal(document.getElementById("editModal"));
        modal.show();
    }

    function saveChanges() {
        // 현재 열린 모달에서 수정된 데이터 가져오기
        var updatedShoeName = document.getElementById("modalShoeName").value;
        var updatedCategory = document.getElementById("modalCategory").value;
        var updatedColor = document.getElementById("modalColor").value;
        var updatedSize = document.getElementById("modalSize").value;
        var updatedPrice = document.getElementById("modalPrice").value;

        // 현재 수정 중인 행(tr) 찾기
        var row = document.querySelector(".editing-row");

        if (row) {
            row.cells[1].textContent = updatedShoeName;
            row.cells[2].textContent = updatedCategory;
            row.cells[3].textContent = updatedColor;
            row.cells[4].textContent = updatedSize;
            row.cells[5].textContent = updatedPrice;

            // 수정 완료 후 클래스 제거
            row.classList.remove("editing-row");
        }

        // 모달 닫기
        var modalElement = document.getElementById("editModal");
        var modalInstance = bootstrap.Modal.getInstance(modalElement);
        modalInstance.hide();
    }


</script>
</html>