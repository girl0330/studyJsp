<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    //update 공백 검사 실행
    let update = {
        //최초실행
        init : function () {
            if(!this.emptyChkFn()){
                return;
            }

            //전송 실행
            this.formSubmit();
        },

        //고백 검사 함수 정의
        emptyChkFn : function () {
            let valid = true;
            const form = document.getElementById("updateForm")
            const updates = form.querySelectorAll("input [type='text']");

            for(const update of updates) {
                const removeBlankDate = update.value.replace(/\s*/, "");
                if (removeBlankDate === "") {
                    let text = update.dataset.name;
                    alert(text + "은/는 필수 입력 값입니다.");
                    update.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        //전송 함수 정의
        formSubmit : function () {
            const form = document.getElementById('updateForm');
            const formData = new FormData(form);

            // FormData 객체 확인
            for (const pair of formData.entries()) {
                console.log(pair[0] + ', ' + pair[1])
            }

            const url = "/board/boardUpdate";


            fetch(url, {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Received data:', data);
                    if(data.code === 'success') {
                        alert(data.message);
                        location.href='/board/boardList'
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    }


    function listDelete(id) {
        alert(id+ "을/를 삭제합니다.")
        const url ="/board/boardDelete?id=";
        window.location.href = url+id;
    }


    //DOM 실행 후 안의 내용이 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("button_update").addEventListener("click", function () {
            update.init();
        });
    });

</script>

    <div class="pagetitle">
        <h1>Form Layouts</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Forms</li>
                <li class="breadcrumb-item active">Layouts</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Vertical Form</h5>

                        <!-- Vertical Form -->
                        <%--                        <form class="row g-3" action="/boardupdate" method="POST">--%>
                        <form class="row g-3" id="updateForm" name="updateForm">
                            <input type="hidden" id="boardNo" name="boardNo" value="${detail.boardNo}">
                            <div class="col-12">
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" id="title" name="title" value="${detail.title}" data-name="제목">
                            </div>
                            <div class="col-12">
                                <label for="content" class="form-label">내용</label>
                                <input type="text" class="form-control" id="content" name="content" value="${detail.content}" data-name="내용">
                            </div>
                            <div class="col-12">
                                <label for="systemRegistrarId" class="form-label">작성자</label>
                                <input type="text" class="form-control" id="systemRegistrarId" name="systemRegistrarId" value="${detail.systemRegistrarId}" data-name="작성자">
                            </div>
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" id="button_update" name="button_update">수정</button>
                                <button type="button" onclick="listDelete(${detail.boardNo})" class="btn btn-secondary">삭제</button>
<%--                                <a th:href="@{/board/delete(id=${board.id})}">글 삭제</a>--%>
                            </div>
                        </form><!-- Vertical Form -->

                    </div>
                </div>
            </div>
        </div>
    </section>
