<%--본사 직원정보 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>직원정보</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    main{
      margin-left: 250px;  /* ms-sm-auto */
      width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
      padding-left: 24px;  /* px-md-4 */
      margin-top: 130px;
    }

    body {
      font-family: "IBM Plex Sans KR", sans-serif;
      overflow-x: hidden;
    }

    .table th, .table td {
      text-align: center;
      vertical-align: middle;
      padding: 6px;
    }

    .table th {
      background-color: #FFC9A5;
      font-weight: bold;
    }

    .table td {
      border-bottom: 1px solid #ccc;
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

    .main-content {
      padding-left: 2rem;
      padding-right: 2rem;
    }
  </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="container-fluid">
  <!-- Sidebar -->
  <jsp:include page="../common/sidebar.jsp"/>

  <!-- Main content -->
  <main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">직원정보</h1>
    </div>

    <form action="">
      <div id="search-bar" class="d-flex mb-3">
        <select id="name-search-bar" class="form-select w-auto me-2">
          <option>전체</option>
          <option>역삼점</option>
          <option>한남점</option>
          <option>잠실점</option>
          <option>강남점</option>
          <option>송파점</option>
        </select>
        <button type="submit" class="btn btn-dark">조회</button>
      </div>
    </form>

    <div class="table-responsive">
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>번호</th>
          <th>입사 날짜</th>
          <th>이름</th>
          <th>지점명</th>
          <th>직급</th>
          <th>연락처</th>
          <th>연봉</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="m" items="${member}">
          <tr>
            <td>${m.empNo}</td>
            <td><fmt:formatDate value="${m.hireDate}" pattern="yyyy-MM-dd" /></td>
            <td>${m.memName}</td>
            <td>${m.storeName}</td>
            <td>${m.position}</td>
            <td>${m.phone}</td>
            <td>${m.salary}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="pagebar-container mt-3">
      <jsp:include page="../common/pagebar.jsp"/>
    </div>
  </main>
</div>

</body>
</html>