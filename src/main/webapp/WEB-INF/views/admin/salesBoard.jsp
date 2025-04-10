<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>매출현황</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- 차트 JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    main{
      margin-left: 250px;  /* ms-sm-auto */
      /*margin-right: auto;*/
      width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
      padding-left: 24px;  /* px-md-4 */
      /*padding-right: 24px;*/
      margin-top: 130px;
      overflow: visible;
    }

    main {
      overflow: visible !important;
    }

    canvas {
      position: relative;
      z-index: auto !important;
      pointer-events: auto;
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
  <!-- Sidebar -->
  <jsp:include page="../common/sidebar.jsp"/>
  <!-- Main content -->
  <main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      <h1 class="h2">지점별 매출 현황</h1>
    </div>
    <!-- 월별 선택 셀렉트 박스 추가 -->
    <div class="mb-3">
      <label for="monthSelect" class="form-label">월 선택</label>
      <select class="form-select" id="monthSelect" aria-label="월 선택">
        <option value="2025-01">1월</option>
        <option value="2025-02">2월</option>
        <option value="2025-03">3월</option>
        <option value="2025-04">4월</option>
        <option value="2025-05">5월</option>
        <option value="2025-06">6월</option>
        <option value="2025-07">7월</option>
        <option value="2025-08">8월</option>
        <option value="2025-09">9월</option>
        <option value="2025-10">10월</option>
        <option value="2025-11">11월</option>
        <option value="2025-12">12월</option>
      </select>
    </div>
    <!-- 매출 그래프 -->
    <div class="d-flex justify-content-center">
      <canvas id="salesChart" style="max-width: 1500px; max-height: 500px; position: relative; z-index: 1000;"></canvas>
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
        <tbody id="salesTableBody">
        </tbody>
      </table>

    </div>
  </main>
  <script>
    const salesData = [
      <c:forEach var="s" items="${monthlySales}" varStatus="status">
      {
        storeId: "${s['STORE_ID']}",
        salesMonth: "${s['SALESMONTH']}",
        totalMonthSales: "${s['TOTALMONTHSALES'] != null ? s['TOTALMONTHSALES'] : 0}",
        storeName: "${s['STORE_NAME'] != null ? s['STORE_NAME'] : ''}",
        employeeCount: "${s['EMPLOYEECOUNT'] != null ? s['EMPLOYEECOUNT'] : 0}"
      }<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ].map(item => ({
      storeId: Number(item.storeId),
      salesMonth: item.salesMonth,
      totalMonthSales: Number(item.totalMonthSales),
      storeName: item.storeName,
      employeeCount: item.employeeCount
    }));

    function renderTable(data) {
      const tbody = document.getElementById("salesTableBody");
      tbody.innerHTML = "";
      data.forEach((item, idx) => {
        const row = '<tr>' +
                '<td>' + (idx + 1) + '</td>' +
                '<td>' + (item.storeName || '-') + '</td>' +
                '<td>' + item.salesMonth + '</td>' +
                '<td>' + item.totalMonthSales.toLocaleString() + '</td>' +
                '<td>' + (item.employeeCount != null ? item.employeeCount : '-') + '</td>' +
                '</tr>';
        tbody.insertAdjacentHTML("beforeend", row);
      });
    }

    document.addEventListener("DOMContentLoaded", function () {
      const monthSelect = document.getElementById("monthSelect");
      const availableMonths = [...new Set(salesData.map(item => item.salesMonth))].sort().reverse();

      if (availableMonths.length > 0) {
        const latestMonth = availableMonths[0];
        monthSelect.value = latestMonth;
        const filtered = salesData.filter(item => item.salesMonth === latestMonth);
        console.log("📅 초기 선택된 월:", latestMonth);
        console.log("📊 초기 필터링 결과:", filtered);
        renderTable(filtered);
      }

      monthSelect.addEventListener("change", function () {
        const selectedMonth = this.value;
        const filtered = salesData.filter(item => item.salesMonth === selectedMonth);
        console.log("📅 선택된 월:", selectedMonth);
        console.log("📊 선택된 월 필터링 결과:", filtered);
        renderTable(filtered);
      });
    });
  </script>

  <script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    let chartInstance;

    function renderChart(month) {
      const filtered = salesData.filter(item => item.salesMonth === month);
      const branchLabels = filtered.map(item => item.storeName);
      const chartSalesData = filtered.map(item => item.totalMonthSales);

      // 기존 차트 삭제
      if (chartInstance) chartInstance.destroy();

      chartInstance = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: branchLabels,
          datasets: [{
            label: month + ' 매출액',
            data: chartSalesData,
            backgroundColor: [
              'rgba(255, 99, 132, 0.4)',
              'rgba(54, 162, 235, 0.4)',
              'rgba(255, 206, 86, 0.4)',
              'rgba(75, 192, 192, 0.4)',
              'rgba(153, 102, 255, 0.4)'
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          interaction: {
            mode: 'nearest',
            intersect: false
          },
          plugins: {
            legend: {
              position: 'top'
            },
            tooltip: {
              callbacks: {
                tooltip: {
                  callbacks: {
                    label: function (tooltipItem) {
                      const label = tooltipItem.label || tooltipItem.xLabel || tooltipItem.dataset.label || '매장';
                      const value = tooltipItem.raw || tooltipItem.yLabel || tooltipItem.dataset.data[tooltipItem.dataIndex] || 0;
                      const formattedValue = Number(value).toLocaleString();
                      return `${label}: ${formattedValue} 원`;
                    }
                  }
                }
              }
            }
          }
        }
      });
    }

    document.addEventListener("DOMContentLoaded", function () {
      const monthSelect = document.getElementById("monthSelect");
      const availableMonths = [...new Set(salesData.map(item => item.salesMonth))].sort().reverse();

      if (availableMonths.length > 0) {
        const latestMonth = availableMonths[0];
        monthSelect.value = latestMonth;
        const filtered = salesData.filter(item => item.salesMonth === latestMonth);
        renderTable(filtered);
        renderChart(latestMonth);  // ✅ 그래프 초기 렌더링
      }

      monthSelect.addEventListener("change", function () {
        const selectedMonth = this.value;
        const filtered = salesData.filter(item => item.salesMonth === selectedMonth);
        renderTable(filtered);
        renderChart(selectedMonth);  // ✅ 선택에 따른 그래프 업데이트
      });
    });
  </script>
</div>
</body>
</html>