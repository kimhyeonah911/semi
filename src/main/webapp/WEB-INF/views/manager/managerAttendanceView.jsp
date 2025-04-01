<%--지점장 출퇴근 페이지--%>
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
            margin-top: 130px;
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
            font-size: 20px;
            margin-right: 20px;
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
            font-size: 18px;
            color: black;
            text-align: center;
        }
        .table-container>table>thead{
            height: 40px;
        }

    </style>
</head>
<body>

<jsp:include page="../common/header-manager.jsp" />
<div class="container-fluid">
<jsp:include page="../common/sidebar-manager.jsp"/>
<main>

    <div class="pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">근태관리</h1>
    </div>


    <form action="">
        <div id="search-bar">
            <select id="name-search-bar">
                <option>전체</option>
                <option>박지민</option>
                <option>황동준</option>
                <option>김현아</option>
                <option>이주찬</option>
            </select>
            <input type="date" id="start-date"> <span id="wave"> ~ </span>
            <input type="date" id="end-date">
            <button type="submit" id="submit-btn">조회</button>
        </div>
    </form>

    <div class="table-container">
        <table class="table table-striped table-hover align-middle">
            <thead>
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>이름</th>
                <th>출근상태</th>
                <th>출근시각</th>
                <th>퇴근시각</th>
                <th>근무시간</th>
                <th>수정</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>4</td>
                <td>2025-03-19</td>
                <td>박지민</td>
                <td><span class="badge bg-secondary">퇴근</span></td>
                <td>08 : 50 : 56</td>
                <td>             </td>
                <td>06 : 08 : 53 </td>
                <td><button type="button" class="btn btn-outline-primary btn-sm">수정</button></td>
            </tr>
            <tr>
                <td>3</td>
                <td>2025-03-19</td>
                <td>이주찬</td>
                <td><span class="badge bg-success bg-">출근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53</td>
                <td><button type="button" class="btn btn-outline-primary btn-sm">수정</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>2025-03-19</td>
                <td>김현아</td>
                <td><span class="badge bg-secondary">퇴근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53</td>
                <td><button type="button" class="btn btn-outline-primary btn-sm">수정</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>2025-03-19</td>
                <td>황동준</td>
                <td><span class="badge bg-success bg-">출근</span></td>
                <td>08 : 50 : 56</td>
                <td>15 : 02 : 06</td>
                <td>06 : 08 : 53</td>
                <td><button type="button" class="btn btn-outline-primary btn-sm">수정</button></td>
            </tr>

            </tbody>
        </table>
        <div class="pagebar-container mt-3">
            <jsp:include page="../common/pagebar.jsp"/>
        </div>

    </div>
</main>
</div>

</body>
</html>