<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래처 관리, 수정, 삭제</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            font-family: "Noto Sans", sans-serif;
        }
        .main-content {
            padding-left: 2rem;
            padding-right: 2rem;
        }
        .mypage {
            display: flex;
        }
        #mypage1 {
            background: ;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid" style="margin-top: 130px">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar.jsp"/>
        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">마이페이지</h1>
            </div>
            <div class="mypage">
                <div id="mypage1">
                    <h2>내 정보</h2>
                    이름 | 관리자 <br>
                    아이디 | admin <br>
                    비밀번호 <input type="text"> <br>
                    비밀번호 확인 <input type="text">
                    전화번호 <input type="text" >
                </div>
                <div id="mypage2">
                    <h2>내 정보</h2>
                    <div>지점 | 본사</div>
                    <div>직급 | 관리자</div>
                    <div>본사사 주소 | 서울특별시 강남구 테헤란로 123, 3층 (역삼동)</div>
                </div>
            </div>

        </main>
    </div>
</div>


</body>
<script>


</script>
</html>
