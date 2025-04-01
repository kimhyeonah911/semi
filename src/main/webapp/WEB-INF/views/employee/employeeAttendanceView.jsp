<%--직원 출퇴근 페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>
  <style>

    main{
      margin-left: 250px;  /* ms-sm-auto */
      /*margin-right: auto;*/
      width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
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

        #search-bar>img{
            width: 100px;
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

<jsp:include page="../common/header-employee.jsp" />
<div class="container-fluid">
<jsp:include page="../common/sidebar-employee.jsp"/>

<main>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">근태관리</h1>
    </div>



    <div class="table-container">
        <table class="table table-striped table align-middle">
            <thead>
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>출근상태</th>
                <th>출근시각</th>
                <th>퇴근시각</th>
                <th>근무시간</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>4</td>
                <td>2025-03-31</td>
                <td><span class="badge bg-success bg-">출근</span></td>
                <td>08 : 50 : 56</td>
                <td></td>
                <td>06 : 08 : 53 </td>
            </tr>
            <tr>
                <td>4</td>
                <td>2025-03-19</td>
                <td><span class="badge bg-secondary">퇴근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53 </td>
            </tr>
            <tr>
                <td>4</td>
                <td>2025-03-19</td>
                <td><span class="badge bg-secondary">퇴근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53 </td>
            </tr>
            <tr>
                <td>4</td>
                <td>2025-03-19</td>
                <td><span class="badge bg-secondary">퇴근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53 </td>
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
</div>


</body>
</html>