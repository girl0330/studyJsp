<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    // 로그인 실행
    let register = {

        //최초실행 함수 정의
        init : function () {
            if(!this.emptyChkFn() || !this.checkFn()) {
                return;
            }

            // register submit 실행
            this.formSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn : function () {
            alert("공백검사")
            let valid = true;
            const form = document.getElementById("insertForm"); // 해당 id가 포함된 요소를 form에 담는다.
            const inputs = form.querySelectorAll("input[type='text']"); //form에 type이 text인 요소들을 inputs에 담는다.
            //text 공백 없애기
            for(const input of inputs) { //inputs에 담긴 요소의 개수만큼 반복해서 input에 담는다.
                const removeBlankData = input.value.replace(/\s*/, ""); //input에 담긴 각 요소들의 value(값)들의 공백을 ""로 바꿔서 removeBlankData에 담는다.
                if (removeBlankData === "") {//변수에 값이 ""이면 실행한다.
                    let text = input.dataset.name; //input요소의 데이터 속성중에 name이라는 데이터 속성을 가져와서 text에 담는다.
                    alert(text + "은/는 필수 입력 값입니다.");
                    input.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        // 체크 검사 함수 정의
        checkFn : function () {
            alert("체크 검사")
            let valid = true;
            const form = document.getElementById("insertForm");
            const checkBox = form.querySelector("input[type='checkbox']");
            const isChecked = checkBox.checked;
            if (!isChecked) {
                alert("체크해 주세요");
                valid = false;
                return valid;
            }
            return valid;
        },


        // 전송 함수 정의
        formSubmit   : function() {
            alert("전송함수")
            const form = document.getElementById('insertForm');
            const formData = new FormData(form);

            // FormData 객체 확인
            for (const pair of formData.entries()) {
                console.log("삥뽕;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" + pair[0] + ', ' + pair[1]);
            }

            // AJAX 요청 생성
            const xhr = new XMLHttpRequest();
            const url = "/user/registerInsert"; // 컨트롤러 URL을 여기에 입력하세요

            xhr.open("POST", url, true); //요청을 초기화 한다

            // 요청 완료 시 처리할 콜백 함수
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {//http응답 상태 코드
                    // 요청이 성공했을 때의 처리
                    console.log("전송 성공!");
                    console.log(xhr.responseText); // 서버에서 온 응답 확인
                    window.location.href = '/user/login';
                } else {
                    // 요청이 실패했을 때의 처리
                    console.error("전송 실패");
                }
            };

            // 요청 실패 시 처리할 콜백 함수
            xhr.onerror = function () {
                console.error("네트워크 오류");
            };

            // 폼 데이터 전송
            xhr.send(formData);
        }
    }

    //DOM이 실행 후 실행 됨
    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("button_register").addEventListener("click",function () {
            alert("?")
            register.init();
        });
    });

</script>

    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <a href="index.html" class="logo d-flex align-items-center w-auto">
                                <img src="../assets/img/logo.png" alt="">
                                <span class="d-none d-lg-block">NiceAdmin</span>
                            </a>
                        </div><!-- End Logo -->

                        <div class="card mb-3">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                    <p class="text-center small">Enter your personal details to create account</p>
                                </div>

                                <form class="row g-3 needs-validation" id="insertForm" name="insertForm">
                                    <div class="col-12">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="text" name="userId" class="form-control" id="userId" data-name="아이디" >
                                        <div class="invalid-feedback">Please, enter your name!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="userEmail" class="form-label">이메일</label>
                                        <input type="text" name="userEmail" class="form-control" id="userEmail" data-name="이메일">
                                        <div class="invalid-feedback">Please enter a valid Email add  dress!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="userName" class="form-label">이름</label>
                                        <div class="input-group has-validation">
                                            <%--                                            <span class="input-group-text" id="inputGroupPrepend">@</span>--%>
                                            <input type="text" name="userName" class="form-control" id="userName" data-name="이름" >
                                            <div class="invalid-feedback">Please choose a username.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="userPw" class="form-label">비밀번호</label>
                                        <input type="text" name="userPw" class="form-control" id="userPw" data-name="비밀번호">
                                        <div class="invalid-feedback">Please enter your password!</div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" name="terms" type="checkbox" value="" id="terms" >
                                            <label class="form-check-label" for="terms">I agree and accept the <a href="#">terms and conditions</a></label>
                                            <div class="invalid-feedback">You must agree before submitting.</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-primary w-100" id="button_register" name="button_register">회원가입 하기</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Already have an account? <a href="pages-login.html">Log in</a></p>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <div class="credits">
                            <!-- All the links in the footer should remain intact. -->
                            <!-- You can delete the links only if you purchased the pro version. -->
                            <!-- Licensing information: https://bootstrapmade.com/license/ -->
                            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>