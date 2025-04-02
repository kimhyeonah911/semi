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

    .table {
      margin-top: 10px;
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      font-size: 18px;
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
<jsp:include page="../common/header-admin.jsp"/>
<div class="container-fluid">
  <!-- Sidebar -->
  <jsp:include page="../common/sidebar-admin.jsp"/>
  <!-- Main content -->
  <main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">직원승인</h1>
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
        <c:forEach var="member" items="${pendingEmployees}">
          <tr>
            <td>${member.empNo}</td>
            <td>${member.createDate}</td>
            <td>${member.memId}</td>
            <td>${member.memName}</td>
            <td>${member.phone}</td>
            <td>
              <select class="dropdown">
                <option value="강남점">강남점</option>
                <option value="부산점">부산점</option>
                <option value="대구점">대구점</option>
              </select>
            </td>
            <td class="action-buttons">
              <button class="approve-btn btn btn-success" onclick="approveUser(${member.empNo})">승인</button>
              <button class="reject-btn btn btn-danger" onclick="rejectUser(${member.empNo})">거부</button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</div>


<!-- Bootstrap JS (이 부분은 별도로 로드) -->
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>--%>

<script>
  function approveUser(userId) {
    alert("User " + userId + "님을 직원으로 승인하셨습니다.");
  }

  function rejectUser(userId) {
    alert("User " + userId + "님을 거부하셨습니다.");
  }
</script>


</body>
</html>