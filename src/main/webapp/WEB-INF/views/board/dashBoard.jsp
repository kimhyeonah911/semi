<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .dashboard-card {
            border-radius: 10px;
            padding: 20px;
            color: white;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
        }

        .card-body {
            font-size: 16px;
        }

        .card-warning {
            background-color: #FF6347;
        }

        .card-sales {
            background-color: #4CAF50;
        }

        .card-popular {
            background-color: #FF9800;
        }

        .card-notice {
            background-color: #2196F3;
        }

        .card-footer {
            font-size: 14px;
            font-weight: bold;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 30px;
        }

        @media (max-width: 768px) {
            .card-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<jsp:include page="../common/header-admin.jsp"/>

<div class="container-fluid">
    <div class="row">
        <!-- 사이드바 -->
        <jsp:include page="../common/sidebar-admin.jsp"/>

        <!-- 메인 내용 -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">대시보드</h1>
            </div>


            <div class="card-container">

                <div class="dashboard-card card-warning">
                    <div class="card-title">⚠️ 부족한 재고</div>
                    <div class="card-body">
                        <p>현재 재고 부족 제품이 5개입니다.</p>
                    </div>
                    <div class="card-footer">조치를 취해주세요</div>
                </div>


                <div class="dashboard-card card-sales">
                    <div class="card-title">💰 매점별 매출</div>
                    <div class="card-body">
                        <p>본사: 100,000원</p>
                        <p>학동점: 50,000원</p>
                        <p>한남점: 75,000원</p>
                    </div>
                    <div class="card-footer">매출 분석 필요</div>
                </div>

                <!-- 인기 제품 카드 -->
                <div class="dashboard-card card-popular">
                    <div class="card-title">👟 인기 제품</div>
                    <div class="card-body">
                        <p>1. 운동화 A</p>
                        <p>2. 운동화 B</p>
                        <p>3. 운동화 C</p>
                    </div>
                    <div class="card-footer">재고 확인 필요</div>
                </div>

                <!-- 공지사항 카드 -->
                <div class="dashboard-card card-notice">
                    <div class="card-title">📢 공지사항</div>
                    <div class="card-body">
                        <p>다음 주 월요일에는 시스템 점검이 예정되어 있습니다.</p>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-light" onclick="location.href='/list.bo'">자세히 보기</button>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
