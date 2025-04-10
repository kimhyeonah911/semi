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

<jsp:include page="../common/sidebar.jsp"/>

<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">매출관리</h1>
    </div>

    <div id="two-chart">
        <div id="product-sales-chart">
            <div id="product-sales-title">
                <img src="/resources/shoe.png">
                <h2>제품별 매출 비중</h2>
            </div>
            <canvas id="donutChart"></canvas>
            <div id="donutChartMessage" style="text-align:center; font-size:18px; margin-top:20px; display:none;">--매출 기록이 아직 없습니다.--</div>
        </div>
        <div id="branch-sales-chart">
            <div id="branch-sales-title">
                <img src="/resources/money.png">
                <h2>우리의 매출 현황</h2>
            </div>
            <canvas id="multiLineChart"></canvas>
            <div id="lineChartMessage" style="text-align:center; font-size:18px; margin-top:20px; display:none;">매출 기록이 아직 없습니다.</div>
        </div>
    </div>
</main>

</div>


<script>

    //도덧차트
    let donutChart;

    $(document).ready(function() {
        getProductSales();
        getMonthSales();
    });

    function getProductSales(){
        $.ajax({
            url: "/api/getProductSales",
            type: "get",
            success: function(res){
                if (res.productName.length === 0 || res.totalAmount.length === 0) {
                    $('#donutChart').hide();
                    $('#donutChartMessage').show();
                } else {
                    $('#donutChart').show();
                    $('#donutChartMessage').hide();

                    const salesData = {
                        labels: res.productName,
                        values: res.totalAmount
                    };
                    drawDonutChart(salesData);
                }
            },
            error: function () {
                console.log("제품별 매출 데이터 ajax 요청 실패");
            }
        });
    }


    // 2. Chart.js로 도넛 차트 생성
    function drawDonutChart(salesData) {
        const ctx = document.getElementById('donutChart').getContext('2d');

        if (donutChart) {
            // 기존 차트가 있다면 업데이트
            donutChart.data.labels = salesData.labels;
            donutChart.data.datasets[0].data = salesData.values;
            donutChart.update();
        } else {
            // 새로 생성
            donutChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: salesData.labels,
                    datasets: [{
                        data: salesData.values,
                        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', "#44cd27", "#9b59b6"], // 필요시 색상 추가
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
        }
    }

    function getMonthSales() {
        console.log("라인차트 실행");
        $.ajax({
            url: "/api/getMonthSales",  // API 호출 경로
            type: "get",
            success: function(res) {
                if ((res.salesLastYear.length === 0 || res.salesThisYear.length === 0) && res.month.length === 0) {
                    $('#multiLineChart').hide();
                    $('#lineChartMessage').show();
                } else {
                    $('#multiLineChart').show();
                    $('#lineChartMessage').hide();

                    const labels = res.month.map(month => {
                        const monthNumber = parseInt(month.split('-')[1]);
                        return monthNumber + "월";
                    });

                    const monthlySalesData = {
                        labels: labels,
                        salesLastYear: res.salesLastYear,
                        salesThisYear: res.salesThisYear
                    };

                    drawLineChart(monthlySalesData);
                }
            },
            error: function () {
                console.log("달별 매출 데이터 ajax 요청 실패");
            }
        });
    }

    // drawLineChart 함수는 아래와 같이 수정된 상태로 유지됩니다.
    function drawLineChart(salesData) {
        const ctxLine = document.getElementById('multiLineChart').getContext('2d');

        const lineChart = new Chart(ctxLine, {
            type: 'line',  // 라인 차트
            data: {
                labels: salesData.labels,  // 월별 데이터
                datasets: [
                    {
                        label: "작년 매출",  // 작년 매출 레이블
                        data: salesData.salesLastYear,  // 작년 매출 데이터
                        borderColor: "#32f324",  // 초록색 선
                        backgroundColor: "rgba(50,243,36,0.2)",  // 연한 초록색 배경
                        borderWidth: 2,
                        pointRadius: 5,
                        pointBackgroundColor: "#32f324",
                        fill: false // 영역 채우기 없음
                    },
                    {
                        label: "올해 매출",  // 올해 매출 레이블
                        data: salesData.salesThisYear,  // 올해 매출 데이터
                        borderColor: "#c257ff",  // 보라색 선
                        backgroundColor: "rgba(194,87,255,0.2)",  // 연한 보라색 배경
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
                        position: 'top',  // 범례 위치 (위쪽)
                        labels: {
                            font: {
                                size: 20
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: "매출 (만원)",  // Y축 제목
                            font: {
                                size: 18
                            }
                        },
                        ticks: {
                            font: {
                                size: 16
                            }
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: "월",  // X축 제목
                            font: {
                                size: 18
                            }
                        },
                        ticks: {
                            font: {
                                size: 16
                            }
                        }
                    }
                }
            }
        });
    }

</script>

</body>
</html>