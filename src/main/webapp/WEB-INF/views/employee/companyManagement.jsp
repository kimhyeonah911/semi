<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원승인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: "IBM Plex Sans KR", sans-serif;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table th:nth-child(1),
        .table td:nth-child(1) {
            width: 10%;
        }

        .table th:nth-child(2),
        .table td:nth-child(2) {
            width: 15%;
            padding-left: 20px;
        }

        .table th:nth-child(3),
        .table td:nth-child(3) {
            width: 10%;
            padding-left: 20px;
        }

        .table th:nth-child(4),
        .table td:nth-child(4) {
            width: 15%;
        }

        .table th:nth-child(5),
        .table td:nth-child(5) {
            width: 20%;
        }

        .table th:nth-child(6),
        .table td:nth-child(6) {
            width: 10%;
        }

        th, td {
            padding: 10px;
            font-size: 15px;
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

        .main-content {
            padding-left: 2rem;
            padding-right: 2rem;
        }
        #createbtn {
            margin-top: 20px;
            background-color: #4CAF50;  /* 버튼 배경색 (초록색) */
            color: white;               /* 버튼 텍스트 색 (흰색) */
            border: none;               /* 테두리 없애기 */
            padding: 12px 24px;         /* 상하 12px, 좌우 24px의 패딩 */
            font-size: 16px;            /* 폰트 크기 */
            cursor: pointer;           /* 마우스 오버 시 손 모양 */
            border-radius: 8px;         /* 버튼의 모서리 둥글게 만들기 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);  /* 그림자 효과 */
            transition: background-color 0.3s, transform 0.3s; /* 배경색과 크기 변화를 부드럽게 */
        }

        #createbtn:hover {
            background-color: #45a049;  /* 마우스 오버 시 배경색 변화 */
            transform: translateY(-2px);  /* 마우스 오버 시 버튼을 살짝 위로 이동 */
        }

        #createbtn:active {
            background-color: #388e3c;  /* 클릭 시 배경색 */
            transform: translateY(2px);  /* 클릭 시 버튼을 살짝 아래로 이동 */
        }


    </style>
</head>
<body>
<jsp:include page="../common/header-employee.jsp"/>
<div class="container-fluid" style="margin-top: 130px">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar-manager.jsp"/>
        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>지점 생성(지점장만 입력해주세요)</h2>
            </div>
            <form>
                <div class="mb-3">
                    <label for="storeName" class="form-label">지점명</label>
                    <input type="text" class="form-control" id="storeName">
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">주소</label>
                    <input type="text" class="form-control" id="address">
                </div>

                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">매장 전화번호</label>
                    <input type="text" class="form-control" id="phoneNumber">
                </div>

                <div class="mb-3">
                    <label for="registrationDate" class="form-label">등록일</label>
                    <input type="text" class="form-control" id="registrationDate" value="2025 / 03 / 28" disabled>
                </div>
                <button id="createbtn" onclick="">생성</button>
            </form>


        </main>
    </div>
</div>


</body>
</html>