<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <title>Title</title>
    <style>
        div{box-sizing: border-box;}

        .header{
            width: 1322.39px;
            height: 177.37px;
            position: relative;
            margin: auto;
            margin-top:10px;
        }

        .header-1{
            width: 314.05px;
            height: 177.37px;
            left: -40px;
            top: 0px;
            position: absolute;
        }

        .header-2>div:nth-child(1){
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

        .header-2>div:nth-child(2){
            width: 161.28px;
            height: 0px;
            left: 314px;
            top: 156px;
            position: absolute;
            outline: 3px #005F5B solid;
            outline-offset: -1.50px;
        }

        .header-3>img{
            width: 29.62px;
            height: 29.62px;
            /*left: 1179.16px;
            top: 8.52px;
            position: absolute;*/
        }

        .header-3>div{
            width: 70.26px;
            height: 17.33px;
            /*left: 1161.88px;
            top: 45.78px;
            position: absolute;*/
            color: black;
            font-size: 15px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        .header-3{
            display:flex;
            flex-direction: column;
            align-items: center;
            right: 200px;
            top: 9px;
            position: absolute;

        }

        .header-4>img{
            width: 29.62px;
            height: 29.62px;
            /*left: 1284.38px;
            top: 38.14px;
            position: absolute;*/
            transform: rotate(180deg);
            /*transform-origin: top left;*/
        }

        .header-4>div{
            width: 55.51px;
            height: 19.30px;
            /*left: 1242.49px;
            top: 45.76px;
            position: absolute;*/
            color: black;
            font-size: 15px;
            font-family: "Noto Sans KR", sans-serif;
            font-weight: 400;
            word-wrap: break-word;
        }

        .header-4{
            display:flex;
            flex-direction: column;
            align-items: center;
            right: 140px;
            top: 9px;
            position: absolute;
        }

        .header-5{
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

    <div class="header-5">manager2 님 <br/>환영합니다.</div>
</div>
</body>
</html>