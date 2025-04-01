<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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


</style>

<div class="container-fluid bg-light py-3" id="header">
    <div class="logo-container">
        <img src="/resources/logo.png" alt="로고">
    </div>

    <div class="header-right">
        <div>
            <a href="adminmypage.bo" class="text-dark text-decoration-none">
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
            <div class="fw-bold fs-5">직원1 님</div>
            <div class="text-muted">환영합니다.</div>
        </div>
    </div>
</div>

