<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap & Font Awesome 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    #header {
        padding-left: 250px; /* 사이드바를 고려한 왼쪽 마진 */
        background: white !important;
    }
    .header-right {
        display: flex;
        justify-content: flex-start; /* 아이템들을 왼쪽으로 정렬 */
        align-items: center;
        gap: 10px; /* 아이템들 사이의 간격 (픽셀 단위 조정) */
        padding-left: 800px; /* 왼쪽 여백을 주어 아이템들이 너무 왼쪽에 붙지 않게 함 */
    }
    .header-right div {
        text-align: center;
    }
</style>

<div class="container-fluid bg-light py-3" id="header">
    <div class="row align-items-center">
        <!-- 로고 -->
        <div class="col-md-3 text-center">
            <img src="/resources/logo/logo.png" alt="로고" class="img-fluid" style="max-height: 100px;">
        </div>
        <!-- 마이페이지, 로그아웃, 환영 메시지 영역 -->
        <div class="col-md-8">
            <div class="header-right">
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
