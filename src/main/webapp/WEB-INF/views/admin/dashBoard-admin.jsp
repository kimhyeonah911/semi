<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/nanumsquareneo@0.0.5/nanumsquareneo.min.css" rel="stylesheet">
    <style>
        * {
            font-family: "NanumSquareNeo", sans-serif;
        }
        html, body {
            height: 100%; /* 페이지 전체 높이를 100%로 설정 */
            overflow-y: auto; /* 세로 스크롤이 필요할 때만 보이도록 설정 */
        }

        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
        }

        body {
            padding-top: 130px;
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
            scale: 1.05;
        }

        .card-sales {
            background-color: #EDE7F6; /* 밝은 회색 */
            color: #000000; /* 진한 네이비 */
        }

        .card-warning {
            background-color: #FFE5E5; /* 연한 붉은색 */
            color: #000000; /* 진한 빨강 */
        }

        .card-popular {
            background-color: #FFF8E1; /* 연한 노랑 */
            color: #000000; /* 진한 오렌지 */
        }

        .card-notice {
            background-color: #E3F2FD; /* 밝은 하늘색 */
            color: #000000; /* 진한 파랑 */
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

        .popular-card-body{
            display: flex;
            justify-content: space-around;
        }

        #popular-product{
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 130px;
        }
        .card-body-work {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
        }
        #waitMember, #waitManager{
            margin-bottom: 10px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

<div class="container-fluid">
    <!-- 사이드바 -->
    <jsp:include page="../common/sidebar.jsp"/>
    <!-- 메인 내용 -->
    <main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">관리자 대시보드</h1>
        </div>

        <div class="card-container">
            <!-- 승인 대기 인원 -->
            <div class="dashboard-card card-warning" style="grid-area: warning;">
                <div class="card-title">👤 승인 대기 인원</div>
                <div class="card-body">
                    <div class="card-body-work">
                        <!-- 직원 승인 대기 -->
                        <div class="work text-center">
                            <img src="/resources/employee.png" alt="승인 대기 직원 아이콘" id="waitMember">
                            <h4>${countEmployee}</h4>
                            <p>직원 승인 대기</p>
                        </div>

                        <!-- 지점장 승인 대기 -->
                        <div class="nowork text-center">
                            <img src="/resources/manager.png" alt="승인 대기 지점장 아이콘" id="waitManager">
                            <h4>${countManager}</h4>
                            <p>지점장 승인 대기</p>
                        </div>
                    </div>
                </div>

                <div class="card-footer">조치를 취해주세요</div>
            </div>

            <!-- 매출 그래프 카드 -->
            <div class="dashboard-card card-sales" style="grid-area: sales;">
                <div class="card-title">💰 매점별 매출</div>
                <div class="card-body">
                    <canvas id="salesChart" style="width: 930px; height: 300px;"></canvas> <!-- Chart.js 그래프 삽입 -->
                </div>
                <a href="sales.bo" style="text-decoration: none; color: black;">
                <div class="card-footer">매출 분석 필요</div>
                </a>
            </div>

            <!-- Chart.js 라이브러리 추가 -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script>
                $(document).ready(function () {
                    getDaySales(); //페이지 들어갈때마다 그래프 다시 가져옴


                    setInterval(getDaySales, 30000); //페이지에 계속 남아있을시 30초마다 자동 새로고침
                });

                function getDaySales(){
                    console.log("일매출차트 실행");

                    $.ajax({
                        url: "/api/getDaySales",
                        type: "get",
                        success: function (res){
                            const labels = res.labels; // 지점명 리스트
                            const data = res.data;     // 매출 리스트

                            const ctx = document.getElementById('salesChart').getContext('2d');

                            new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: labels,
                                    datasets: [{
                                        label: '오늘 일매출 (원)',
                                        data: data,
                                        fill: false,
                                        borderColor: 'rgb(75, 192, 192)',
                                        tension: 0.1
                                    }]
                                },
                                options: {
                                    responsive: false,
                                    maintainAspectRatio: false,
                                    layout: {
                                        padding: {
                                        }
                                    },
                                    scales: {
                                        x: {
                                            ticks: {
                                                autoSkip: true    // 너무 많으면 생략
                                            }
                                        },
                                        y: {
                                            beginAtZero: true,
                                            max: 4000000,
                                            ticks: {
                                                stepSize: 1000000
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        error: function(){
                            console.error("일매출 차트 가져오기 실패");
                        }
                    });
                }

                // 매출 데이터 (지점별 매출)
                // const labels = ['한남점', '서울역점', '강남점', '노원점', '길음점', '잠실점', '선릉점', '번내점', '천호점', '역삼점']; // x축 레이블
                // const data = {
                //     labels: labels,
                //     datasets: [
                //         {
                //             label: '지점별 매출',
                //             data: [45, 90, 180, 135, 90, 105, 75, 60, 45, 30], // 지점별 매출 데이터
                //             borderColor: 'rgb(255,120,120)', // 선 색상
                //             pointBackgroundColor: 'white',
                //             backgroundColor: 'rgba(0,0,0,0.2)', // 선 아래 채우기 색상
                //             tension: 0.4 // 곡선 정도
                //         }
                //     ]
                // };
                //
                // // 차트 옵션
                // const config = {
                //     type: 'line',
                //     data: data,
                //     options: {
                //         responsive: true,
                //         maintainAspectRatio: false,
                //         plugins: {
                //             legend: { display: false },
                //             title: { display: true, text: '지점별 매출' }
                //         },
                //         scales: {
                //             x: {
                //                 title: { display: true },
                //                 grid: { display: false } // x축 눈금선 제거
                //             },
                //             y: {
                //                 title: { display: true, text: '매출 (단위: 만원)' },
                //                 min: 0,
                //                 max: 200,
                //                 ticks: { stepSize: 40 }, // y축 눈금 간격을 40으로 설정
                //                 grid: { display: false } // y축 눈금선 제거
                //             }
                //         }
                //     }
                // };
                //
                // // Chart.js 렌더링
                // const ctx = document.getElementById('salesChart').getContext('2d');
                // new Chart(ctx, config);
            </script>

            <!-- 인기 제품 카드 -->
            <div class="dashboard-card card-popular" style="grid-area: popular;" onclick="location.href='enroll.bo'">
                <div class="card-title">👟 인기 제품</div>
                <div class="card-body">
                    <c:forEach var="top4p" items="${top4product}">
                        <div id="popular-product" >
                            <img style="pointer-events: none;" src="${empty top4p.imageUrl ? '/resources/default.png' : top4p.imageUrl}" alt="인기제품사진">
                            <span>${top4p.productName}</span>
                        </div>
                    </c:forEach>
                </div>
                <a href="product.bo" style="text-decoration: none; color: black;">
                <div class="card-footer">재품 관리</div>
                </a>
            </div>

            <div class="dashboard-card card-notice" style="grid-area: notice;">
                <div class="card-title">📢 공지사항</div>
                <div class="card-body" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                    <c:forEach var="b" items="${noticeList}">
                        <p>${b.boardContent}</p>
                    </c:forEach>
                </div>
                <a href="list.bo" style="text-decoration: none; color: black;">
                    <div class="card-footer">자세히 보기</div>
                </a>
            </div>

        </div>
        <jsp:include page="../common/footer.jsp"/>
    </main>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>