<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

    function goToDetail(id) {
        alert("상세보기" +id)
        const url ="/user/memberDetail?id="
        window.location.href = url+id;
    }

    //글쓰기 페이지 이동
    function goTohome() {
        window.location.href = "/";
    }


</script>

<div class="pagetitle">
    <h1>General Tables</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item">Tables</li>
            <li class="breadcrumb-item active">General</li>
        </ol>
    </nav>
</div><!-- End Page Title -->

<section class="section">
    <div class="row">

        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">list table</h5>

                    <!-- Table with hoverable rows -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">id</th>
                            <th scope="col">이름</th>
                            <th scope="col">닉네임</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${memberList}" var="memberList">
                            <tr onclick="goToDetail(${memberList.memberNo});">
                                <th scope="row">${memberList.memberNo}</th>
                                <td>${memberList.userId}</td>
                                <td>${memberList.name}</td>
                                <td>${memberList.nickname}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- End Table with hoverable rows -->

                    <div class="col-12">
                        <button type="button" class="btn btn-primary" onclick="goTohome()">홈화면 이동</button>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
