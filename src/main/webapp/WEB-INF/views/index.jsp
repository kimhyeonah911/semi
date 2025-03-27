<<<<<<< HEAD
<<<<<<< HEAD
=======
<%--
  Created by IntelliJ IDEA.
  User: hyeij
  Date: 25. 3. 26.
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
>>>>>>> parent of d36f846 (커밋 1)
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br><br>
<html>

<head>
<<<<<<< HEAD
    <style>
        /* <!-- 헤더 스타일--> */
        div {
            box-sizing: border-box;
        }

        .header {
            width: 1400px;
            height: 177.37px;
            position: relative;
            /* margin: auto; */
            margin-top: 10px;
            /* border: 1px solid black; */
        }

        .header-1 {
            width: 314.05px;
            height: 177.37px;
            left: 0px;
            top: 0px;
            position: absolute;
        }

        .header-2>div:nth-child(1) {
            width: 174px;
            height: 59.12px;
            left: 314px;
            top: 95px;
            position: absolute;
            color: #005F5B;
            font-size: 43px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 700;
            word-wrap: break-word;
        }

        .header-2>div:nth-child(2) {
            width: 174px;
            height: 0px;
            left: 314px;
            top: 156px;
            position: absolute;
            outline: 3px #005F5B solid;
            outline-offset: -1.50px;
        }

        .header-3>img {
            width: 29.62px;
            height: 29.62px;
            /*left: 1179.16px;
    top: 8.52px;
    position: absolute;*/
        }

        .header-3>div {
            width: 70.26px;
            height: 17.33px;

            color: black;
            font-size: 13px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        .header-3 {
            display: flex;
            flex-direction: column;
            align-items: center;
            right: 200px;
            top: 9px;
            position: absolute;

        }

        .header-4>img {
            width: 29.62px;
            height: 29.62px;
            /*left: 1284.38px;
    top: 38.14px;
    position: absolute;*/
            transform: rotate(180deg);
            /*transform-origin: top left;*/
        }

        .header-4>div {
            width: 55.51px;
            height: 19.30px;
            color: black;
            font-size: 13px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        .header-4 {
            display: flex;
            flex-direction: column;
            align-items: center;
            right: 140px;
            top: 9px;
            position: absolute;
        }

        .header-5 {
            width: 151.46px;
            height: 80.79px;
            right: 0px;
            top: 8.68px;
            position: absolute;
            text-align: right;
            color: black;
            font-size: 24px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        /* <!-- 사이드바 스타일--> */
        .side {
            width: 231.26px;
            height: 679.21px;
            position: relative;
            border-radius: 15px;
            background: #FFC9A5;
            /* border: 1px solid black; */
        }

        .menu-item {
            width: 160.03px;
            height: 46.65px;
            position: absolute;
            font-size: 30px;
            font-family: Arial;
            font-weight: 700;
            word-wrap: break-word;
            color: #005F5B;
            left: 33px;

        }

        /* 마우스를 올렸을 때 호버 */
        .menu-item:hover {
            color: #00A69F;
        }

        .menu-item.highlight {
            color: #00A69F;
        }

        /* <!-- 컨텐츠 스타일--> */
        .container {
            width: 1143px;
            height: 619px;
            background-color: rgba(255, 201, 165, 0.44);
            border-radius: 15px;
            position: absolute;
            top: 240px;
            left: 260px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .label {
            width: 100%;
            height: 67px;
            background: #FFC9A5;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            font-size: 30px;
            font-family: "IBM Plex Sans KR", sans-serif;
            font-weight: 1000;
            color: black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            font-family: "IBM Plex Sans KR";
            font-size: 20px;
            font-weight: 400;
        }

        th {
            background: #FFC9A5;
            font-weight: bold;
        }

        .dropdown {
            width: 70px;
            height: 35px;
            font-size: 13px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #fff;
            margin-left: 10px;
        }



        /* <!-- 푸터 스타일--> */
        #footer {
            width: 1400px;
            height: 177.37px;

            margin-top: 50px;
        }

        #footer-1 {
            width: 100%;
            height: 40px;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #footer-2 {
            width: 100%;
            height: calc(100% - 40px);
            display: flex;
            justify-content: center;
        }

        #footer-1,
        #footer-2 {
            padding-left: 50px;
        }

        #footer-1>a {
            text-decoration: none;
            font-weight: 600;
            margin: 10px;
            line-height: 40px;
            color: black;
        }

        #footer-2>p {
            margin: 0;
            padding-top: 0px;
            font-size: 13px;
        }

        #p2 {
            text-align: center;
        }

        /* .Rectangle33 svg {
    width: 1143px;
    height: 619px;
}

.Rectangle33 path {
    fill: #FFC9A5;
    fill-opacity: 0.44;
} */
    </style>
    <title>Title</title>

<body>
<!-- 인클루드 헤더-->
<div class="header">
    <img class="header-1" src="\resources\logo\logo.png" />

    <div class="header-2">
        <div>매출현황</div>
        <div></div>
    </div>

    <div class="header-3">
        <img src="/resources/logo/mypage.png" />
        <div>마이페이지</div>
    </div>

    <div class="header-4">
        <img src="/resources/logo/logout.png" />
        <div>로그아웃</div>
    </div>
    <!-- 관리자명 로그인한 계정의 이름으로 바뀌게 설정(본사는 상관없을듯)-->
    <div class="header-5">admin 님 <br />환영합니다.</div>
