<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    // 로그인 실행
    let login = {

        //최초실행 함수 정의
        init : function () {
            if(!this.emptyChkFn()) {
                return;
            }
            // login submit 실행
            this.formSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn : function () {
            let valid = true;
            const form = document.getElementById("insertForm");
            const inputs = form.querySelectorAll("input[type='text']");
            //text 공백 없애기
            for(const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/, "");
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

        // 전송 함수 정의
        formSubmit : function () {
            const form = document.getElementById('insertForm');
            const formData = new FormData(form);

            // AJAX 요청 생성
            const xhr = new XMLHttpRequest();
            const url = "/board/registerInsert";

            xhr.open("POST", url, true);

            // 요청 완료 시 처리할 롤백 함수
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                //요청 성공 처리
                    console.log("로그인 관련 전송 성공!!");
                    console.log(xhr.responseText);
                    window.location.href = '/board/boardList'
                } else {
                //요청 실패 처리
                    console.error("전송 실패");
                }
            };

            // 요청 실패시 처리할 롤백 함수
            xhr.onerror = function () {
                console.error("네트워크 오류");
            };

            // 폼 데이터 전송
            xhr.send(formData);
        }
    }

    //DOM이 실행 후 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("button_register").addEventListener("click",function () {
            login.init();
        });
    });

</script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Register - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon">
    <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: NiceAdmin
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Updated: Mar 17 2024 with Bootstrap v5.3.3
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<main>
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
                                        <label for="id" class="form-label">아이디</label>
                                        <input type="text" name="id" class="form-control" id="id" data-name="아이디" >
                                        <div class="invalid-feedback">Please, enter your name!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="email" class="form-label">이메일</label>
                                        <input type="text" name="email" class="form-control" id="email" data-name="이메일">
                                        <div class="invalid-feedback">Please enter a valid Email add  dress!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="username" class="form-label">이름</label>
                                        <div class="input-group has-validation">
<%--                                            <span class="input-group-text" id="inputGroupPrepend">@</span>--%>
                                            <input type="text" name="username" class="form-control" id="username" data-name="이름" >
                                            <div class="invalid-feedback">Please choose a username.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="password" class="form-label">비밀번호</label>
                                        <input type="text" name="password" class="form-control" id="password" data-name="비밀번호">
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
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/chart.js/chart.umd.js"></script>
<script src="../assets/vendor/echarts/echarts.min.js"></script>
<script src="../assets/vendor/quill/quill.min.js"></script>
<script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="../assets/vendor/tinymce/tinymce.min.js"></script>
<script src="../assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../assets/js/main.js"></script>

</body>

</html>