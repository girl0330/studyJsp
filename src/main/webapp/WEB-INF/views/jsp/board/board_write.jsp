<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

    // 글작성 실행
    let write = {

        //초기화 or 최초실행
        init : function(){
            if(!this.emptyChkFn()){
                return;
            }

            //전송 실행
            this.formSubmit();
        },

        //공백 검사 함수 정의
        emptyChkFn   : function() {
            let valid = true;
            const form = document.getElementById("insertForm");
            const inputs = form.querySelectorAll("input[type='text']");

            for (const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/, ""); //(Regex.blank),"")
                if (removeBlankData === "") {
                    let text = input.dataset.name;
                    alert(text + "은/는 필수 입력 값입니다.");
                    input.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        //전송 함수 정의
        formSubmit   : function() {
            const form = document.getElementById('insertForm');
            const formData = new FormData(form);

            // FormData 객체 확인
            for (const pair of formData.entries()) {
                // alert(pair[0] + ', ' + pair[1])
            }

            // AJAX 요청 생성
            const url = "/board/boardInsert"; // 컨트롤러 URL을 여기에 입력하세요

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
                    console.log('Data uploaded:', data);
                    if(data.code === 'error') {
                        alert(data.message);
                    } else {
                        alert(data.message);
                        location.href='/board/boardList';
                    }
                })
                .catch(error => {
                    // 오류 처리
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    }

    //DOM이 실행 후 안의 내용이 실행 됨
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("button_insert").addEventListener("click" ,function(){
            write.init();
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
                        <form class="row g-3" id="insertForm" name="insertForm">
                            <div class="col-12">
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" id="title" name="title" data-name="제목">
                            </div>
                            <div class="col-12">
                                <label for="content" class="form-label">내용</label>
                                <input type="text" class="form-control" id="content" name="content" data-name="내용">
                            </div>
<%--                            <div class="col-12">--%>
<%--                                <label for="systemRegistrarId" class="form-label">작성자</label>--%>
<%--                                <input type="text" class="form-control" id="systemRegistrarId" name="systemRegistrarId" data-name="작성자">--%>
<%--                            </div>--%>
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" id="button_insert" name="button_insert">등록</button>
                                <button type="button" class="btn btn-secondary" id="button_textHold" name="button_textHold">임시저장</button>
                            </div>
                        </form><!-- Vertical Form -->

                    </div>
                </div>
            </div>
        </div>
    </section>
