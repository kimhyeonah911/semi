<%--지점장 매출관리--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>

        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
        }

        #two-chart{
            display: flex;
        }
        #product-sales-chart{
            width : 30%;
            margin: 1px;
            border-right: 1px solid black ;
        }
        #branch-sales-chart{
            width: 70%;
            margin: 2px;
        }
        #product-sales-title, #branch-sales-title{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #product-sales-title>img, #branch-sales-title>img{
            width: 50px;
            height: 50px;
        }

        #donutChart{
            width: 50%;
            /*height: 300px;*/
            margin-top: 50px;
        }

        #multiLineChart{
            /*margin-top: 50px;*/
            font-size: 20px;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container-fluid">

<jsp:include page="../common/sidebar-manager.jsp"/>

<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">매출관리</h1>
    </div>

    <div id="two-chart">
        <div id="product-sales-chart">
            <div id="product-sales-title">
                <img src="/resources/shoe.png">
                <h2>제품별 매출 비중 (역삼점)</h2>
            </div>
            <canvas id="donutChart"></canvas>
        </div>
        <div id="branch-sales-chart">
            <div id="branch-sales-title">
                <img src="/resources/money.png">
                <h2>우리의 매출 현황 (역삼점)</h2>
            </div>
            <canvas id="multiLineChart"></canvas>
        </div>
    </div>
</main>

</div>


<script>

    //도덧차트

    const mockSalesData = {
        labels: ["아디다스", "나이키", "뉴발란스", "퓨마"],
        values: [300, 500, 200, 300]
    };

    // 2. Chart.js로 도넛 차트 생성
    const ctx = document.getElementById('donutChart').getContext('2d');

    const donutChart = new Chart(ctx, {
        type: 'doughnut',  // 도넛 차트 타입
        data: {
            labels: mockSalesData.labels,  // 예시: ["지점 A", "지점 B", "지점 C"]
            datasets: [{
                data: mockSalesData.values,  // 예시: [300, 500, 200]
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', "#44cd27"], // 색상 설정
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 30,
                        font: {
                            size: 18
                        }
                    }
                }
            }
        }
    });

</script>

<script>
    // 12개월 매출 Mock 데이터
    const monthlySalesData = {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        sales2024: [500, 700, 800, 650, 900, 1100, 950, 1200, 1300, 1250, 1400, 1500], // 2024년 매출
        sales2025: [600, 500, 850, 700, 950, 800, 1000, 1250, 1350, 1300, 1000, 1700] // 2025년 매출
    };

    // 캔버스 가져오기
    const ctxLine = document.getElementById('multiLineChart').getContext('2d');

    // 라인 차트 생성
    const lineChart = new Chart(ctxLine, {
        type: 'line',  // 라인 차트
        data: {
            labels: monthlySalesData.labels,
            datasets: [
                {
                    label: "2024년 매출",
                    data: monthlySalesData.sales2024,
                    borderColor: "#32f324",  // 파란색 선
                    backgroundColor: "rgba(50,243,36,0.2)",  // 연한 파란색 배경
                    borderWidth: 2,
                    pointRadius: 5,
                    pointBackgroundColor: "#32f324",
                    fill: false // 영역 채우기 없음
                },
                {
                    label: "2025년 매출",
                    data: monthlySalesData.sales2025,
                    borderColor: "#c257ff",  // 빨간색 선
                    backgroundColor: "rgba(194,87,255,0.2)",  // 연한 빨간색 배경
                    borderWidth: 2,
                    pointRadius: 5,
                    pointBackgroundColor: "#c257ff",
                    fill: false // 영역 채우기 없음
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top', // 범례 위치 (위쪽)
                    labels: {
                        font:{
                            size:20
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: "매출 (만원)", // Y축 제목
                        font: {
                            size: 18
                        }
                    },
                    ticks: {
                        font:{
                            size:16
                        }
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: "월", // X축 제목
                        font: {
                            size: 18
                        }
                    },
                    ticks:{
                        font:{
                            size:16
                        }
                    }
                }
            }
        }
    });
</script>

</body>
</html>