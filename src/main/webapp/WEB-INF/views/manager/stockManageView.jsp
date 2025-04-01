<%--지점장 재고관리 재고 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

  <style>
    main{
      margin-left: 250px;  /* ms-sm-auto */
      /*margin-right: auto;*/
      width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
      padding-left: 24px;  /* px-md-4 */
      /*padding-right: 24px;*/
      padding-top: 130px;
    }

    .pagination{
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }
    select{
      border-radius: 8px;
    }

    #search-bar {
      display: flex;
      align-items: center; /* 수평 정렬 */
      justify-content: flex-start; /* 왼쪽으로 배치 */
    }

    #search-option-bar{
      width: 90px;
      height: 35px;
      font-size: 22px;
      margin-right: 20px; /* 각 요소 간 간격 */
    }

    #storage-search-bar {
      width: 120px;
      height: 35px;
      font-size: 22px;
      margin-right: 20px;
    }

    #product-search-bar {
      width: 300px;
      height: 35px;
      padding: 5px;
      margin-right: 10px;
      font-size: 22px;
      border-radius: 8px;
    }

    #submit-btn {
      width: 80px;
      height: 35px;
      font-size: 22px;
      border-radius: 8px;
      cursor: pointer;
    }

    input[type="date"]{
      font-size: 20px;
      height: 35px;
      font-weight: 500;
    }
    #start-date{
      margin-right: 10px;
    }
    #wave{
      font-size: 24px;
      font-weight: 500;
    }
    #end-date{
      margin-left: 10px;
      margin-right: 10px;
    }

    .table-container{
      width: 100%;
      position:relative;
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

<jsp:include page="../common/header-manager.jsp" />
<div class="container-fluid">
<jsp:include page="../common/sidebar-manager.jsp"/>


<main>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">재고관리</h1>
  </div>

  <!-- 재고/입출고 선택 -->
  <div id="search-bar">
    <select id="search-option-bar">
      <option value="inventory">재고</option>
      <option value="inout">입출고</option>
    </select>

    <!-- 재고 관련 옵션 (창고명, 상품명 검색) -->
    <div id="inventory-search" class="search-fields">
      <select id="storage-search-bar">
        <option>창고명</option>
        <option>A창고</option>
        <option>B창고</option>
        <option>C창고</option>
      </select>
      <input type="text" placeholder="상품명" id="product-search-bar">
    </div>

    <!-- 입출고 관련 옵션 (날짜 범위) -->
    <div id="inout-search" class="search-fields" style="display: none;">
      <input type="date" id="start-date"> <span id="wave"> ~ </span>
      <input type="date" id="end-date">
    </div>

    <button type="submit" id="submit-btn">조회</button>
  </div>


  <%--재고페이지--%>

  <div id="inventory-section">
    <div class="table-container">
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>창고명</th>
          <th>상품번호</th>
          <th>상품명</th>
          <th>카테고리</th>
          <th>색상</th>
          <th>사이즈</th>
          <th>재고수량</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>A</td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>운동화</td>
          <td>WHITE</td>
          <td>230</td>
          <td>20</td>
        </tr>
        <tr>
          <td>A</td>
          <td>238-654-14</td>
          <td>나이키 에어포스 1 '07</td>
          <td>운동화</td>
          <td>BLACK</td>
          <td>250</td>
          <td>14</td>
        </tr>
        <tr>
          <td>B</td>
          <td>238-623-14</td>
          <td>아디다스 슈퍼스타</td>
          <td>운동화</td>
          <td>PINK</td>
          <td>250</td>
          <td>30</td>
        </tr>
        <tr>
          <td>C</td>
          <td>218-643-86</td>
          <td>어그 클래식 샌들</td>
          <td>샌들</td>
          <td>BROWN</td>
          <td>220</td>
          <td>15</td>
        </tr>
        </tbody>
      </table>
      <div class="pagination">
        <a href="#" class="disabled">이전</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">다음</a>
      </div>
    </div>
  </div>

  <!-- 입출고 페이지 -->

  <div id="inout-section" style="display: none;">
    <div class="table-container">
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>입고/출고</th>
          <th>상품번호</th>
          <th>상품명</th>
          <th>지시번호</th>
          <th>일자</th>
          <th>수량</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><img src="/resources/입고.png"></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><img src="/resources/출고.png"></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><img src="/resources/입고.png"></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><img src="/resources/출고.png"></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        </tbody>
      </table>
      <div class="pagination">
        <a href="#" class="disabled">이전</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">다음</a>
      </div>
    </div>
  </div>
</main>
</div>

<script>
  // 재고/입출고 선택 시 섹션 전환 및 필드 표시 전환
  document.getElementById("search-option-bar").addEventListener("change", function () {
    const selectedValue = this.value;

    // 선택된 값에 따라 섹션 및 필드 전환
    if (selectedValue === "inventory") {
      document.getElementById("inventory-section").style.display = "block";
      document.getElementById("inout-section").style.display = "none";
      document.getElementById("inventory-search").style.display = "flex";
      document.getElementById("inout-search").style.display = "none";
    } else if (selectedValue === "inout") {
      document.getElementById("inventory-section").style.display = "none";
      document.getElementById("inout-section").style.display = "block";
      document.getElementById("inventory-search").style.display = "none";
      document.getElementById("inout-search").style.display = "flex";
    }
  });
</script>
</body>
</html>
