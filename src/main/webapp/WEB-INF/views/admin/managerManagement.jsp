<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    main{
      margin-left: 250px;  /* ms-sm-auto */
      /*margin-right: auto;*/
      width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
      padding-left: 24px;  /* px-md-4 */
      /*padding-right: 24px;*/
      margin-top: 130px;
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
      <h2>지점장승인</h2>
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
        <c:forEach var="m" items="${acceptManager}">
          <tr>
            <td>${m.empNo}</td>
            <td>${m.createDate}</td>
            <td>${m.memId}</td>
            <td>${m.memName}</td>
            <td>${m.phone}</td>
            <td>${m.storeName}</td>
            <td class="action-buttons">
              <button class="approve-btn btn btn-success" onclick="approveManager('${m.storeId}', '${m.memId}')">승인</button>
              <button class="reject-btn btn btn-danger" onclick="rejectManager('${m.storeId}')">거부</button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
  function approveManager(storeId, memId) {
    $.ajax({
      url: '/approveManager',
      type: 'POST',
      data: { storeId: storeId, memId: memId},
      success: function() {
        alert('지점장 승인이 완료되었습니다');
        location.reload();
      },
      error: function(error) {
        alert('오류가 발생했습니다:' + error);
      }
    });
  }

  function rejectManager(storeId) {
    $.ajax({
      url: '/rejectManager',
      type: 'POST',
      data: {storeId: storeId},
      success: function() {
        alert('지점장 거부가 완료되었습니다');
        location.reload();
      },
      error: function(error) {
        alert('오류가 발생했습니다:' + error);
      }
    });

  }
</script>
</body>
</html>
