<%--지점장/직원 마이페이지--%>
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

        .content{
            display: flex;
            width: 100%;
            margin-left:0;
        }
        .card1{
            width: 50%;
        }
        .card2{
            width: 50%;
        }
        #myInfo-title, #workInfo-title{
            padding: 10px;
            width: 100%;
        }
        #myInfo-title>h2, #workInfo-title>h2 {
            margin: 20px;
            width: 200px;
        }

        #myInfo-content>table, #workInfo-content>table{
            width: 80%;
            height: calc(100% - 100px);
            text-align: left;
            font-size: 20px;
        }
        #myInfo-content>table{
            transform: translateX(10%);
        }
        #workInfo-content>table{
            transform: translateX(10%);
        }
        #myTh{
            width: 150px;
        }
        #workTh{
            width: 100px;
        }
        input{
            border-radius: 10px;
            width: 80%;
            height: 30px;
            margin: 0;
            padding: 5px;
            font-size: 20px;
        }

        #update-info-btn{
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            cursor: pointer;
        }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />


<%--<div class="container">--%>

    <jsp:include page="../common/sidebar.jsp"/>

<%--    <div class="content">--%>
<main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">마이페이지</h1>
        </div>

<div class="content">
    <div class="card card1">
        <div class="card-body">
            <div id="myInfo-title">
                <h2>내 정보</h2>
            </div>
                <table>
                    <tr>
                        <th id="myTh">이름 |</th>
                        <td>김현아 </td>
                    </tr>
                    <tr>
                        <th>아이디 |</th>
                        <td>user100 </td>
                    </tr>
                    <tr>
                        <th>비밀번호 |</th>
                        <td><input type="password"></td>
                    </tr>
                    <tr>
                        <th id="pwd">비밀번호 확인 |</th>
                        <td><input type="password"></td>
                    </tr>
                    <tr>
                        <th>전화번호 |</th>
                        <td><input type="text" value="010-1234-5678(유저전화번호)"> </td>
                    </tr>
                </table>
                <img id="update-info-btn" src="/assets/icons/update-info.png">
        </div>
    </div>

    <br>

    <div class="card card2">
        <div class="card-body">
            <div id="workInfo-title">
                <h2>근무 정보</h2>
            </div>
            <div id="workInfo-content">
                <table>
                    <tr>
                        <th id="workTh">지점 |</th>
                        <td>지점장/직원 </td>
                    </tr>
                    <tr>
                        <th>입사일 |</th>
                        <td>2018 - 08 - 03 </td>
                    </tr>
                    <tr>
                        <th>근속일수 |</th>
                        <td> + 488일</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</main>
<%--        </div>--%>

<%--    </div>--%>


</body>
</html>