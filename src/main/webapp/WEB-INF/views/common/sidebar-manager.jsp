<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      transition: width 0.3s ease;
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
      transition: background-color 0.3s ease;
    }

    .submenu .nav-link:hover {
      background-color: #6c757d;
    }

    .nav-link.active .fa-angle-down {
      transform: rotate(180deg);
    }

    .rotated {
      transform: rotate(180deg);
      transition: transform 0.3s ease;
    }

    .content {
      margin-left: 250px;
      padding: 20px;
    }
  </style>
</head>
<body>

<nav class="sidebar">
  <div class="position-sticky">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link active" href="/dash-manager.bo">
          <i class="fas fa-home"></i> 대시보드
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#warehouseMenu" onclick="toggleMenu(this, 'warehouseMenu')">
          <i class="fas fa-box-open"></i> 창고 관리 &nbsp;<i class="fa-solid fa-angle-down"></i>
        </a>
        <div class="collapse" id="warehouseMenu">
          <ul class="nav flex-column submenu">
            <li class="nav-item">
              <a class="nav-link" href="/inventory.jsp">재고 관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/location.jsp">위치 관리</a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#purchaseMenu" onclick="toggleMenu(this, 'purchaseMenu')">
          <i class="fa-solid fa-coins"></i> 구매 관리 &nbsp;<i class="fa-solid fa-angle-down"></i>
        </a>
        <div class="collapse" id="purchaseMenu">
          <ul class="nav flex-column submenu">
            <li class="nav-item">
              <a class="nav-link" href="/stockIn.jsp">입고</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/stockOut.jsp">출고</a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/sales.jsp">
          <i class="fas fa-chart-line"></i> 매출 관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/attendance.jsp">
          <i class="fas fa-users"></i> 근태 관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/manager.bo">
          <i class="fas fa-bullhorn"></i> 공지사항
        </a>
      </li>
    </ul>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function toggleMenu(element, menuId) {
    let menu = document.getElementById(menuId);
    let icon = element.querySelector(".fa-angle-down");
    let isOpen = menu.classList.contains("show");

    if (isOpen) {
      menu.classList.remove("show");
      element.classList.remove("active");
      icon.classList.remove("rotated");
    } else {
      document.querySelectorAll(".collapse").forEach(submenu => {
        submenu.classList.remove("show");
      });
      document.querySelectorAll(".nav-link").forEach(link => {
        link.classList.remove("active");
        let iconInside = link.querySelector(".fa-angle-down");
        if (iconInside) iconInside.classList.remove("rotated");
      });
      menu.classList.add("show");
      element.classList.add("active");
      icon.classList.add("rotated");
    }
  }
</script>

</body>
</html>
