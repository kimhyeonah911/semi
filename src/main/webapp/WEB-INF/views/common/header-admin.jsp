<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap & Font Awesome 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    #header {
        /* 사이드바를 고려한 왼쪽 마진 */
        background: white !important;
    }
    .header-right {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 20px;
    }
    .header-right div {
        text-align: center;
    }
    .img-fluid{
        padding-right: 200px;
    }

</style>

<div class="container-fluid bg-light py-3" id="header">
    <div class="row align-items-center">
        <!-- 로고 -->


        <!-- 마이페이지, 로그아웃, 환영 메시지 영역 -->
        <div class="col-md-9">
            <div class="header-right">
                <img src="/resources/logo.png" alt="로고" class="img-fluid">
                <!-- 마이페이지 -->
                <div>
                    <a href="#" class="text-dark text-decoration-none">
                        <i class="fas fa-user fa-2x"></i>
                        <div>마이페이지</div>
                    </a>
                </div>

                <!-- 로그아웃 -->
                <div>
                    <a href="#" class="text-dark text-decoration-none">
                        <i class="fas fa-sign-out-alt fa-2x"></i>
                        <div>로그아웃</div>
                    </a>
                </div>

                <!-- 환영 메시지 -->
                <div>
                    <div class="fw-bold fs-5">admin 님</div>
                    <div class="text-muted">환영합니다.</div>
                </div>
            </div>
        </div>
    </div>
</div>
