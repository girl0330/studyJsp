<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    //로그인 실행
    let login = {

        //최조실행 함수 정의
        init : function () {
            if(!this.emptyChkFn() || !this.checkFn()) {
                return;
            }
            // register submit 실행
            this.formSubmit();

        },

        // 공백 검사 함수 정의
        emptyChkFn : function() {
            alert("1")
            let valid = true;
            const form = document.getElementById("loginForm");
            const inputs = form.querySelectorAll("input[type='text']");
            for(const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/,"");
                if (removeBlankData === "") {
                    let text = input.dataset.name;
                    alert(text + "text은/는 필수로 입력 값입니다.")
                    input.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        // 체크박스검사 함수
        checkFn : function () {
            alert("2")
            let valid = true;
            const form = document.getElementById("loginForm");
            const input = form.querySelector("input[type='checkbox']");
            // const isChecked = input.checked;
            // if (!isChecked) {
            //     alert("체크해 주세요");
            //     valid = false;
            //     return valid;
            // }
            let check = input.checked;
            if (check === false) {
                let text = input.dataset.name;
                alert(text + "체크가 필요합니다.")
                valid = false;
                return valid;
            }
        },

        //전송 함수 정의
        formSubmit : function() {
            const form = document.getElementById("loginForm");
            const formData = new FormData(form);

            // AJAX 요청 생성
            const xhr = new XMLHttpRequest();
            const url = "/board/registerInser";

            xhr.open("POST", url, true);

            //요청 완료 시 처리할 롤백 함수
            xml.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    console.log(xhr.responseText);//객체 xml로부터 응답받은 text를 console로 보여줌
                    window.location.href = '/board/boardList'
                } else {
                    console.log("전송실패");
                }
            };

            //폼 데이터 전송
            xhr.send(formData);
        }
    }


    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("button_login").addEventListener("click",function () {
            alert("?")
            login.init();
        });
    });
</script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Login - NiceAdmin Bootstrap Template</title>
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
                                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                    <p class="text-center small">Enter your username & password to login</p>
                                </div>

                                <form class="row g-3 needs-validation"  id="loginForm" name="loginForm">

                                    <div class="col-12">
                                        <label for="userId" class="form-label">id</label>
                                        <div class="input-group has-validation">
<%--                                            <span class="input-group-text" id="inputGroupPrepend">@</span>--%>
                                            <input type="text" name="userId" class="form-control" id="userId" required>
                                            <div class="invalid-feedback">Please enter your username.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="userPw" class="form-label">Password</label>
                                        <input type="text" name="userPw" class="form-control" Id="userPw" required>
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