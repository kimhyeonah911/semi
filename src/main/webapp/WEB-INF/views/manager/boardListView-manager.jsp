<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
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
            padding-top: 130px;
        }

        tr th,td{
            text-align: center;
        }

        tbody{
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header-manager.jsp"/>
<div class="container-fluid">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar-manager.jsp"/>

        <!-- Main content -->
        <main>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">공지사항</h1>
            </div>

            <div>
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
                    <tr onclick="showModal('관리자', '각 지점별 철저히 재고확인', '본사', '2025-03-19', '수정중입니다.')">
                        <td>필독📢</td>
                        <td>관리자</td>
                        <td>각 지점별 철저히 재고확인</td>
                        <td>본사</td>
                        <td>2025-03-19</td>
                        <td></td>
                    </tr>
                    <tr onclick="showModal('manager4', '이번 주 토요일(3/23) 매장 운영시간 변경', '학동점', '2025-03-17', '운영시간 변경')">
                        <td>1</td>
                        <td>manager4</td>
                        <td>이번 주 토요일(3/23) 매장 운영시간 변경</td>
                        <td>학동점</td>
                        <td>2025-03-17</td>
                        <td></td>
                    </tr>
                    <tr onclick="showModal('manager2', '지점 행사 및 프로모션 공지', '한남점', '2025-03-11', '할인 행사 예정')">
                        <td>2</td>
                        <td>manager2</td>
                        <td>지점 행사 및 프로모션 공지</td>
                        <td>한남점</td>
                        <td>2025-03-11</td>
                        <td><button class="btn btn-sm btn-outline-primary">수정</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-end mt-3">
                <button class="btn btn-primary" onclick="location.href='/managerenroll.bo'">✏️ 글쓰기</button>
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


<!-- Bootstrap JS (이 부분은 별도로 로드) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showModal(author, title, branch, date, content) {
        document.getElementById('author').value = author;
        document.getElementById('title').value = title;
        document.getElementById('branch').value = branch;
        document.getElementById('date').value = date;
        document.getElementById('content').value = content;

        var modalElement = document.getElementById('noticeModal');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }
</script>
</body>
