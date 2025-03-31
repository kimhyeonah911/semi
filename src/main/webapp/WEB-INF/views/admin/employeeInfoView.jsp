<%--본사 직원정보 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>직원정보</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
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

<jsp:include page="../common/header-admin.jsp" />
<div class="container-fluid" style="margin-top: 130px">
  <div class="row">
    <!-- Sidebar -->
    <jsp:include page="../common/sidebar-admin.jsp"/>

    <!-- Main content -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
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
          <tr>
            <td>4</td>
            <td>2025-03-19</td>
            <td>황동준</td>
            <td>역삼점</td>
            <td>지점장</td>
            <td>010-1111-2222</td>
            <td>30,152,152</td>
          </tr>
          <tr>
            <td>4</td>
            <td>2025-03-19</td>
            <td>김현아</td>
            <td>역삼점</td>
            <td>직원</td>
            <td>010-1111-2222</td>
            <td>30,152,152</td>
          </tr>
          <tr>
            <td>4</td>
            <td>2025-03-19</td>
            <td>이주찬</td>
            <td>역삼점</td>
            <td>직원</td>
            <td>010-1111-2222</td>
            <td>30,152,152</td>
          </tr>
          <tr>
            <td>4</td>
            <td>2025-03-19</td>
            <td>박지민</td>
            <td>역삼점</td>
            <td>직원</td>
            <td>010-1111-2222</td>
            <td>30,152,152</td>
          </tr>
          </tbody>
        </table>
      </div>

      <div class="pagination">
        <a href="#" class="disabled">이전</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">다음</a>
      </div>
    </main>
  </div>
</div>

</body>
</html>