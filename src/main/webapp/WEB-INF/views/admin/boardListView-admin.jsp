<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
        }

        tr th,td{
            text-align: center;
        }
        .table th:nth-child(1),
        .table td:nth-child(1) {
            width: 10%;
            text-align: center;
        }
        .table th:nth-child(2),
        .table td:nth-child(2) {
            width: 15%;
            padding-left: 20px;
        }
        .table th:nth-child(3),
        .table td:nth-child(3) {
            width: 30%;
            padding-left: 20px;
        }
        .table th:nth-child(4),
        .table td:nth-child(4) {
            width: 15%;
            text-align: center;
        }
        .table th:nth-child(5),
        .table td:nth-child(5) {
            width: 20%;
            text-align: center;
        }
        .table th:nth-child(6),
        .table td:nth-child(6) {
            width: 10%;
            text-align: center;
        }
        tbody{
            cursor: pointer;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header-admin.jsp"/>
<div class="container-fluid">
    <!-- Sidebar -->
    <jsp:include page="../common/sidebar-admin.jsp"/>

    <!-- Main content -->
    <main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">공지사항</h1>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>소속지점</th>
                    <th>작성날짜</th>
                    <th>작업</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="b" items="${board}">
                    <c:set var="formattedDate">
                        <fmt:formatDate value="${b.createDate}" pattern="yyyy-MM-dd" />
                    </c:set>
                    <tr onclick="showModal('${b.memId}', '${b.boardTitle}', '${b.storeName}', '${formattedDate}', '${b.boardContent}')"
                        class="${b.memId == 'admin' ? 'important-notice' : ''}">
                        <td>${b.memId == 'admin' ? '필독📢' : b.boardNo}</td>
                        <td>${b.memId}</td>
                        <td>${b.boardTitle}</td>
                        <td>${b.storeName}</td>
                        <td>${formattedDate}</td>
                        <td>
                            <form method="post" action="/delete.bo" style="display:inline;">
                                <input type="hidden" name="boardNo" value="${b.boardNo}" />
                                <button type="submit" class="btn btn-sm btn-outline-danger" onclick="event.stopPropagation(); return confirm('정말 삭제하시겠습니까?');">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-end mt-3">
            <button class="btn btn-primary" onclick="location.href='/enroll.bo'">✏️ 글쓰기</button>
        </div>
        <div class="pagebar-container mt-3">
            <jsp:include page="../common/pagebar.jsp"/>
        </div>
    </main>
</div>

<!-- 모달 창 -->
<div class="modal fade" id="noticeModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">게시글 보기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="noticeForm">
                    <div class="mb-3">
                        <label for="author" class="form-label">작성자:</label>
                        <input type="text" id="author" class="form-control" readonly />
                    </div>
                    <div class="mb-3">
                        <label for="title" class="form-label">제목:</label>
                        <input type="text" id="title" class="form-control" readonly />
                    </div>
                    <div class="mb-3">
                        <label for="branch" class="form-label">소속지점:</label>
                        <input type="text" id="branch" class="form-control" readonly />
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">작성날짜:</label>
                        <input type="text" id="date" class="form-control" readonly />
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용:</label>
                        <textarea id="content" class="form-control" rows="4" readonly></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">수정 완료</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">공지사항 삭제</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말 이 공지사항을 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" onclick="deleteBoard()">삭제</button>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS (이 부분은 별도로 로드) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showModal(memId, boardTitle, storeName, createDate, boardContent) {
        document.getElementById("author").value = memId;
        document.getElementById("title").value = boardTitle;
        document.getElementById("branch").value = storeName;
        document.getElementById("date").value = createDate;
        document.getElementById("content").value = boardContent;

        var modalElement = document.getElementById('noticeModal');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }

    window.onload = function() {
        var msg = '<c:out value="${sessionScope.alertMsg}"/>';
        if (msg) {
            alert(msg);
            <% session.removeAttribute("alertMsg"); %>
        }
    };



</script>
</body>
