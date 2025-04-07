<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 로그인한 사용자 정보 가져오기
    String memName = (String) session.getAttribute("memName");
    String position = (String) session.getAttribute("position");

    System.out.println("현재 세션 memName: " + memName);
%>

<!-- Bootstrap & Font Awesome 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/nanumsquareneo@0.0.5/nanumsquareneo.min.css" rel="stylesheet">

<style>
    * {
        font-family: "NanumSquareNeo", sans-serif;
    }
    #header {
        background: white !important;
        padding: 10px 20px;
        position: fixed;
        top: 0;
        left: 250px;
        width: calc(100% - 250px);
        z-index: 1000;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        height: 130px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo-container {
        display: flex;
        align-items: center;
    }

    .logo-container img {
        width: 150px;
        height: auto;
    }

    .header-right {
        display: flex;
        align-items: center;
        gap: 30px;
    }

    .header-right div {
        text-align: center;
    }

    .header-right a {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-decoration: none;
        color: black;
    }

    .admin-info {
        text-align: right;
    }
    button {
        padding: 12px 24px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 12px;
        color: white;
        margin: 10px;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    /* 출근 버튼 (초록색) */
    .start-btn {
        background-color: #28a745;
    }
    .start-btn:hover {
        background-color: #218838;
    }

    /* 근무 중 버튼 (주황색) */
    .working-btn {
        background-color: #fd7e14;
    }
    .working-btn:hover {
        background-color: #e86c0b;
    }

    /* 퇴근 버튼 (빨간색) */
    .leave-btn {
        background-color: #dc3545;
    }
    .leave-btn:hover {
        background-color: #c82333;
    }
    #realTimeClock{
        width: 200px;
    }

</style>

<div class="container-fluid bg-light py-3" id="header">
    <div class="logo-container">
        <img src="/resources/logo.png" alt="로고">
    </div>

    <div class="header-right">
        <div>
            <a href="mypage.bo" class="text-dark text-decoration-none">
                <i class="fas fa-user fa-2x"></i>
                <div>마이페이지</div>
            </a>
        </div>
        <div>
            <a href="logout.me" class="text-dark text-decoration-none">
                <i class="fas fa-sign-out-alt fa-2x"></i>
                <div>로그아웃</div>
            </a>
        </div>
        <div class="admin-info">
            <div class="fw-bold fs-5">
                <%= memName != null ? memName + " 님" : "사용자" %>
            </div>
            <div class="text-muted">환영합니다.</div>
        </div>
        <%
            Boolean working = (Boolean) session.getAttribute("isWorking");
            boolean isWorking = (working != null && working);
            if (position.equals("employee")) {
        %>
        <div style="margin-top: 20px; text-align: center;">
            <button id="workButton"
                    class="<%= isWorking ? "working-btn" : "start-btn" %>"
                    onclick="<%= isWorking ? "" : "출근()" %>"
                    <%= isWorking ? "disabled" : "" %>>
                <%= isWorking ? "근무중" : "출근" %>
            </button>
            <button id="leaveButton" class="leave-btn" onclick="퇴근()">퇴근</button>
            <p id="realTimeClock" style="margin-top: 10px; font-weight: bold; font-size: 15px"></p>
        </div>
        <% } %>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function 출근() {
            $.ajax({
                type: "POST",
                url: '/clockInOut',
                data: { type: "in" },
                success: function(response) {
                    if (response.startsWith("redirect:")) {
                        alert("출근 완료");
                        let workButton = document.getElementById("workButton");
                        workButton.innerText = "근무중";
                        workButton.classList.remove("start-btn");
                        workButton.classList.add("working-btn");

                        // redirect 이동
                        window.location.href = response.replace("redirect:", "");
                    } else {
                        alert("출근 실패 또는 이미 출근 처리됨");
                    }
                },
                error: function() {
                    alert("출근 기록이 안됌!");
                }
            });
        }


        function 퇴근() {
            $.ajax({
                type: "POST",
                url: '/clockInOut',
                data: { type: "out" },
                success: function(response) {
                    if (response.startsWith("redirect:")) {
                        alert("퇴근 완료");
                        let workButton = document.getElementById("workButton");
                        workButton.innerText = "출근";
                        workButton.classList.remove("working-btn");
                        workButton.classList.add("start-btn");

                        // redirect 이동
                        window.location.href = response.replace("redirect:", "");
                    } else {
                        alert("퇴근 실패 또는 이미 퇴근 처리됨");
                    }
                },
                error: function() {
                    alert("퇴근 기록이 안됌!");
                }
            });
        }


        function updateClock() {
            let now = new Date();
            let formattedDate = now.toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
            document.getElementById("realTimeClock").innerText = formattedDate;
        }

        setInterval(updateClock, 1000);
        window.onload = updateClock;
    </script>


</div>
