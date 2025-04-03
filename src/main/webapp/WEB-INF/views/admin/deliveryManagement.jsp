<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래처 관리, 수정, 삭제</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 85.3%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
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
            font-size: 18px;
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
        .delete-buttons button {
            margin: 0 5px;
            padding: 5px 10px;
            font-size: 16px;
            background: red;
            border: none;
        }

        .modal-body form .form-control {
            font-size: 16px;
        }

        .modal-footer button {
            font-size: 16px;
        }
        #modalCategory, #enrollmodalCategory, #입고처 {
            width: 100px;  /* 원하는 너비로 조정 */
        }
        #enrollImage{
            width: 100px;
        }

        .main-content {
            padding-left: 2rem;
            padding-right: 2rem;
        }

        .mb-3 {
            display: flex;
            gap: 20px; /* 요소들 간 간격을 20px로 설정 */
            align-items: center; /* 세로 중앙 정렬 */
            margin-bottom: 10px;
        }

        .form-select, input[type="text"], button {
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 220px; /* 너비를 동일하게 설정 */
            box-sizing: border-box;
        }

        .form-select:focus, input[type="text"]:focus {
            border-color: #00A69F;
            outline: none;
        }


        button {
            background-color: #00A69F;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 220px; /* 버튼도 동일한 너비로 설정 */
        }

        button:hover {
            background-color: #008F8B;
        }
        .delete-buttons button:hover {
            background-color: #cc0000;
        }
        .bottom{
            display: flex;
            justify-content: center; /* 버튼을 가운데 정렬 */
            gap: 15px; /* 버튼 사이 간격 */
            margin-top: 30px;
            padding: 15px;
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
            <h1 class="h2">입고처 관리</h1>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>거래처ID</th>
                    <th>거래처명</th>
                    <th>사업자/대표</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${client}">
                    <tr data-client-id="${c.clientId}">
                        <td>${c.clientId}</td>
                        <td>${c.clientName}</td>
                        <td>${c.clientCeo}</td>
                        <td>${c.clientPhone}</td>
                        <td>${c.clientAddress}</td>
                        <td class="action-buttons">
                            <button class="approve-btn btn btn-success" onclick="showModal(this)">
                                <i class="fas fa-edit"></i></button>
                        </td>
                        <td class="delete-buttons">
                            <button class="approve-btn btn btn-danger" onclick="deletebtn(this)">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="bottom">
            <button onclick="enroll()">거래처 등록</button>
        </div>
        <div class="pagebar-container mt-3">
            <jsp:include page="../common/pagebar.jsp"/>
        </div>

        <!-- 등록 버튼 누를 시 나오는 모달 창 -->
        <div class="modal fade" id="enrollModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="enrollmodalTitle">거래처 등록</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- 모달 본문 -->
                    <form id="enrolleditForm" action="insert.cl" method="POST">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="enrollClientId" class="form-label">거래처ID</label>
                                <input type="text" class="form-control" id="enrollClientId" placeholder="자동생성" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="enrollClientName" class="form-label">거래처명</label>
                                <input type="text" class="form-control" id="enrollClientName" name="clientName">
                            </div>
                            <div class="mb-3">
                                <label for="enrollClientCeo" class="form-label">사업자/대표</label>
                                <input type="text" class="form-control" id="enrollClientCeo" name="clientCeo">
                            </div>
                            <div class="mb-3">
                                <label for="enrollClientPhone" class="form-label">전화번호</label>
                                <input type="text" class="form-control" id="enrollClientPhone" name="clientPhone">
                            </div>
                            <div class="mb-3">
                                <label for="enrollClientAddress" class="form-label">주소</label>
                                <input type="text" class="form-control" id="enrollClientAddress" name="clientAddress">
                            </div>
                        </div>
                        <!-- 모달 푸터 -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">저장</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 수정 버튼 누를 시 나오는 모달 창 -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">거래처 수정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- 모달 본문 -->
                    <div class="modal-body">
                            <div class="mb-3">
                                <label for="editClientId" class="form-label">거래처ID</label>
                                <input type="text" class="form-control" id="editClientId" name="clientId" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="editClientName" class="form-label">거래처명</label>
                                <input type="text" class="form-control" id="editClientName" name="clientName">
                            </div>
                            <div class="mb-3">
                                <label for="editClientCeo" class="form-label">사업자/대표</label>
                                <input type="text" class="form-control" id="editClientCeo" name="clientCeo">
                            </div>
                            <div class="mb-3">
                                <label for="editClientPhone" class="form-label">전화번호</label>
                                <input type="text" class="form-control" id="editClientPhone" name="clientPhone">
                            </div>
                            <div class="mb-3">
                                <label for="editClientAddress" class="form-label">주소</label>
                                <input type="text" class="form-control" id="editClientAddress" name="clientAddress">
                            </div>
                    </div>
                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="saveChanges()">저장</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 삭제 확인 모달 -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">거래처 삭제 확인</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        정말 거래처를 삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>


</body>
<script>
    // 거래처 등록 모달 생성
    function enroll() {
        var enrollmodal = new bootstrap.Modal(document.getElementById('enrollModal'));
        enrollmodal.show();
    }

    // 거래처 수정 모달 생성
    function showModal(button) {
        var row = button.closest("tr");

        // tr에서 각 셀 값 가져오기
        var clinetId = row.cells[0].textContent.trim(); // 거래처 ID
        var clientName = row.cells[1].textContent.trim();
        var clientCeo = row.cells[2].textContent.trim();
        var clientPhone = row.cells[3].textContent.trim();
        var clientAddress = row.cells[4].textContent.trim();

        // 모달 입력 필드에 값 설정
        document.getElementById("editClientId").value = clinetId;
        document.getElementById("editClientName").value = clientName;
        document.getElementById("editClientCeo").value = clientCeo;
        document.getElementById("editClientPhone").value = clientPhone;
        document.getElementById("editClientAddress").value = clientAddress;

        // 모달 띄우기
        var modal = new bootstrap.Modal(document.getElementById("editModal"));
        modal.show();
    }

    // 거래처 수정 ajax 및 즉시 반영
    function saveChanges() {
        var clientId = document.getElementById('editClientId').value;
        var clientName = document.getElementById('editClientName').value;
        var clientCeo = document.getElementById('editClientCeo').value;
        var clientPhone = document.getElementById('editClientPhone').value;
        var clientAddress = document.getElementById('editClientAddress').value;

        $.ajax({
            type: "POST",
            url: "api/update.cl", // 서버 엔드포인트
            data: {
                clientId: clientId,
                clientName: clientName,
                clientCeo: clientCeo,
                clientPhone: clientPhone,
                clientAddress: clientAddress
            },
            success: function(response) {
                if (response === "success") {
                    // 테이블에서 해당 거래처 정보 수정
                    var row = findRowByClientId(clientId);

                    if (row) {
                        row.cells[1].textContent = clientName;
                        row.cells[2].textContent = clientCeo;
                        row.cells[3].textContent = clientPhone;
                        row.cells[4].textContent = clientAddress;
                    }

                    document.getElementById('editClientName').value = clientName;
                    document.getElementById('editClientCeo').value = clientCeo;
                    document.getElementById('editClientPhone').value = clientPhone;
                    document.getElementById('editClientAddress').value = clientAddress;

                    // 알림 메시지
                    alert("수정이 완료되었습니다.");
                } else {
                    alert("수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버와의 통신에 실패했습니다.");
            }
        });
    }

    // 거래처 수정 후 테이블 즉시 반영
    function findRowByClientId(clientId) {
        var rows = document.querySelectorAll("tr[data-client-id]");
        for (var i = 0; i < rows.length; i++) {
            if (rows[i].getAttribute("data-client-id") === clientId.toString()) {
                return rows[i];
            }
        }
        return null;
    }

    // 거래처 삭제 모달 생성 및 삭제 ajax
    function deletebtn(button) {
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();

        document.getElementById("confirmDeleteBtn").onclick = function() {
            // 삭제할 행(tr) 찾기 및 clientId 가져오기
            var row = button.closest("tr");
            var clientId = row.getAttribute("data-client-id");

            // AJAX 요청으로 서버에 삭제 요청 전송
            $.ajax({
                type: "POST",
                url: "api/delete.cl",
                data: { clientId: clientId },
                success: function(response) {
                    if (response === "success") {
                        // 서버 삭제 성공 시 UI에서 행 삭제
                        row.remove();
                        alert("거래처가 삭제되었습니다.");
                    } else {
                        alert("삭제에 실패했습니다.");
                    }
                },
                error: function() {
                    alert("서버와의 통신에 실패했습니다.");
                }
            });

            deleteModal.hide();
        };
    }
</script>
</html>