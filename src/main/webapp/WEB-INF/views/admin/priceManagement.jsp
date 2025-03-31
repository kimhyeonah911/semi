<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원승인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- 차트 JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: "IBM Plex Sans KR", sans-serif;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table th:nth-child(1),
        .table td:nth-child(1) {
            width: 10%;
        }

        .table th:nth-child(2),
        .table td:nth-child(2) {
            width: 15%;
            padding-left: 20px;
        }

        .table th:nth-child(3),
        .table td:nth-child(3) {
            width: 10%;
            padding-left: 20px;
        }

        .table th:nth-child(4),
        .table td:nth-child(4) {
            width: 15%;
        }

        .table th:nth-child(5),
        .table td:nth-child(5) {
            width: 20%;
        }

        .table th:nth-child(6),
        .table td:nth-child(6) {
            width: 10%;
        }

        .table {
            margin-top: 10px;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            font-size: 15px;
        }

        th {
            background-color: #FFC9A5;
            font-weight: bold;
        }

        td {
            border-bottom: 1px solid #ccc;
        }

        .action-buttons button {
            margin: 0 5px;
            padding: 5px 10px;
            font-size: 16px;
        }

        .modal-body form .form-control {
            font-size: 16px;
        }

        .modal-footer button {
            font-size: 16px;
        }

        .main-content {
            padding-left: 2rem;
            padding-right: 2rem;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #000000;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #717171;
        }

        .pagination .active {
            background-color: #000000;
            color: white;
            border: 1px solid #000000;
        }

        .pagination .disabled {
            color: #ccc;
            cursor: not-allowed;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar.jsp"/>
        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">지점별 매출 현황</h1>
            </div>
            <!-- 월별 선택 셀렉트 박스 추가 -->
            <div class="mb-3">
                <label for="monthSelect" class="form-label">월 선택</label>
                <select class="form-select" id="monthSelect" aria-label="월 선택">
                    <option value="2025-02">1월</option>
                    <option value="2025-03">2월</option>
                    <option value="2025-04">3월</option>
                    <option value="2025-04">4월</option>
                    <option value="2025-04">5월</option>
                    <option value="2025-04">6월</option>
                    <option value="2025-04">7월</option>
                    <option value="2025-04">8월</option>
                    <option value="2025-04">9월</option>
                    <option value="2025-04">10월</option>
                    <option value="2025-04">11월</option>
                    <option value="2025-04">12월</option>
                    <!-- 추가 월 옵션 -->
                </select>
            </div>
            <!-- 매출 그래프 -->
            <div>
                <canvas id="salesChart" width="500" height="400"></canvas>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>지점명</th>
                        <th>기간</th>
                        <th>매출액</th>
                        <th>직원수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>역삼점</td>
                        <td>02-01~02-28</td>
                        <td>36,254,740</td>
                        <td>7명</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>하남점</td>
                        <td>02-01~02-28</td>
                        <td>31,204,740</td>
                        <td>6명</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>대구점</td>
                        <td>02-01~02-28</td>
                        <td>26,254,740</td>
                        <td>5명</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 페이지 바 html부분 -->
                <div class="pagination">
                    <a href="#" class="disabled">이전</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">다음</a>
                </div>

            </div>
        </main>
    </div>
</div>
<script>
    // 예시 매출 데이터 (이 부분을 서버에서 동적으로 전달받도록 변경할 수 있음)
    var salesData = {
        "2025-02": [
            { branch: "역삼점", sales: 36254740 },
            { branch: "하남점", sales: 31204740 },
            { branch: "대구점", sales: 26254740 }
        ],
        "2025-03": [
            { branch: "역삼점", sales: 40000000 },
            { branch: "하남점", sales: 35000000 },
            { branch: "대구점", sales: 30000000 }
        ]
        // 다른 월의 매출 데이터도 여기에 추가
    };

    // 차트 그리기 함수
    function updateGraph() {
        var month = document.getElementById('monthSelect').value;
        var selectedData = salesData[month];

        var branches = selectedData.map(function(item) {
            return item.branch;
        });
        var sales = selectedData.map(function(item) {
            return item.sales;
        });

        // 차트 업데이트
        var ctx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: branches,
                datasets: [{
                    label: '매출액',
                    data: sales,
                    backgroundColor: ['rgba(54, 162, 235, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(75, 192, 192, 0.2)'],
                    borderColor: ['rgba(54, 162, 235, 1)', 'rgba(255, 99, 132, 1)', 'rgba(75, 192, 192, 1)'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw.toLocaleString() + ' 원';
                            }
                        }
                    }
                }
            }
        });
    }

    // 초기 차트 그리기 (기본적으로 1월 데이터로 초기화)
    updateGraph();
</script>

</body>
</html>
