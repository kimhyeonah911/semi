<%--지점장 재고관리 재고 페이지--%>
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
    #option-search-bar {
      width: 90px;
      height: 35px;
      font-size: 22px;
      margin-right: 20px;
    }
    #storage-search-bar{
      width: 120px;
      height: 35px;
      font-size: 22px;
      margin-right: 20px;
    }
    #product-search-bar{
      width: 300px;
      height: 35px;
      margin:0;
      padding: 5px;
      margin-right: 10px;
      font-size: 22px;
      border-radius: 8px;
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
      height: calc(100% - 53px);
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

<jsp:include page="../common/header.jsp" />


<%--<div class="container">--%>

  <jsp:include page="../common/sidebar.jsp"/>

<%--  <div class="inventory-management">--%>

<main>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">재고관리</h1>
    </div>


    <form action="">
      <div id="search-bar">
        <select id="option-search-bar">
          <option>재고</option>
          <option>입출고</option>
        </select>
        <select id="storage-search-bar">
          <option>창고명</option>
          <option>A창고</option>
          <option>B창고</option>
          <option>C창고</option>
        </select>
        <input type="text" placeholder="상품명" id="product-search-bar">
        <button type="submit" id="submit-btn">조회</button>
      </div>
    </form>

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
</main>
<%--  </div>--%>
<%--</div>--%>


</body>
</html>