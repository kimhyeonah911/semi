<%--본사 직원정보 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <select id="storeSelect" class="form-select w-auto me-2">
          <option value="전체">전체</option>
          <c:forEach var="store" items="${storeList}">
            <option value="${store}">${store}</option>
          </c:forEach>
        </select>
        <button type="button" id="filterBtn" class="btn btn-dark">조회</button>
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
        <tbody id="employeeTable">
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

    <c:if test="${pi.maxPage > 1}">
      <div class="pagination">
        <!-- 이전 버튼 -->
        <c:choose>
          <c:when test="${pi.currentPage == 1}">
            <a href="#" class="disabled">이전</a>
          </c:when>
          <c:otherwise>
            <a href="${pageUrl}?cpage=${pi.currentPage - 1}">이전</a>
          </c:otherwise>
        </c:choose>

        <!-- 숫자 버튼 -->
        <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
          <c:choose>
            <c:when test="${i == pi.currentPage}">
              <a href="#" class="active">${i}</a>
            </c:when>
            <c:otherwise>
              <a href="${pageUrl}?cpage=${i}">${i}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <!-- 다음 버튼 -->
        <c:choose>
          <c:when test="${pi.currentPage == pi.maxPage}">
            <a href="#" class="disabled">다음</a>
          </c:when>
          <c:otherwise>
            <a href="${pageUrl}?cpage=${pi.currentPage + 1}">다음</a>
          </c:otherwise>
        </c:choose>
      </div>
    </c:if>

  </main>
</div>
<script>
  $(document).ready(function () {
    $("#filterBtn").click(function () {
      let selectedStore = $("#storeSelect").val(); // 선택한 지점 가져오기

      $.ajax({
        url: "employeeList", // 컨트롤러에서 처리할 엔드포인트
        type: "GET",
        data: { store: selectedStore },
        dataType: "json", // JSON 응답 받기
        success: function (response) {
          let tbody = $("#employeeTable");
          tbody.empty(); // 기존 데이터 삭제

          if (response.length === 0) {
            tbody.append("<tr><td colspan='7' class='text-center'>해당 지점에 직원이 없습니다.</td></tr>");
          } else {
            response.forEach(m => {
              let row = `<tr>
                            <td>\${m.empNo}</td>
                            <td>\${m.hireDate}</td>
                            <td>\${m.memName}</td>
                            <td>\${m.storeName}</td>
                            <td>\${m.position}</td>
                            <td>\${m.phone}</td>
                            <td>\${m.salary}</td>
                        </tr>`;
              tbody.append(row);
              console.log("선택한 지점: ", selectedStore);
            });
          }
        },
        error: function () {
          console.log("직원 필터링 실패");
          alert("직원 목록을 불러오지 못했습니다.");
        }
      });
    });
  });
</script>


</body>
</html>