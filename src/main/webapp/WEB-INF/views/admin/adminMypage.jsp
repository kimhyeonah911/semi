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
  <link href="https://cdn.jsdelivr.net/npm/nanumsquareneo@0.0.5/nanumsquareneo.min.css" rel="stylesheet">

  <style>
    * {
      font-family: "NanumSquareNeo", sans-serif;
    }
    html, body {
      overflow-x: hidden; /* 수평 스크롤 방지 */
    }
    body {
      margin: 0;
      padding: 0;
      font-family: "Noto Sans", sans-serif;
      background-color: #f4f6f9;

    }
    .main-content {
      padding-left: 2rem;
      padding-right: 2rem;
      font-family: 'Noto Sans KR', sans-serif;
      font-size: 15px;
    }

    .container-fluid {
      justify-content: center;
    }

    .mypage {
      display: flex;
      justify-content: center;
      background: #fff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      padding: 20px;
      margin-top: 20px;
      height: auto; /* 높이 자동으로 조정 */
      max-height: 700px; /* 최대 높이 제한 */
    }

    /* 왼쪽 폼 스타일 */
    #mypage1 {
      width: 48%;
      padding: 20px;
      background-color: #fafafa;
      border-radius: 5px;
      border: 1px solid #ddd;
    }

    #mypage1 > div {
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
    }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f9f9f9;
      transition: border-color 0.3s, background-color 0.3s;
    }

    input[type="text"]:focus, input[type="password"]:focus {
      border-color: #007bff;
      background-color: #e8f0fe;
    }

    button {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

    /* 오른쪽 정보 영역 */
    #mypage2 {
      width: 50%;
      padding: 20px;
      background-color: #fafafa;
      border-radius: 5px;
      border: 1px solid #ddd;
    }

    .member-content{
      width: auto;
    }

    #mypage2 h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    #mypage2 > div {
      margin-bottom: 15px;
      font-size: 16px;
    }

    #mypage2 .icon-container {
      text-align: center;
      margin-bottom: 20px;
    }

    .fas.fa-user-circle {
      font-size: 150px;
      color: #007bff;
    }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid" style="margin-top: 130px">
  <!-- Sidebar -->
  <jsp:include page="../common/sidebar.jsp"/>
  <!-- Main content -->
  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">마이페이지</h1>
    </div>
    <div class="mypage">
<%--      <form id="mypage1">--%>
<%--        <div>--%>
<%--          <label for="name">이름</label>--%>
<%--          <input type="text" id="name" value="김현아">--%>
<%--        </div>--%>
<%--        <div>--%>
<%--          <label for="username">아이디</label>--%>
<%--          <input type="text" id="username" value="user100">--%>
<%--        </div>--%>
<%--        <div>--%>
<%--          <label for="password">비밀번호</label>--%>
<%--          <input type="password" id="password">--%>
<%--        </div>--%>
<%--        <div>--%>
<%--          <label for="passwordConfirm">비밀번호 확인</label>--%>
<%--          <input type="password" id="passwordConfirm">--%>
<%--        </div>--%>
<%--        <div>--%>
<%--          <label for="phoneNumber">전화번호</label>--%>
<%--          <input type="text" id="phoneNumber" value="010-1234-5678(유저전화번호)">--%>
<%--        </div>--%>
<%--        <button id="edit" class="btn btn-primary">정보 수정</button>--%>
<%--      </form>--%>
      <div id="mypage2">

        <h2>근무 정보</h2>
        <div style="text-align: center; margin-bottom: 20px;">
          <i class="fas fa-user-circle" style="font-size: 150px; color: #777777;"></i>
        </div>
        <div class="member-content">
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fa-solid fa-marker" style="color: #777777; margin-right: 10px;"></i>아이디 : user01
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fa-solid fa-tag" style="color: #777777; margin-right: 10px;"></i>이름 : 김철수
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fa-solid fa-phone" style="color: #777777; margin-right: 10px;"></i>전화번호 : 010-9876-5432
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fa-solid fa-calendar" style="color: #777777; margin-right: 10px;"></i>입사일 : 23/05/15
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fas fa-building" style="color: #777777; margin-right: 10px;"></i>지점 : 강남점
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fas fa-briefcase" style="color: #777777; margin-right: 10px;"></i>직급 : 관리자
          </div>
          <div style="margin-bottom: 15px; font-size: 16px;">
            <i class="fas fa-map-marker-alt" style="color: #777777; margin-right: 10px;"></i>지점 주소 : 서울특별시 강남구 테헤란로 123, 3층 (역삼동)
          </div>
        </div>
        <button id="edit" class="btn btn-primary">정보 수정</button>
      </div>

    </div>

    <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- 모달 헤더 -->
          <div class="modal-header">
            <h5 class="modal-title" id="Title">거래처 등록</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <!-- 모달 본문 -->
          <form id="editForm" action="update.me" method="POST">
            <div class="modal-body">
              <div class="mb-3">
                <label for="memberName" class="form-label">이름</label>
                <input type="text" class="form-control" id="memberName" placeholder="자동생성">
              </div>
              <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <input type="text" class="form-control" id="phone">
              </div>
              <div class="mb-3">
                <label for="hireDate" class="form-label">입사일</label>
                <input type="text" class="form-control" id="hireDate">
              </div>
              <div class="mb-3">
                <label for="currentPwd" class="form-label">기존 비밀번호</label>
                <input type="text" class="form-control" id="currentPwd">
              </div>
              <div class="mb-3">
                <label for="newPwd" class="form-label">새 비밀번호</label>
                <input type="text" class="form-control" id="newPwd">
              </div>
              <div class="mb-3">
                <label for="newCheckPwd" class="form-label">새 비밀번호</label>
                <input type="text" class="form-control" id="newCheckPwd">
              </div>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">저장</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>