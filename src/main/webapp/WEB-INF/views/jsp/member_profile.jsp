<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

    let update = {
        //공백검사
        init : function() {
            if(!this.emptyChkFn1()) {
                return;
            }
            //전송
            this.formSubmit1();
        },
        passwordInit : function () {
            //공백 검사
            if(!this.emptyChkFn1()) {
                return;
            }
            //수정 전송
            this.passwordChange();
        },

        //공백 검사
        emptyChkFn1 : function() {
            alert("공백 검767777777777777777사")
            let valid = true;
            const form = document.getElementById("updateForm");
            const updates = form.querySelectorAll("input[type='text']");

            for (const update of updates) {
                const removeBlankDate = update.value.replace(/\s*/, "");
                if (removeBlankDate === "") {
                    let text = update.dataset.name;
                    alert(text + "은/는 필수 입력 값입니다.");
                    update.focus();
                    valid = false;
                    break;
                }
            }
            return valid;
        },

        passwordChange : function () {
            alert("비번변경클릭")
            const form = document.getElementById("changePwForm");
            const formData = new FormData(form);

            for (const pair of formData.entries()) {
                console.log(pair[0]+' , '+pair[1])
            }

            const url = "/member/changePw";

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
                    console.log('Received data:', data);
                    if (data.code === 'success') {
                        alert(data.message);
                        location.href = '/member/profile'
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        },

        formSubmit1: function () {
            alert("클릭")
            const form = document.getElementById("updateForm");
            const formData = new FormData(form);

            for (const pair of formData.entries()) {
                console.log(pair[0] + ', ' + pair[1])
            }

            const url = "/member/memberUpdate";

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
                    console.log('Received data:', data);
                    if (data.code === 'success') {
                        alert(data.message);
                        location.href = '/member/profile'
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    }

    //DOM 실행 후 안의 내용이 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("button_profile_changes").addEventListener("click", function () {
            update.init();
        });
        document.getElementById("button_password_changes").addEventListener("click", function () {
            update.passwordInit();
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
        <div class="col-xl-4">

            <div class="card">
                <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                    <h2>${memberProfile.name}</h2>
                    <h3>${memberProfile.userId}</h3>
                    <div class="social-links mt-2">
                        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xl-8">

            <div class="card">
                <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                        </li>

                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                            <h5 class="card-title">Profile Details</h5>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Name</div>
                                <div class="col-lg-9 col-md-8">${memberProfile.name}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">nickname</div>
                                <div class="col-lg-9 col-md-8">${memberProfile.nickname}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">email</div>
                                <div class="col-lg-9 col-md-8">${memberProfile.email}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">phone_number</div>
                                <div class="col-lg-9 col-md-8">${memberProfile.phoneNumber}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">mobile_number</div>
                                <div class="col-lg-9 col-md-8">${memberProfile.mobileNumber}</div>
                            </div>
                        </div>

                        <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                            <!-- Profile Edit Form -->
                            <form id="updateForm" name="updateForm">

                                <div class="row mb-3">
                                    <label for="name" class="col-md-4 col-lg-3 col-form-label"> Name </label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="name" type="text" class="form-control" id="name" value="${memberProfile.name}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="nickname" class="col-md-4 col-lg-3 col-form-label">Nickname</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="nickname" type="text" class="form-control" id="nickname" value="${memberProfile.nickname}" data-name="nickname">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="email" type="email" class="form-control" id="email" value="${memberProfile.email}" data-name="email">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="phoneNumber" class="col-md-4 col-lg-3 col-form-label">PhoneNumber</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" value="${memberProfile.phoneNumber}" data-name="phoneNumber">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="mobileNumber" class="col-md-4 col-lg-3 col-form-label">MobileNumber</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="mobileNumber" type="text" class="form-control" id="mobileNumber" value="${memberProfile.mobileNumber}" data-name="mobileNumber">
                                    </div>
                                </div>

                                <div class="text-center">
                                  <button type="button" class="btn btn-primary" id="button_profile_changes" name="button_profile_changes">Change</button>
                                </div>
                            </form><!-- End Profile Edit Form -->

                        </div>

                        <div class="tab-pane fade pt-3" id="profile-change-password">
                            <!-- Change Password Form -->
                            <form id="changePwForm" name="changePwForm">

                                <div class="row mb-3">
                                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="password" type="password" class="form-control" id="currentPassword">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="renewpassword" type="password" class="form-control"   id="renewPassword">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" id="button_password_changes" name="button_password_changes">Change Password</button>
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