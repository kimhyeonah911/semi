<%--본사 마이페이지--%>
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

        #title{
                display: flex;  /* Flexbox 적용 */
                justify-content: space-between;  /* 좌우 끝 정렬 */
                align-items: center;  /* 세로 중앙 정렬 */
                flex-wrap: nowrap;  /* 줄 바꿈 방지 (반응형 제거) */
                padding-top: 16px;  /* 위쪽 패딩 */
                padding-bottom: 8px;  /* 아래쪽 패딩 */
                margin-bottom: 16px;  /* 아래쪽 마진 */
                border-bottom: 1px solid #dee2e6;  /* 아래쪽 테두리 */
        }
        .info{
            display: flex;
            width: 100%;
            padding-left: 300px;
        }
        .myInfo{
            border-right: 1px solid black;
        }


        .myInfo, .workInfo{
            width : 500px;
            height: 600px;
            margin: 30px 0;
            position: relative;
        }

        #myInfo-title, #workInfo-title{
            padding: 10px;
            width: 100%;
        }
        #myInfo-title>h2, #workInfo-title>h2{
            margin: 20px;
            width: 200px;
        }
        #myInfo-content, #workInfo-content{
            width: 100%;
            height: calc(100% - 100px);
            display: flex;
            justify-content: center;
            font-size: 20px;
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
            width: 150px;
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

<jsp:include page="../common/header-admin.jsp" />


<%--<div class="container">--%>

    <jsp:include page="../common/sidebar-admin.jsp"/>

<%--    <div class="content">--%>
<main>
        <div id="title">
            <h1 class="h2">마이페이지</h1>
        </div>

        <div class="info">
            <div class="myInfo">
                <div id="myInfo-title">
                    <h2>내 정보</h2>
                </div>
                <div id="myInfo-content">
                    <table>
                        <tr>
                            <th id="myTh">이름 |</th>
                            <td>관리자 </td>
                        </tr>
                        <tr>
                            <th>아이디 |</th>
                            <td>admin </td>
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

            <div class="workInfo">
                <div id="workInfo-title">
                    <h2>근무 정보</h2>
                </div>
                <div id="workInfo-content">
                    <table>
                        <tr>
                            <th id="workTh">지점 |</th>
                            <td>본사</td>
                        </tr>
                        <tr>
                            <th>직급 |</th>
                            <td>관리자</td>
                        </tr>
                        <tr>
                            <th>본사 주소 |</th>
                            <td>서울특별시 강남구 테헤란로 123, 3층 (역삼동)</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
</main>
<%--        </div>--%>

<%--    </div>--%>


</body>
</html>
