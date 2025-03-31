<%-- 지점장 재고관리 페이지 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>재고 관리</title>
    <style>
        main {
            margin-left: 250px;
            width: 80%;
            padding-left: 24px;
            margin-top: 130px;
        }
        .pagination {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }
        select {
            border-radius: 8px;
        }
        #search-bar {
            display: flex;
        }
        #option-search-bar {
            width: 90px;
            height: 35px;
            font-size: 22px;
            margin-right: 20px;
        }
        .table-container {
            width: 100%;
        }
        .table-container>table {
            width: 100%;
            font-size: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header-manager.jsp" />
<jsp:include page="../common/sidebar-manager.jsp"/>

<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">재고관리</h1>
    </div>

    <form>
        <div id="search-bar">
            <select id="option-search-bar">
                <option value="inventory">재고</option>
                <option value="inout">입출고</option>
            </select>
        </div>
    </form>


    <!-- 재고 페이지 -->
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
                    <td>238-654-13</td>
                    <td>나이키 에어포스 1 '07</td>
                    <td>운동화</td>
                    <td>WHITE</td>
                    <td>230</td>
                    <td>20</td>
                </tr>
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
                    <td>238-654-13</td>
                    <td>나이키 에어포스 1 '07</td>
                    <td>운동화</td>
                    <td>WHITE</td>
                    <td>230</td>
                    <td>20</td>
                </tr>
                </tbody>
            </table>
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
        </div>
    </div>
</main>

<script>
    document.getElementById("option-search-bar").addEventListener("change", function () {
        const selectedValue = this.value;
        document.getElementById("inventory-section").style.display = selectedValue === "inventory" ? "block" : "none";
        document.getElementById("inout-section").style.display = selectedValue === "inout" ? "block" : "none";
    });
</script>
</body>
</html>
