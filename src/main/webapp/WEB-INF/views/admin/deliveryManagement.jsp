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

    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            font-family: "Noto Sans", sans-serif;
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
<jsp:include page="../common/header-admin.jsp"/>
<div class="container-fluid" style="margin-top: 130px">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="../common/sidebar-admin.jsp"/>
        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
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
                    <tr>
                        <td class="company-id">23</td>
                        <td class="company-name">뉴발란스</td>
                        <td class="business-rep">이민우</td>
                        <td class="phone-number">010-1111-2222</td>
                        <td class="address">강남대로 412 규정빌딩</td>
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
                    </tbody>
                </table>
            </div>
            <div class="bottom">
                <button onclick="enroll()">거래처 등록</button>
            </div>
            <div class="pagination">
                <a href="#" class="disabled">이전</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">다음</a>
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
                            <form id="editForm">
                                <div class="mb-3">
                                    <label for="companyid" class="form-label">거래처ID</label>
                                    <input type="text" class="form-control" id="companyid">
                                </div>
                                <div class="mb-3">
                                    <label for="companyname" class="form-label">거래처명</label>
                                    <input type="text" class="form-control" id="companyname">
                                </div>
                                <div class="mb-3">
                                    <label for="BusinessRep" class="form-label">사업자/대표</label>
                                    <input type="text" class="form-control" id="BusinessRep">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">전화번호</label>
                                    <input type="text" class="form-control" id="phone">
                                </div>
                                <div class="mb-3">
                                    <label for="repaddress" class="form-label">주소</label>
                                    <input type="text" class="form-control" id="repaddress">
                                </div>
                            </form>
                        </div>
                        <!-- 모달 푸터 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="saveChanges()">저장</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 수정 버튼 누를 시 나오는 모달 창 -->
            <div class="modal fade" id="enrollModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h5 class="modal-title" id="enrollmodalTitle">거래처 등록</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- 모달 본문 -->
                        <div class="modal-body">
                            <form id="enrolleditForm">
                                <div class="mb-3">
                                    <label for="companyid" class="form-label">거래처ID</label>
                                    <input type="text" class="form-control" id="enrollcompanyid">
                                </div>
                                <div class="mb-3">
                                    <label for="companyname" class="form-label">거래처명</label>
                                    <input type="text" class="form-control" id="enrollcompanyname">
                                </div>
                                <div class="mb-3">
                                    <label for="BusinessRep" class="form-label">사업자/대표</label>
                                    <input type="text" class="form-control" id="enrollBusinessRep">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">전화번호</label>
                                    <input type="text" class="form-control" id="enrollphone">
                                </div>
                                <div class="mb-3">
                                    <label for="repaddress" class="form-label">주소</label>
                                    <input type="text" class="form-control" id="enrollrepaddress">
                                </div>
                            </form>
                        </div>
                        <!-- 모달 푸터 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="">저장</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>


</body>
<script>
    function deletebtn(button) {
        // 삭제 버튼 클릭 시 모달 열기
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();

        // 확인 버튼 클릭 시 호출될 함수에 대한 설정
        document.getElementById("confirmDeleteBtn").onclick = function() {
            // 실제 삭제 작업을 여기서 처리 (예: 해당 행 삭제)
            var row = button.closest("tr");  // 삭제할 행 찾기
            row.remove();  // 행 삭제

            // 삭제 완료 후 모달 닫기
            deleteModal.hide();

            // 알림
            alert("거래처가 삭제되었습니다.");
        };
    }

    function showModal(button) {
        var row = button.closest("tr");

        // tr에서 각 셀 값 가져오기
        var companyId = row.cells[0].textContent.trim(); // 거래처 ID
        var companyName = row.cells[1].textContent.trim();
        var businessRep = row.cells[2].textContent.trim();
        var phone = row.cells[3].textContent.trim();
        var repAddress = row.cells[4].textContent.trim();

        // 모달 입력 필드에 값 설정
        document.getElementById("companyid").value = companyId;
        document.getElementById("companyname").value = companyName;
        document.getElementById("BusinessRep").value = businessRep;
        document.getElementById("phone").value = phone;
        document.getElementById("repaddress").value = repAddress;

        // 모달 띄우기
        var modal = new bootstrap.Modal(document.getElementById("editModal"));
        modal.show();
    }
    function saveChanges() {
        // 현재 열린 모달에서 수정된 데이터 가져오기
        var companyId = document.getElementById('companyid').value;
        var companyName = document.getElementById('companyname').value;
        var businessRep = document.getElementById('BusinessRep').value;
        var phoneNumber = document.getElementById('phone').value;
        var address = document.getElementById('repaddress').value;

        // 현재 수정 중인 행(tr) 찾기
        var row = document.querySelector(".editing-row");

        if (row) {
            // companyId를 기반으로 셀 업데이트
            row.cells[1].textContent = companyName;     // 거래처명
            row.cells[2].textContent = businessRep;     // 사업자/대표
            row.cells[3].textContent = phoneNumber;     // 전화번호
            row.cells[4].textContent = address;         // 주소

            // 수정 완료 후 클래스 제거
            row.classList.remove("editing-row");
        } else {
            alert("수정할 거래처 정보를 찾을 수 없습니다.");
        }

        // 모달 닫기
        var modalElement = document.getElementById("editModal");
        var modalInstance = bootstrap.Modal.getInstance(modalElement);
        modalInstance.hide();

        // 알림 메시지
        alert("거래처 정보가 수정되었습니다.");
    }

    function enroll() {
        var enrollmodal = new bootstrap.Modal(document.getElementById('enrollModal'));
        enrollmodal.show();
    }

</script>
</html>