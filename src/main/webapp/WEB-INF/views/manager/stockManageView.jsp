<%--지점장 재고관리 재고/입출고  페이지--%>
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

    #storage-select-bar {
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
      /*height: 35px;*/
      /*font-size: 22px;*/
      /*border-radius: 8px;*/
      /*cursor: pointer;*/
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
      font-size: 16px;
      color: black;
      text-align: center;
    }

  </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
<jsp:include page="../common/sidebar.jsp"/>


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
      <select id="storage-select-bar">
          <%--창고명 옵션--%>
      </select>
      <input type="text" placeholder="상품명" id="product-search-bar">
      <button class="btn btn-primary" type="submit" id="inventory-search-btn" onclick="inventorySearch()">조회</button>
    </div>

    <!-- 입출고 관련 옵션 (날짜 범위) -->
    <div id="inout-search" class="search-fields" style="display: none;">
      <input type="date" id="start-date"> <span id="wave"> ~ </span>
      <input type="date" id="end-date">
      <button class="btn btn-primary" type="submit" id="stockInOut-search-btn" onclick="stockInOutSearch">조회</button>
    </div>

  </div>


  <%--재고페이지--%>

  <div id="inventory-section">
    <div class="table-container">
      <table class="table table-striped table-hover align-middle">
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
        <tbody id="inventory-list">
          <%-- 재고 리스트 --%>
        </tbody>
      </table>
      <div class="pagebar-container mt-3">
        <jsp:include page="../common/pagebar.jsp"/>
      </div>
    </div>
  </div>

  <!-- 입출고 페이지 -->

  <div id="inout-section" style="display: none;">
    <div class="table-container">
      <table class="table table-striped table-hover align-middle">
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
          <td><span class="badge bg-primary">입고</span></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><span class="badge bg-danger">출고</span></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><span class="badge bg-primary">입고</span></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        <tr>
          <td><span class="badge bg-danger">출고</span></td>
          <td>238-654-13</td>
          <td>나이키 에어포스 1 '07</td>
          <td>2765-5469</td>
          <td>2025-03-24</td>
          <td>3</td>
        </tr>
        </tbody>
      </table>
      <div class="pagebar-container mt-3">
        <jsp:include page="../common/pagebar.jsp"/>
      </div>
    </div>
  </div>
</main>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

  //창고명 셀렉트바 불러오기
    $(document).ready(function(){
      getStorageList(drawStorageList);
    });

    function getStorageList(callback){
      $.ajax({
        url: "/api/getStorageList",
        type: "GET",
        success : function (res){
          console.log(res);
          callback(res);
        }, error: function(){
          console.log("storage list ajax 요청 실패");
        }
      })
    }

    function drawStorageList(res){
      //창고 셀렉트 바
      const storageSelectBar = document.getElementById("storage-select-bar")
      storageSelectBar.innerHTML = "";

      //placeholder 역할 기본 옵션
      const placeholderOption = document.createElement("option");
      placeholderOption.value = "";
      placeholderOption.innerText = "전체창고";
      storageSelectBar.appendChild(placeholderOption);

      //data(res) option에 추가
      res.forEach(storage => {
        const option = document.createElement("option");
        option.value = storage.storageNo;
        option.innerText = storage.storageLocation;
        storageSelectBar.appendChild(option);
      });
    }

  // 재고 리스트 불러오기
  $(document).ready(function(){

    console.log("재고리스트")
    $.ajax({
      url : '/api/getInventoryList',
      method: 'GET',
      success : function(res){
        console.log(res)
        let tbodyContent = '';
        res.forEach(function(i){
          tbodyContent +=
                  "<tr class='inventory-tr'>" +
                  "<td class='td-storageName'>" + i.storageLocation + "</td>" +
                  "<td class='td-productNo'>" + i.productNo + "</td>" +
                  "<td class='td-productName'>" + i.productName + "</td>" +
                  "<td class='td-categoryName'>" + i.categoryName + "</td>" +
                  "<td class='td-color'>" + i.color + "</td>" +
                  "<td class='td-productSize'>" + i.productSize + "</td>" +
                  "<td class='td-quantity'>" + i.quantity + "</td>" +
                  "</tr>";
        })
        $('#inventory-list').html(tbodyContent);
      },

      error : function (error) {
        console.error('데이터를 불러오는데 실패했습니다: ', error);
        alert('데이터를 불러오는데 실패했습니다 : ' + error);
      }
    });
  });

    //재고 리스트 - 창고 셀렉트 , 상품명 검색
    function inventorySearch(){
      const storageNo = document.getElementById("storage-select-bar").value;
      const keyword = document.getElementById("product-search-bar").value.trim();

      $.ajax({
        url : '/api/searchInventoryList',
        method: 'GET',
        data: {
          selectedStorageNo: storageNo,
          searchedKeyword: keyword
      },
        success: function (data){
          const tableBody = $('#inventory-list');
          tableBody.empty();

          let tbodyContent= "";

          if(data.length === 0){
            tbodyContent = '<tr><td colspan="9" class="text-center">조회 결과가 없습니다.</td></tr>';
          } else {
            data.forEach(function(i){
              tbodyContent +=
                      "<tr class='inventory-tr'>" +
                      "<td class='td-storageName'>" + i.storageLocation + "</td>" +
                      "<td class='td-productNo'>" + i.productNo + "</td>" +
                      "<td class='td-productName'>" + i.productName + "</td>" +
                      "<td class='td-categoryName'>" + i.categoryName + "</td>" +
                      "<td class='td-color'>" + i.color + "</td>" +
                      "<td class='td-productSize'>" + i.productSize + "</td>" +
                      "<td class='td-quantity'>" + i.quantity + "</td>" +
                      "</tr>";
            });
          }
          $('#inventory-list').html(tbodyContent);

          $('#storage-select-bar').value(storageNo);
          $('#product-search-bar').value(keyword);


        },
        error: function(error){
          console.error('상품을 검색하는데 실패했습니다:', error);
          alert('상품을 검색하는데 실패했습니다');
        }
      });
    }

    //입출고리스트 불러오기


</script>
</body>
</html>
