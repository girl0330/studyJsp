<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>Form Elements</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item">Forms</li>
                <li class="breadcrumb-item active">Elements</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-8">

                <div class="card">
                    <div class="card-body">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                            <h5 class="card-title"> 채용정보 </h5>
                            <form>
                                <!-- General Form Elements -->
                                <div class="row mb-3"> <%--필수입력 40자 이내--%>
                                    <label for="postingTitle" class="col-sm-2 col-form-label">공고제목</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="postingTitle" name="postingTitle" data-name="공고제목">
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/for= "business_type" / select - option사용방법 찾아보기-->
                                    <label class="col-sm-2 col-form-label" >업종</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>선택하기</option>
                                            <option value="1">IT/인터넷</option>
                                            <option value="2">경영/사무/금융/보험</option>
                                            <option value="3">미용/여행/숙박/음식/경비/돌봄/청소</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ for= "employment_type"-->
                                    <label class="col-form-label col-sm-2 pt-0">고용 형태</label>
                                    <div class="col-sm-10">

                                        <input class="form-check-input" type="checkbox" id="check1" value="아르바이트">
                                        <label class="form-check-label" for="check1">
                                            아르바이트
                                        </label>
                                        <input class="form-check-input" type="checkbox" id="check2" value="정규직">
                                        <label class="form-check-label" for="check2">
                                            정규직
                                        </label>

                                        <input class="form-check-input" type="checkbox" id="check3" value="위촉직 ( 프리랜서 )">
                                        <label class="form-check-label" for="check3">
                                            위촉직 ( 프리랜서 )
                                        </label>

                                        <input class="form-check-input" type="checkbox" id="check4" value="교육생 / 연수생">
                                        <label class="form-check-label" for="check4">
                                            교육생 / 연수생

                                        </label><input class="form-check-input" type="checkbox" id="check5" value="계약직">
                                        <label class="form-check-label" for="check5">
                                            계약직
                                        </label>

                                        <input class="form-check-input" type="checkbox" id="check6" value="인턴직">
                                        <label class="form-check-label" for="check6">
                                            인턴직
                                        </label>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ number_of_staff-->
                                    <label class="col-form-label col-sm-2 pt-0">고용 모집인원</label>
                                    <div class="col-sm-10">
                                        <form>
                                            <input class="form-check-input" type = "radio" name = "subject" value = "10명 미만"> 0명(10명 미만)
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1명"> 1명
                                            <input class="form-check-input" type = "radio" name = "subject" value = "100명 미만"> 00명(100명 미만)
                                            <div>
                                                <input class="form-check-input" type = "radio" name = "subject" value = "직접입력">
                                                <label class="form-check-label" for="check">직접입력</label>
                                                <input type="text" class="col-sm-5 form-control" id="check" name="check">
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ working_hours-->
                                    <label class="col-form-label col-sm-2 pt-0">근무기간</label>
                                    <div class="col-sm-10">
                                        <form>
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1년이상"> 1년이상
                                            <input class="form-check-input" type = "radio" name = "subject" value = "6개월 ~ 1년"> 6개월 ~ 1년
                                            <input class="form-check-input" type = "radio" name = "subject" value = "3개월 ~ 6년"> 3개월 ~ 6년
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1개월 ~ 3개월"> 1개월 ~ 3개월
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1주일 ~ 1개월"> 1주일 ~ 1개월
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1주일이하"> 1주일이하
                                            <input class="form-check-input" type = "radio" name = "subject" value = "1일"> 1일
                                        </form>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ working_days-->
                                    <label class="col-form-label col-sm-2 pt-0">근무요일</label>
                                    <div class="col-sm-10">
                                        <div>
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia1"> 월
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia2"> 화
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia3"> 수
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia1"> 목
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia2"> 금
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia3"> 토
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia3"> 일
                                        </div>
                                        <div>
                                            <input class="form-check-input" type = "checkbox" name = "subject" value = "appia1"> 협의가능
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ salary-->
                                    <label class="col-sm-2 col-form-label pt-0"  >급여</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>선택하기</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3"> <!--필수입력/ business_type-->
                                    <label class="col-form-label col-sm-2 pt-0">입력완료</label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">입력완료</button>
                                    </div>
                                </div>
                            </form><!-- End General Form Elements -->
                        </div>
                    </div>

                </div>

                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Advanced Form Elements</h5>

                            <!-- Advanced Form Elements -->
                            <form>
                                <div class="row mb-5">
                                    <label class="col-sm-2 col-form-label">Switches</label>
                                    <div class="col-sm-10">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                                            <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                                            <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDisabled" disabled>
                                            <label class="form-check-label" for="flexSwitchCheckDisabled">Disabled switch checkbox input</label>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckCheckedDisabled" checked disabled>
                                            <label class="form-check-label" for="flexSwitchCheckCheckedDisabled">Disabled checked switch checkbox input</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-5">
                                    <label class="col-sm-2 col-form-label">Ranges</label>
                                    <div class="col-sm-10">
                                        <div>
                                            <label for="customRange1" class="form-label">Example range</label>
                                            <input type="range" class="form-range" id="customRange1">
                                        </div>
                                        <div>
                                            <label for="disabledRange" class="form-label">Disabled range</label>
                                            <input type="range" class="form-range" id="disabledRange" disabled>
                                        </div>
                                        <div>
                                            <label for="customRange2" class="form-label">Min and max with steps</label>
                                            <input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange2">
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label">Floating labels</label>
                                    <div class="col-sm-10">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                                            <label for="floatingInput">Email address</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                                            <label for="floatingPassword">Password</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px;"></textarea>
                                            <label for="floatingTextarea">Comments</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
                                                <option selected>Open this select menu</option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                            <label for="floatingSelect">Works with selects</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-5">
                                    <label class="col-sm-2 col-form-label">Input groups</label>
                                    <div class="col-sm-10">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon1">@</span>
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>

                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                            <span class="input-group-text" id="basic-addon2">@example.com</span>
                                        </div>

                                        <label for="basic-url" class="form-label">Your vanity URL</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
                                            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                                            <span class="input-group-text">.00</span>
                                        </div>

                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username">
                                            <span class="input-group-text">@</span>
                                            <input type="text" class="form-control" placeholder="Server" aria-label="Server">
                                        </div>

                                        <div class="input-group">
                                            <span class="input-group-text">With textarea</span>
                                            <textarea class="form-control" aria-label="With textarea"></textarea>
                                        </div>
                                    </div>
                                </div>

                            </form><!-- End General Form Elements -->

                        </div>
                    </div>

                </div>
            </div>
    </section>

</main><!-- End #main -->