<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <style>
    ul, ol, li {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }
    a{
      cursor: pointer;
      display: block;
    }
    .side-bar{
      width: 230px;
      height: 680px;
      background: #FFC9A5;
      border-radius: 15px;

      /*position: relative;*/

      left: 23px;
      top: 193px;

      display: flex;
      flex-direction: column;
      justify-content: space-around;
      align-items: center;

    }
    #menu{
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      color: #005F5B;
      font-size: 30px;
      font-weight: 700;
    }
    #menu > li{
      margin-bottom: 60px;
      position: relative;
    }
    #menu > li:hover{
      color: #00A69F;
    }
    #storage, #buying{
      margin: 0;
      padding: 0;
    }
    #storage, #buying > a {
      margin: 0;
    }
    #storage-list, #buying-list{
      display: none;
      position: absolute;
      top: 85%;
      width: 100%;
      font-size : 23px;
      margin-left: 15px;
    }
    #storage-list>li{
      margin-left:2px;
    }
    #buying-list>li{
      margin-left: 20px;
    }
    #storage:hover > #storage-list,
    #buying:hover > #buying-list{
      display: block;
    }
    #storage img, #buying img{
      vertical-align: middle;
    }


    /*#admin-menu{*/
    /*  display: flex;*/
    /*  flex-direction: column;*/
    /*  justify-content: space-between;*/

    /*  color: #005F5B;*/
    /*  font-size: 30px;*/
    /*  font-weight: 700;*/
    /*}*/
    /*#admin-menu>li{*/
    /*  margin-bottom: 35px;*/
    /*}*/
  </style>
</head>
<body>


<%--<c:choose>--%>
<%--<c:when test="${loginUser=='admin'}">--%>
<%--  <div class="side-bar">--%>
<%--    <ul id="admin-menu">--%>
<%--      <li><a>대시보드</a></li>--%>
<%--      <li><a>제품관리</a></li>--%>
<%--      <li><a>매출현황</a></li>--%>
<%--      <li><a>지점장 승인</a></li>--%>
<%--      <li><a>직원 승인</a></li>--%>
<%--      <li><a>입고처 관리</a></li>--%>
<%--      <li><a>직원 정보</a></li>--%>
<%--      <li><a>공지사항</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--</c:when>--%>
<%--<c:otherwise>--%>
<div class="side-bar">
  <ul id="menu">
    <li><a>대시보드</a></li>
    <li id="storage"><a>창고관리 <img src="/resources/listDown.svg"></a>
      <ul id="storage-list">
        <li><a>재고관리</a></li>
        <li><a>위치관리</a></li>
      </ul>
    </li>
    <li id="buying"><a>구매관리 <img src="/resources/listDown.svg"></a>
      <ul id="buying-list">
        <li><a>입고</a></li>
        <li><a>출고</a></li>
      </ul>
    </li>
    <li><a>매출관리</a></li>
    <li><a>근태관리</a></li>
    <li><a>공지사항</a></li>
  </ul>
</div>
<%--</c:otherwise>--%>
<%--</c:choose>--%>



</body>
</html>