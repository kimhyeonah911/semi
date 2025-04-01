<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 150px;
        }

        .dashboard-card {
            border-radius: 10px;
            padding: 20px;
            color: white;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: scale(1.02);
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
        }

        .card-body {
            font-size: 15px;
            display: flex;
            justify-content: center;
        }
        .card-body span:hover{
            scale: 1.05;
            cursor: pointer;
        }

        .card-body img {
            width: 100px;
            height: 100px;
            padding: 5px;
        }
        .card-body img:hover {
            background: #007bff;
            scale: 1.05;
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
            text-align: center;
        }

        .card-container {
            display: grid;
            grid-template-columns: 2fr 3fr; /* 카드들의 넓이 비율 조정 */
            grid-template-areas:
                "warning sales"
                "popular notice";
            gap: 20px;
            margin-top: 30px;
        }

        /* 매출 그래프 카드의 크기를 더 크게 설정 */
        .card-sales {
            grid-column: span 2; /* 매출 카드는 두 칸을 차지 */
            width: 100%;
            height: 450px;
        }

        /* 공지사항 카드의 크기를 더 크게 설정 */
        .card-notice {
            grid-column: span 2; /* 공지사항 카드는 두 칸을 차지 */
            width: 100%;
            height: 300px;
        }

        /* 화면 크기에 따른 반응형 처리 */
        @media (max-width: 768px) {
            .card-container {
                grid-template-columns: 1fr;
                grid-template-areas:
                    "warning"
                    "sales"
                    "popular"
                    "notice";
            }

            .card-sales {
                grid-column: span 1; /* 모바일에서는 매출 카드가 하나의 칸만 차지 */
            }

            .card-notice {
                grid-column: span 1; /* 모바일에서는 공지사항 카드도 하나의 칸만 차지 */
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
                <h1 class="h2">관리자 대시보드</h1>
            </div>

            <div class="card-container">

                <!-- 부족한 재고 카드 -->
                <div class="dashboard-card card-warning" style="grid-area: warning;">
                    <div class="card-title">⚠️ 부족한 재고</div>
                    <div class="card-body">
                        <span>뉴발란스 992 현재 재고 부족 제품이 5개입니다.</span>
                    </div>
                    <div class="card-body">
                        <span>에어포스1 07 WB 현재 재고 부족 제품이 2개입니다.</span>
                    </div>
                    <div class="card-body">
                        <span>아디다스 삼바 현재 재고 부족 제품이 7개입니다.</span>
                    </div>
                    <div class="card-body">
                        <span>아식스 리브레 현재 재고 부족 제품이 2개입니다.</span>
                    </div>
                    <div class="card-body">
                        <span>반스 컴피쿠시 현재 재고 부족 제품이 1개입니다.</span>
                    </div>
                    <div class="card-body">
                        <span></span>
                    </div>
                    <div class="card-footer">조치를 취해주세요</div>
                </div>

                <!-- 매출 그래프 카드 -->
                <div class="dashboard-card card-sales" style="grid-area: sales;">
                    <div class="card-title">💰 매점별 매출</div>
                    <div class="card-body">
                        <canvas id="salesChart" style="max-width: 100%; height: 300px;"></canvas> <!-- Chart.js 그래프 삽입 -->
                    </div>
                    <div class="card-footer">매출 분석 필요</div>
                </div>

                <!-- Chart.js 라이브러리 추가 -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                <script>
                    // 매출 데이터 (지점별 매출)
                    const labels = ['한남점', '서울역점', '강남점', '노원점', '길음점', '잠실점', '선릉점', '번내점', '천호점', '역삼점']; // x축 레이블
                    const data = {
                        labels: labels,
                        datasets: [
                            {
                                label: '지점별 매출',
                                data: [45, 90, 180, 135, 90, 105, 75, 60, 45, 30], // 지점별 매출 데이터
                                borderColor: 'rgba(54, 162, 235, 1)', // 선 색상
                                pointBackgroundColor: 'white',
                                backgroundColor: 'rgba(54, 162, 235, 0.2)', // 선 아래 채우기 색상
                                tension: 0.4 // 곡선 정도
                            }
                        ]
                    };

                    // 차트 옵션
                    const config = {
                        type: 'line',
                        data: data,
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false },
                                title: { display: true, text: '지점별 매출' }
                            },
                            scales: {
                                x: {
                                    title: { display: true },
                                    grid: { display: false } // x축 눈금선 제거
                                },
                                y: {
                                    title: { display: true, text: '매출 (단위: 만원)' },
                                    min: 0,
                                    max: 200,
                                    ticks: { stepSize: 40 }, // y축 눈금 간격을 40으로 설정
                                    grid: { display: false } // y축 눈금선 제거
                                }
                            }
                        }
                    };

                    // Chart.js 렌더링
                    const ctx = document.getElementById('salesChart').getContext('2d');
                    new Chart(ctx, config);
                </script>

                <!-- 인기 제품 카드 -->
                <div class="dashboard-card card-popular" style="grid-area: popular;" onclick="location.href='enroll.bo'">
                    <div class="card-title">👟 인기 제품</div>
                    <div class="card-body">
                        <img src="/resources/samba.png">
                        <img src="/resources/newbalance.png">
                        <img src="/resources/airpose.png">
                        <img src="/resources/asics.png">
                    </div>
                    <div class="card-footer">재고 확인 필요</div>
                </div>

                <!-- 공지사항 카드 -->
                <div class="dashboard-card card-notice" style="grid-area: notice;">
                    <div class="card-title">📢 공지사항</div>
                    <div class="card-body">
                        <span>1. 다음 주 월요일에는 시스템 점검이 예정되어 있습니다.</span>
                    </div>
                    <div class="card-body">
                        <span>2.각 지점 재고관리 철저히 확인 바람.</span>
                    </div>
                    <div class="card-body">
                        <span>3. 이번 주 목요일 ㄱㄴㄷ마켓 엑스포박람회 참석 예정</span>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-light" onclick="location.href='/list.bo'">자세히 보기</button>
                    </div>
                </div>

            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
