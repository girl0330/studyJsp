<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
                                    <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                                </div>

                                <form class="row g-3 needs-validation" id="insertForm" name="insertForm">
                                    <div class="col-12">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="hidden" class="form-control" name="userId" id="userId" data-name="아이디" value="10" >
                                    </div>

                                    <div class="col-12">
                                        <label for="password" class="form-label">비밀번호</label>
                                        <input type="text" class="form-control" name="password" id="password" data-name="비밀번호">
                                    </div>

                                    <div class="col-12">
                                        <label for="password2" class="form-label">비밀번호 재입력</label>
                                        <input type="text" class="form-control" name="password2" id="password2" data-name="비밀번호 재입력">
                                    </div>

                                    <div class="col-12">
                                        <label for="name" class="form-label">이름</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="name" id="name" data-name="이름" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="birthday" class="form-label">생년월일</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="birthday" id="birthday" data-name="생년월일" >
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="email" class="form-label">이메일</label>
                                        <input type="text" class="form-control" name="email" id="email" data-name="이메일">
                                    </div>

                                    <div class="col-12">
                                        <label for="phoneNumber" class="form-label">전화 번호</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" data-name="전화 번호" >
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