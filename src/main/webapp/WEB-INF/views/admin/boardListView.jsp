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
        .editbtn {
            margin-left: 5px; /* 버튼 간 간격 조절 */
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
                    <tr onclick="showModal('${b.boardNo}', '${b.memId}', '${b.boardTitle}', '${b.storeName}', '${formattedDate}', '${b.boardContent}', '${b.boardNo}')">
                        <td>${b.memId == 'admin' ? '필독📢' : b.boardNo}</td>
                        <td>${b.memId}</td>
                        <td>${b.boardTitle}</td>
                        <td>${b.storeName}</td>
                        <td>${formattedDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${loginUser.position == 'admin' and loginUser.memId == b.memId}">
                                    <form method="post" action="/delete.bo" style="display:inline;">
                                        <input type="hidden" name="boardNo" value="${b.boardNo}" />
                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                                onclick="event.stopPropagation(); return confirm('정말 삭제하시겠습니까?');">
                                            삭제
                                        </button>
                                    </form>
                                    <button onclick="event.stopPropagation(); editModal('${b.boardNo}', '${b.memId}', '${b.boardTitle}', '${b.storeName}', '${formattedDate}', '${b.boardContent}', '${b.boardNo}')"
                                            class="btn btn-sm btn-outline-primary">
                                        수정
                                    </button>
                                </c:when>

                                <c:when test="${loginUser.position == 'manager' and loginUser.memId == b.memId}">
                                    <form method="post" action="/delete.bo" style="display:inline;">
                                        <input type="hidden" name="boardNo" value="${b.boardNo}" />
                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                                onclick="event.stopPropagation(); return confirm('정말 삭제하시겠습니까?');">
                                            삭제
                                        </button>
                                    </form>
                                    <button onclick="event.stopPropagation(); editModal('${b.boardNo}', '${b.memId}', '${b.boardTitle}', '${b.storeName}', '${formattedDate}', '${b.boardContent}', '${b.boardNo}')"
                                            class="btn btn-sm btn-outline-primary">
                                        수정
                                    </button>
                                </c:when>
                            </c:choose>
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

<!-- 게시글 상세보기 모달 창 -->
<div class="modal fade" id="noticedetailModal" tabindex="-1" aria-labelledby="noticedetailTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="noticedetailTitle">게시글 상세보기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="noticedetailForm" action="/noticeupdate.bo" method="post">
                    <div class="mb-3">
                        <label for="noticedetailBoardNo" class="form-label">게시글 번호:</label>
                        <input type="text" id="noticedetailBoardNo" name="boardNo" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="noticedetailAuthor" class="form-label">작성자:</label>
                        <input type="text" id="noticedetailAuthor" name="author" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="noticedetailTitleInput" class="form-label">제목:</label>
                        <input type="text" id="noticedetailTitleInput" name="boardTitle" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="noticedetailBranch" class="form-label">소속지점:</label>
                        <input type="text" id="noticedetailBranch" name="branch" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="noticedetailDate" class="form-label">작성날짜:</label>
                        <input type="text" id="noticedetailDate" name="date" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="noticedetailContent" class="form-label">내용:</label>
                        <textarea id="noticedetailContent" name="boardContent" class="form-control" rows="4" readonly></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 수정 모달 창 -->
<div class="modal fade" id="noticeModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">게시글 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="noticeForm" action="/noticeupdate.bo" method="post">
                    <div class="mb-3">
                        <label for="editBoardNo" class="form-label">게시글 번호:</label>
                        <input type="text" id="editBoardNo" name="boardNo" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="editAuthor" class="form-label">작성자:</label>
                        <input type="text" id="editAuthor" name="author" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="editTitle" class="form-label">제목:</label>
                        <input type="text" id="editTitle" name="boardTitle" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="editBranch" class="form-label">소속지점:</label>
                        <input type="text" id="editBranch" name="branch" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="editDate" class="form-label">작성날짜:</label>
                        <input type="text" id="editDate" name="date" class="form-control" readonly/>
                    </div>
                    <div class="mb-3">
                        <label for="editContent" class="form-label">내용:</label>
                        <textarea id="editContent" name="boardContent" class="form-control" rows="4"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">수정 완료</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </form>
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
    function editModal(boardNo, memId, boardTitle, storeName, createDate, boardContent) {
        document.getElementById("editBoardNo").value = boardNo;
        document.getElementById("editAuthor").value = memId;
        document.getElementById("editTitle").value = boardTitle;
        document.getElementById("editBranch").value = storeName;
        document.getElementById("editDate").value = createDate;
        document.getElementById("editContent").value = boardContent;

        var modalElement = document.getElementById('noticeModal');
        if (!modalElement) {
            console.error("수정 모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }


    function showModal(boardNo, memId, boardTitle, storeName, createDate, boardContent) {
        document.getElementById("noticedetailBoardNo").value = boardNo;
        document.getElementById("noticedetailAuthor").value = memId;
        document.getElementById("noticedetailTitleInput").value = boardTitle;
        document.getElementById("noticedetailBranch").value = storeName;
        document.getElementById("noticedetailDate").value = createDate;
        document.getElementById("noticedetailContent").value = boardContent;

        var modalElement = document.getElementById('noticedetailModal');
        if (!modalElement) {
            console.error("상세보기 모달 요소를 찾을 수 없습니다!");
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
