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
    /* 사이드바 스타일 */
    .sidebar {
      background-color: #343a40;
      width: 250px; /* 사이드바 너비 */
      position: fixed;
      left: 0;
      top: 0;
      height: 100vh; /* 전체 화면 높이 */
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

    .nav-link[aria-expanded="true"] .fa-angle-down {
      transform: rotate(180deg);
      transition: transform 0.3s ease;
    }

    /* active 상태에서 아이콘 회전 */
    .nav-link .fa-angle-down {
      transition: transform 0.3s ease;
    }

    .nav-link.active .fa-angle-down {
      transform: rotate(180deg);
    }

    .rotated {
      transform: rotate(180deg);
      transition: transform 0.3s ease;
    }


    /* 본문 컨텐츠 (사이드바 밀어내기) */
    .content {
      margin-left: 250px; /* 사이드바 너비만큼 이동 */
      padding: 20px;
    }
  </style>
</head>
<body>

<!-- 사이드바 -->
<nav class="sidebar">
  <div class="position-sticky">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link active" href="/dash-manager.bo">
          <i class="fas fa-home"></i> 대시보드
        </a>
      </li>
      <!-- 창고 관리 -->
      <li class="nav-item">
        <a class="nav-link" href="#warehouseMenu" onclick="toggleMenu(this, 'warehouseMenu')">
          <i class="fas fa-box-open"></i> 창고 관리 &nbsp;<i class="fa-solid fa-angle-down"></i>
        </a>
        <div class="collapse" id="warehouseMenu">
          <ul class="nav flex-column submenu">
            <li class="nav-item">
              <a class="nav-link" href="/stockManage.bo">재고 관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="storage.lo">위치 관리</a>
            </li>
          </ul>
        </div>
      </li>

      <!-- 구매 관리 -->
      <li class="nav-item">
        <a class="nav-link" href="#purchaseMenu" onclick="toggleMenu(this, 'purchaseMenu')">
          <i class="fa-solid fa-coins"></i> 구매 관리 &nbsp;<i class="fa-solid fa-angle-down"></i>
        </a>
        <div class="collapse" id="purchaseMenu">
          <ul class="nav flex-column submenu">
            <li class="nav-item">
              <a class="nav-link" href="stockIn.sto">입고</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="stockOut.sto">출고</a>
            </li>
          </ul>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="salesManager.bo">
          <i class="fas fa-chart-line"></i> 매출 관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/attendance.ma">
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
    let isOpen = menu.classList.contains("show");

    // 현재 클릭한 메뉴가 열려 있다면 닫기
    if (isOpen) {
      menu.classList.remove("show");
      element.classList.remove("active");
    } else {
      // 모든 서브메뉴 닫기
      document.querySelectorAll(".collapse").forEach(submenu => {
        submenu.classList.remove("show");
      });

      // 모든 nav-link에서 active 제거
      document.querySelectorAll(".nav-link").forEach(link => {
        link.classList.remove("active");
      });

      // 클릭한 메뉴만 열기
      menu.classList.add("show");
      element.classList.add("active");
    }
  }
</script>






</body>
</html>