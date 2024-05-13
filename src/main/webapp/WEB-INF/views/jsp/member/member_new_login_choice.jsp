<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    let login1 = {

        //최조실행 함수 정의
        personalInit: function () {
            //emptyChkFn 실행
            if (!this.emptyChkFn()) {
                return;
            }
            // register submit 실행
            this.personalFormSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn: function () {
            let valid = true;
            const form = document.getElementById("personalLoginForm");
            const inputs = form.querySelectorAll("input[type='text']");
            for (const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/, "");
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

        //개인폼 전송 함수 정의
        personalFormSubmit: function () {
            alert("개인 로그인")
            const formData = $("#personalLoginForm").serializeArray();

            console.log("formData;;; " + JSON.stringify(formData));

            // JSON 객체로 변환
            var jsonData = {};
            $.each(formData, function () {
                jsonData[this.name] = this.value;
            });

            const url = "/user/personalLoginUser";

            $.ajax({
                url: url, // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function (response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(response);
                    if (response.code === 'error') {
                        alert(response.message);
                    } else {
                        alert(response.message);
                        lacation.href = '/user/login'
                    }
                },
                error: function (xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    let login2 = {

        //최조실행 함수 정의
        businessInit: function () {
            //emptyChkFn 실행
            if (!this.emptyChkFn()) {
                return;
            }
            // register submit 실행
            this.businessFormSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn: function () {
            let valid = true;
            const form = document.getElementById("businessLoginForm");
            const inputs = form.querySelectorAll("input[type='text']");
            for (const input of inputs) {
                const removeBlankData = input.value.replace(/\s*/, "");
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

        // 기업 폼 전송 함수 정의
        businessFormSubmit: function () {
            alert("기업 로그인")
            const formData = $("#businessLoginForm").serializeArray();

            console.log("formData;;; " + JSON.stringify(formData));

            // JSON 객체로 변환
            var jsonData = {};
            $.each(formData, function () {
                jsonData[this.name] = this.value;
            });

            const url = "/user/businessLoginUser";

            $.ajax({
                url: url, // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function (response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(response);
                    if (response.code === 'error') {
                        alert(response.message);
                    } else {
                        alert(response.message);
                        lacation.href = '/user/login'
                    }
                },
                error: function (xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }

    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("personalButtonLogin").addEventListener("click",function () {
            login1.personalInit();
        });
    });

    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("businessButton_login").addEventListener("click",function () {
            login2.businessInit();
        });
    });

</script>
<div class="pagetitle">
    <h1>Profile</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item">Users</li>
            <li class="breadcrumb-item active">Profile</li>
        </ol>
    </nav>
</div>
<!-- End Page Title -->

<section class="section profile">
    <div class="row">

        <div class="col-xl-8">

            <div class="card">
                <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#personal_login"> 개인 로그인 </button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#business_login"> 기업 로그인 </button>
                        </li>


                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade pt-3" id="personal_login">
                            <!-- Change Password Form -->
                            <form class="row g-3 needs-validation"  id="personalLoginForm" name="personalLoginForm">

                                <div class="col-12">
                                    <label for="userId" class="form-label">아이디</label>
                                    <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" data-name="아이디" >
                                </div>

                                <div class="col-12">
                                    <label for="password" class="form-label">비밀번호</label>
                                    <input type="text" class="form-control" name="password" id="password" placeholder="비밀번호" data-name="비밀번호">
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="true" name="Checkbox" id="Checkbox" data-name="체크박스">
                                        <label class="form-check-label" for="Checkbox">Remember me</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100" type="button" name="personalButtonLogin" id="personalButtonLogin">Login</button>
                                </div>

                                <div class="col-12">
                                    <p class="small mb-0">회원이 아니신가요? <a href="user/login"> 회원가입 </a></p>
                                </div>
                            </form><!-- End Change Password Form -->

                        </div>

                        <div class="tab-pane fade pt-3" id="business_login">
                            <!-- Change Password Form -->
                            <form class="row g-3 needs-validation"  id="businessLoginForm" name=businessLoginForm">

                                <div class="col-12">
                                    <label for="userId" class="form-label">id</label>
                                    <div class="input-group has-validation">
                                        <input type="text" class="form-control" name="userId" id="userId" required>
                                        <div class="invalid-feedback">Please enter your username.</div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="text" class="form-control" name="password" Id="password" required>
                                    <div class="invalid-feedback">Please enter your password!</div>
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="true" name="Checkbox" id="Checkbox" data-name="체크박스">
                                        <label class="form-check-label" for="Checkbox">Remember me</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100" type="button" name="businessButton_login" id="businessButton_login">Login</button>
                                </div>

                                <div class="col-12">
                                    <p class="small mb-0">회원이 아니신가요? <a href="user/login"> 회원가입 </a></p>
                                </div>
                            </form><!-- End Change Password Form -->

                        </div>

                    </div><!-- End Bordered Tabs -->

                </div>
            </div>

        </div>
    </div>
</section>


<%--  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>--%>