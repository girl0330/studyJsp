<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    //로그인 실행
    let login = {

        //최조실행 함수 정의
        init : function () {
            if(!this.emptyChkFn()) {
                return;
            }
            // register submit 실행
            this.formSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn : function() {
            let valid = true;
            const form = document.getElementById("loginForm");
            const inputs = form.querySelectorAll("input[type='text']");
            for(const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/,"");
                if (removeBlankData === "") {
                    let text = input.dataset.name;
                    alert(text + "은/는 필수로 입력 값입니다.")
                    input.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        //전송 함수 정의
        formSubmit : function() {
            const form = document.getElementById("loginForm");
            const formData = new FormData(form);

            for (const pair of formData.entries()) {
                console.log("formdata;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" + pair[0] + ', ' + pair[1]);
            }
            // AJAX 요청 생성
            // const xhr = new XMLHttpRequest();
            const url = "/user/doLogin";

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
                        location.href='/';
                    }
                })
                .catch(error => {
                    // 오류 처리
                    console.error('There was a problem with the fetch operation:', error);
                });

            // //요청 완료 시 처리할 롤백 함수
            // xhr.onload = function () {
            //     if (xhr.status >= 200 && xhr.status < 300) {
            //         console.log(xhr.responseText);//객체 xml로부터 응답받은 text를 console로 보여줌
            //         window.location.href = '/board/boardList';
            //     } else {
            //         console.error("전송실패");
            //     }
            // };
            //
            // // 요청 실패 시 처리할 콜백 함수
            // xhr.onerror = function () {
            //     console.error("네트워크 오류");
            // };

            //폼 데이터 전송
            // xhr.send(formData);
        }
    }


    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("button_login").addEventListener("click",function () {
            login.init();
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
                                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                    <p class="text-center small">Enter your username & password to login</p>
                                </div>

                                <form class="row g-3 needs-validation"  id="loginForm" name="loginForm">

                                    <div class="col-12">
                                        <label for="userId" class="form-label">id</label>
                                        <div class="input-group has-validation">
                                            <input type="text" name="userId" class="form-control" id="userId" required>
                                            <div class="invalid-feedback">Please enter your username.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="text" name="password" class="form-control" Id="password" required>
                                        <div class="invalid-feedback">Please enter your password!</div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="remember" value="true" id="checkbox" data-name="체크박스">
                                            <label class="form-check-label" for="checkbox">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100" type="button" name="button_login" id="button_login">Login</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Don't have account? <a href="pages-register.html">Create an account</a></p>
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