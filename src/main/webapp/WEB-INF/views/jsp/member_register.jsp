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
            const form = document.getElementById('insertForm');
            const formData = new FormData(form);

            // FormData 객체 확인
            for (const pair of formData.entries()) {
                console.log("삥뽕;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" + pair[0] + ', ' + pair[1]);
            }

            // fetch 요청 생성
            const url = "/member/registerInsert"; // 컨트롤러 URL을 여기에 입력하세요

            //비동기통신 es6에 적용된 방식
            fetch(url, {
                method: 'POST',
                body: formData //전송할 데이터
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // JSON 형식의 응답 데이터를 파싱하여 반환하는 Promise를 반환
            })
            .then(data => {
                // 데이터 처리
                console.log('Data uploaded:', data);
                // if (data.code === 'test') {
                //   alert(data.message);
                if(data.code === 'error') {
                    alert(data.message);
                } else {
                    alert(data.message);
                    location.href='/member/login';
                }
            })
            .catch(error => {
                // 오류 처리
                console.error('There was a problem with the fetch operation:', error);
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
                                <form class="row g-3 needs-validation" id="insertForm" name="insertForm">
                                    <div class="col-6">
                                        <button type="button" class="btn btn-primary w-100" id="button_register" name="button_register">개인 회원가입</button>
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn btn-primary w-100" id="button_register" name="button_register">기업 회원가입</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                    <p class="text-center small">Enter your personal details to create account</p>
                                </div>

                                <form class="row g-3 needs-validation" id="insertForm" name="insertForm">
                                    <div class="col-12">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="text" class="form-control" name="userId" id="userId" data-name="아이디">
                                    </div>

                                    <div class="col-12">
                                        <label for="email" class="form-label">이메일</label>
                                        <input type="text" class="form-control" name="email" id="email" data-name="이메일">
                                    </div>

                                    <div class="col-12">
                                        <label for="name" class="form-label">이름</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="name" id="name" data-name="이름" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="password" class="form-label">비밀번호</label>
                                        <input type="text" class="form-control" name="password" id="password" data-name="비밀번호">
                                    </div>

                                    <div class="col-12">
                                        <label for="nickname" class="form-label">닉네임</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="nickname" id="nickname" data-name="닉네임" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="phoneNumber" class="form-label">전화 번호</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" data-name="전화 번호" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="mobileNumber" class="form-label">핸드폰 번호</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" data-name="핸드폰 번호" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" name="terms" id="terms" >
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