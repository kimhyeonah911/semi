<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지점장승인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: "IBM Plex Sans KR", sans-serif;
            overflow-x: hidden;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            padding: 6px; /* 셀 간격 좁힘 */
        }

        .table th:nth-child(1),
        .table td:nth-child(1) {
            width: 10%;
        }

        .table th:nth-child(2),
        .table td:nth-child(2) {
            width: 15%;
            padding-left: 10px; /* 왼쪽 패딩 줄임 */
        }

        .table th:nth-child(3),
        .table td:nth-child(3) {
            width: 10%;
            padding-left: 10px; /* 왼쪽 패딩 줄임 */
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

        .table {
            margin-top: 10px;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 3px; /* 셀 간격 줄임 */
            font-size: 18px; /* 글자 크기 줄임 */
        }

        th {
            background-color: #FFC9A5;
            font-weight: bold;
            font-size: 18px;
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

        .pagebar-container {
            margin-top: 30px;
        }

        .dropdown {
            width: 100%;
            padding: 5px;
            font-size: 16px;
        }

        .btn-primary {
            font-size: 18px;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar.jsp"/>
        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">지점장승인</h1>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>가입코드</th>
                        <th>가입 날짜</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>소속 지점</th>
                        <th>승인 여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>2025 / 02 / 19</td>
                        <td>user01</td>
                        <td>유저1</td>
                        <td>010-3111-2222</td>
                        <td>강남점</td>
                        <td class="action-buttons">
                            <button class="approve-btn btn btn-success" onclick="approveUser(1)">승인</button>
                            <button class="reject-btn btn btn-danger" onclick="rejectUser(1)">거부</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2025 / 03 / 18</td>
                        <td>user02</td>
                        <td>유저2</td>
                        <td>010-1233-2222</td>
                        <td>역삼점</td>
                        <td class="action-buttons">
                            <button class="approve-btn btn btn-success" onclick="approveUser(2)">승인</button>
                            <button class="reject-btn btn btn-danger" onclick="rejectUser(2)">거부</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2025 / 01 / 18</td>
                        <td>user03</td>
                        <td>유저3</td>
                        <td>010-1233-2222</td>
                        <td>하남점</td>
                        <td class="action-buttons">
                            <button class="approve-btn btn btn-success" onclick="approveUser(2)">승인</button>
                            <button class="reject-btn btn btn-danger" onclick="rejectUser(2)">거부</button>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>2024 / 12 / 01</td>
                        <td>user04</td>
                        <td>유저4</td>
                        <td>010-1233-2222</td>
                        <td>동역사점</td>
                        <td class="action-buttons">
                            <button class="approve-btn btn btn-success" onclick="approveUser(2)">승인</button>
                            <button class="reject-btn btn btn-danger" onclick="rejectUser(2)">거부</button>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<script>
    function approveUser(userId) {
        alert("User " + userId + "님을 지점장으로 승인하셨습니다.");
    }

    function rejectUser(userId) {
        alert("User " + userId + "님을 거부하셨습니다.");
    }
</script>
</body>
</html>
