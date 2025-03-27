<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <title>Title</title>
    <style>
        div { box-sizing: border-box; }

        .header {
            width: 1322.39px;
            height: 177.37px;
            position: relative;
            margin: auto;
            margin-top: 10px;
        }

        .header-1 {
            width: 314.05px;
            height: 177.37px;
            left: -40px;
            top: 0px;
            position: absolute;
        }

        .header-2>div:nth-child(1) {
            width: 201.54px;
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
            width: 161.28px;
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
        }

        .header-3>div {
            width: 70.26px;
            height: 17.33px;
            color: black;
            font-size: 15px;
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
            transform: rotate(180deg);
        }

        .header-4>div {
            width: 55.51px;
            height: 19.30px;
            color: black;
            font-size: 15px;
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
            right: -20px;
            top: 8.68px;
            position: absolute;
            text-align: center;
            color: black;
            font-size: 24px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        /* 출근/퇴근 버튼 스타일 */
        .attendance {
            width: 150px;
            height: 40px;
            margin-top: 20px; /* 버튼과 상단 요소 사이에 공간을 추가 */
            margin-right: 0px;
            border-radius: 15px;
            background: #09B800;
            font-size: 20px;
            color: white;
            font-weight: bold;
            border: 0.5px solid black;
            cursor: pointer;
        }

        .attendance:hover{
            background: #70D96B;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* 출근/퇴근 버튼 위치를 헤더 아래에 추가 */
        .header-6 {
            position: absolute;
            right: 20px; /* 버튼의 위치를 오른쪽으로 좀 더 맞추기 */
            bottom: 20px; /* 하단에 위치 */
        }
    </style>
</head>
<body>
<div class="header">
    <img class="header-1" src="/resources/logo.png" />

    <div class="header-2">
        <div>공지사항</div>
        <div></div>
    </div>

    <div class="header-3">
        <img src="/resources/mypage.png" />
        <div>마이페이지</div>
    </div>

    <div class="header-4">
        <img src="/resources/logout.png" />
        <div>로그아웃</div>
    </div>

    <div class="header-5">
        직원1 님 <br/>환영합니다.
    </div>

    <!-- 출근 / 퇴근 버튼 -->
    <div class="header-6">
        <button class="attendance">출근 / 퇴근</button>
    </div>
</div>
</body>
</html>
