<%--본사 직원정보 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <style>

    main{
      margin-left: 250px;  /* ms-sm-auto */
      /*margin-right: auto;*/
      width: 86%;  /* col-lg-10 (10/12 * 100%) */
      padding-left: 24px;  /* px-md-4 */
      /*padding-right: 24px;*/
      margin-top: 130px;
    }

    .pagination{
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }
    select{
      border-radius: 8px;
    }
    #search-bar{
      display: flex;
    }
    #name-search-bar {
      width: 120px;
      height: 35px;
      font-size: 22px;
      margin-right: 20px;
    }
    #submit-btn{
      width: 80px;
      height: 35px;
      font-size: 22px;
      border-radius: 8px;
      margin:0;
      padding: 0;
      cursor: pointer;
    }

    .table-container{
      width: 100%;
    }
    .table-container>table{
      width: 100%;
      font-size: 20px;
      color: black;
      text-align: center;
    }
    .table-container>table>thead{
      height: 40px;
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


  </style>
</head>
<body>

<jsp:include page="../common/header-admin.jsp" />
<jsp:include page="../common/sidebar-admin.jsp"/>


<main>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">직원정보</h1>
    </div>

    <form action="">
      <div id="search-bar">
        <select id="name-search-bar">
          <option>전체</option>
          <option>역삼점</option>
          <option>한남점</option>
          <option>잠실점</option>
          <option>강남점</option>
          <option>송파점</option>
        </select>
        <button type="submit" id="submit-btn">조회</button>
      </div>
    </form>

    <div class="table-container">
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
      <div class="pagebar-container mt-3">
        <jsp:include page="../common/pagebar.jsp"/>
      </div>
    </div>
</main>

</body>
</html>