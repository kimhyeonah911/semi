<%@ page import="com.kh.semi.domain.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");
    String position = (String)session.getAttribute("position");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sidebar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .sidebar {
            background-color: #343a40;
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            height: 100vh;
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: #fff;
            padding: 15px 20px;
            font-size: 16px;
            display: flex;
            align-items: center;
        }
        .sidebar .nav-link i {
            margin-right: 10px;
            font-size: 18px;
        }
        .sidebar .nav-link:hover {
            background-color: #495057;
        }
        .submenu {
            padding-left: 30px;
        }
        .submenu .nav-link {
            font-size: 14px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>

<!-- 사이드바 -->
<nav class="sidebar">
    <div class="position-sticky">
        <ul class="nav flex-column">
            <% if(position.equals("admin")) { %>
            <li class="nav-item">
                <a class="nav-link active" href="/dash.bo">
                    <i class="fas fa-home"></i> 대시보드
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product.bo">
                    <i class="fas fa-box-open"></i> 제품 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/sales.bo">
                    <i class="fas fa-chart-line"></i> 매출 현황
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/accept.ma">
                    <i class="fas fa-user-check"></i> 지점장 승인
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/accept.me">
                    <i class="fas fa-user-plus"></i> 직원 승인
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/delivery.ma">
                    <i class="fas fa-truck"></i> 입고처 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/employee.in">
                    <i class="fas fa-users"></i> 직원 정보
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/list.bo">
                    <i class="fas fa-bullhorn"></i> 공지사항
                </a>
            </li>
            <% } else if(position.equals("manager")) { %>
            <li class="nav-item">
                <a class="nav-link active" href="/dash-manager.bo">
                    <i class="fas fa-home"></i> 대시보드
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockManage.bo">
                    <i class="fas fa-box-open"></i> 재고 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/storage.lo">
                    <i class="fas fa-map-marker-alt"></i> 위치 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockIn.sto">
                    <i class="fa-solid fa-coins"></i> 입고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockOut.sto">
                    <i class="fa-solid fa-truck"></i> 출고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="salesManager.bo">
                    <i class="fas fa-chart-line"></i> 매출 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/attendance.ma?storeId=${loginUser.storeId}">
                    <i class="fas fa-users"></i> 근태 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/list.bo">
                    <i class="fas fa-bullhorn"></i> 공지사항
                </a>
            </li>
            <% } else if(position.equals("employee")) { %>
            <li class="nav-item">
                <a class="nav-link active" href="/dash-employee.bo">
                    <i class="fas fa-home"></i> 대시보드
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockManage.bo">
                    <i class="fas fa-box-open"></i> 재고 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/storage.lo">
                    <i class="fas fa-map-marker-alt"></i> 위치 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockIn.sto">
                    <i class="fa-solid fa-coins"></i> 입고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/stockOut.sto">
                    <i class="fa-solid fa-truck"></i> 출고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="salesManager.bo">
                    <i class="fas fa-chart-line"></i> 매출 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/attendance.em?empNo=${loginUser.empNo}">
                    <i class="fas fa-users"></i> 근태 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/list.bo">
                    <i class="fas fa-bullhorn"></i> 공지사항
                </a>
            </li>
            <% }else if(position.equals("member")) { %>
            <li class="nav-item">
                <a class="nav-link active" href="" onclick="showAlert(event)">
                    <i class="fas fa-home"></i> 대시보드
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fas fa-box-open"></i> 재고 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fas fa-map-marker-alt"></i> 위치 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fa-solid fa-coins"></i> 입고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fa-solid fa-truck"></i> 출고
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fas fa-chart-line"></i> 매출 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fas fa-users"></i> 근태 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="" onclick="showAlert(event)">
                    <i class="fas fa-bullhorn"></i> 공지사항
                </a>
            </li>
            <% } %>
        </ul>
    </div>
</nav>
<script>
    function showAlert(event){
        event.preventDefault();
        alert("직원 승인 후 가능합니다.");
    }
</script>
</body>
</html>
