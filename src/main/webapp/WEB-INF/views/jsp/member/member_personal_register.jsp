<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--import {al} from "../../../../../resources/static/assets/vendor/chart.js/chunks/helpers.segment";--%>
<script>
    // 로그인 실행
    let register = {

        //최초실행 함수 정의
        init : function () {

            if(!this.emptyChkFn() || !this.checkFn()) {
                return;
            }

            this.idValidation();

            // register submit 실행
            this.formSubmit();
        },

        // 공백 검사 함수 정의
        emptyChkFn : function () {
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

        idValidation : function () {
            // 입력창 정보 가져오기
            let valid = true;
            const userPassword1 = $('#password').val(); // 비밀번호1
            const userPassword2 = $('#password2').val(); // 비밀번호2
            const userId = $('#userId').val();
            console.log("id확인"+ userId);
            console.log("데이터 확인"+userPassword1+","+userPassword2)

            let idRegex = /^[a-zA-Z0-9]+$/;

            if (!idRegex.test(userId)) {
                alert("아이디 형식을 확인해주세요")
                valid = true;
                return valid;
            }

            if (userId.length > 12 || userId.length < 2) {
                alert("아이디를 2~12자로 사용해주세요")
                valid = false;
                return valid;
            }

            let passwordRegex = /^[a-zA-z0-9.@$!%*?&]+$/;
            if (!passwordRegex.test(userPassword1)) {
                alert("비밀번호 형식을 확인해주세요")
                valid = true;
                return valid;
            }

            if (userPassword1.length > 15 || userPassword1.length < 8) {
                alert("비밀번호를 8~15자로 사용해주세요")
                valid = false;
                return valid;
            }

            if (userPassword1 !== userPassword2) {
                alert("비밀번호가 일치 하지 않습니다.")
                valid = false;
                return valid;
            }

        },

        // 체크 검사 함수 정의
        checkFn : function () {
            let valid = true;
            const form = document.getElementById("insertForm");
            const checkBox = form.querySelector("input[type='checkbox']");
            const isChecked = checkBox.checked;

            if (!isChecked) {
                alert("동의여부는 필수 입력 값입니다.");
                valid = false;
                return valid;
            }
            return valid;
        },

        // 전송 함수 정의
        formSubmit   : function() {
            const formData = $("#insertForm").serializeArray();

            console.log("x:::  "+JSON.stringify(formData));

            // JSON 객체로 변환
            var jsonData = {};
            $.each(formData, function() {
                jsonData[this.name] = this.value;
            });
            // 체크박스 값 추가
            jsonData['terms'] = $('#terms').is(':checked');

            const url = "/user/signupUserInsert";

            $.ajax({
                url: url, // Spring 컨트롤러 URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jsonData), // JSON 형식으로 데이터 전송
                success: function(response) {
                    // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
                    console.log(response);
                    if (response.code === 'error') {
                        alert(response.message);
                    } else {
                        alert(response.message);
                        lacation.href='/user/login'
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행할 코드
                    console.error(error);
                }
            });
        }
    }


    //DOM이 실행 후 실행 됨
    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById("button_register").addEventListener("click",function () {
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
                                    <h5 class="card-title text-center pb-0 fs-4">개인회원가입</h5>
                                    <p class="text-center small">Enter your personal details to create account</p>
                                </div>

                                <form class="row g-3 needs-validation" id="insertForm" name="insertForm">
                                    <input type="hidden" name="gradeCode" id="gradeCode" value="10">
                                        <div class="col-12">
                                            <label for="userId" class="form-label">아이디</label>
                                            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 [2~10자 영문, 숫자]" data-name="아이디" >
                                        </div>

                                        <div class="col-12">
                                            <label for="password" class="form-label">비밀번호</label>
                                            <input type="text" class="form-control" name="password" id="password" placeholder="8~15자의 영문/숫자 또는 특수문자 조합" data-name="비밀번호">
                                        </div>

                                        <div class="col-12">
                                            <label for="password2" class="form-label">비밀번호 재입력</label>
                                            <input type="text" class="form-control" name="password2" id="password2" placeholder="비밀번호 재입력" data-name="비밀번호 재입력">
                                        </div>

                                        <div class="col-12">
                                            <label for="name" class="form-label">이름</label>
                                            <div class="input-group has-validation">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="이름" data-name="이름" >
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="birthday" class="form-label">생년월일</label>
                                            <div class="input-group has-validation">
                                                <input type="text" class="form-control" name="birthday" id="birthday" placeholder="생년월일 8자리 입력" data-name="생년월일" >
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="gender" class="form-label"> 성별 </label>
                                            <div class="input-group has-validation" id="gender">
                                                <input type="radio" name="gender" id="female" value="여성">
                                                <label for="female">여성</label>
                                                <input type="radio" name="gender" id="male" value="남성">
                                                <label for="male">남성</label>
                                            </div>

                                        </div>

                                        <div class="col-12">
                                            <label for="email" class="form-label">이메일</label>
                                            <input type="text" class="form-control" name="email" id="email" placeholder="이메일" data-name="이메일">
                                        </div>

                                        <div class="col-12">
                                            <label for="phoneNumber" class="form-label">휴대폰</label>
                                            <div class="input-group has-validation">
                                                <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" placeholder="휴대폰 '-' 없이 입력" data-name="휴대폰" >
                                            </div>
                                        </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="ture" name="terms" id="terms" >
                                            <label class="form-check-label" for="terms">I agree and accept the <a href="#">terms and conditions</a></label>
                                            <div class="invalid-feedback">You must agree before submitting.</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" class="btn btn-primary w-100" id="button_register" name="button_register">회원가입 하기</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Already have an account? <a href="member/member_login">Log in</a></p>
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