</div>
<!-- 인클루드 사이드-->
<div class="side">
    <div class="menu-item " style="top: 42px;">대시보드</div>
    <div class="menu-item" style="top: 123px;">제품 관리</div>
    <div class="menu-item highlight" style="top: 204px;">매출 현황</div>
    <div class="menu-item " style="top: 285px;">지점장 승인</div>
    <div class="menu-item " style="top: 366px;">직원 승인</div>
    <div class="menu-item" style="top: 447px;">입고처 관리</div>
    <div class="menu-item" style="top: 528px;">직원 정보</div>
    <div class="menu-item" style="top: 609px;">공지사항</div>
</div>
<!-- 인클루드 콘텐트-->
<div class="content">
    <div class="Group50">
        <!-- 라벨을 정의 -->
        <div class="container">
            <div class="label">💰 지점별 매출 현황
                <select class="dropdown">
                    <option value="1월">1월</option>
                    <option value="2월">2월</option>
                    <option value="3월">3월</option>
                    <option value="4월">4월</option>
                    <option value="5월">5월</option>
                    <option value="6월">6월</option>
                    <option value="7월">7월</option>
                    <option value="8월">8월</option>
                    <option value="9월">9월</option>
                    <option value="10월">10월</option>
                    <option value="11월">11월</option>
                    <option value="12월">12월</option>
                </select>
            </div>
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>지점명</th>
                    <th>기간</th>
                    <th>매출액</th>
                    <th>직원수</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>역삼점</td>
                    <td>02-01~02-28</td>
                    <td>36,254,740</td>
                    <td>7명</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>강남점</td>
                    <td>02-01~02-28</td>
                    <td>42,500,300</td>
                    <td>8명</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>부산점</td>
                    <td>02-01~02-28</td>
                    <td>29,100,400</td>
                    <td>6명</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- 인클루드 푸터-->
        <div id="footer">
            <div id="footer-1">
                <a href="#">회사 소개</a> |
                <a href="#">이용약관</a> |
                <a href="#">개인정보취급방침</a> |
                <a href="#">고객센터</a>
            </div>

            <div id="footer-2">
                <p id="p1">
                    Copyright2025. CoreERP Co. All rights reserved.
                </p>
            </div>
        </div>
</body>
</head>

</html>
=======
    <title>Title</title>
</head>
<body>
세미프로젝트 메인입니다.
메인 브랜치 커밋 테스트
</body>
</html>
>>>>>>> parent of d36f846 (커밋 1)
=======
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <style>
            /* 전체 페이지 스타일 */
            body {
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: white;
            }

            /* 전체 컨테이너 */
            .container {
                width: 100%;
                height: 100%;
                display: flex;
            }

            /* 왼쪽 영역 (배경 이미지) */
            .left {
                width: 65%;
                height: 100%;
                background: url('/resources/background.png') no-repeat center center;
                background-size: cover;
                filter: brightness(1.5);
            }

            /* 오른쪽 영역 (로그인 폼) */
            .right {
                width: 35%;
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                background: white;
            }

            /* 로고 */
            .logo {
                width: 200px;
                margin-bottom: 30px;
            }

            /* 입력 필드 공통 스타일 */
            .input-box {
                width: 80%;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgba(181, 0, 0, 0.3);
                display: flex;
                align-items: center;
                padding-left: 15px;
                font-size: 18px;
                color: #BABABA;
                margin-bottom: 15px;
                margin-left: 20px;
            }

            .input-box input {
                width: 100%;
                border: none;
                outline: none;
                font-size: 18px;
                padding-left: 10px;
            }

            /* 버튼 스타일 */
            .btn {
                width: 200px;
                height: 50px;
                border-radius: 10px;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
                cursor: pointer;
                border: none;
                margin-top: 10px;
            }

            /* 로그인 버튼 */
            .login-btn {
                background: #FFE3D0;
                color: #5A5A5A;
            }

            /* 회원가입 버튼 */
            .signup-btn {
                background: #FFE3D0;
                color: #5A5A5A;
            }

            /* 하단 연락처 */
            .contact-info {
                margin-top: 20px;
                font-size: 14px;
                color: #858585;
            }
            form{
                width:60%;
                display: block;
                text-align: center;
            }
            input[name="userId"] {
                background-image: url('/resources/id.png');
                background-repeat: no-repeat;
                background-position: 5px center;
                padding-left: 40px;
                background-size: 20px 20px;
            }
            input[name="password"] {
                background-image: url('/resources/password.png');
                background-repeat: no-repeat;
                background-position: 5px center;
                padding-left: 40px;
                background-size: 17px 20px;
            }
        </style>
    </head>
    <body>
    <div class="container">
        <!-- 왼쪽 (배경 이미지) -->
        <div class="left"></div>

        <!-- 오른쪽 (로그인 폼) -->
        <div class="right">
            <img class="logo" src="/resources/logo.png" alt="Logo">

            <form action="loginProcess.jsp" method="post">
                <div class="input-box">
                    <input type="text" name="userId" placeholder="ID" required>
                </div>

                <div class="input-box">
                    <input type="password" name="password" placeholder="PASSWORD" required>
                </div>

                <button type="submit" class="btn login-btn">LOGIN</button>
            </form>

            <form action="signup.jsp" method="get" class="member-enroll">
                <button type="submit" class="btn signup-btn">회원가입</button>
            </form>

            <div class="contact-info">CONTACT US 010-0000-1111</div>
        </div>
    </div>

    </body>
    </html>
>>>>>>> c59ce7954764c3025c0677bdc6bc9536af51f173
