<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

    function a(){
        window.location.href = "/user/personal";
    }

    function b(){
        window.location.href = "/user/business";
    }


</script>

    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <a href="index.html" class="logo d-flex align-items-center w-auto">
                                <img src="../assets/img/logo.png" alt="">
                                <span class="d-none d-lg-block"> 회원가입 </span>
                            </a>
                        </div><!-- End Logo -->

                        <div class="card mb-3">
                            <div class="card-body">
                                <form class="row g-3 needs-validation">
                                    <div class="col-6">
                                        <button type="button" class="btn btn-primary w-100" onclick="a()">개인 회원가입</button>
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn btn-primary w-100" onclick="b()">기업 회원가입</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

    </div>