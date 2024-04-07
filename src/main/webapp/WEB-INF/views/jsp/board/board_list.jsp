<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

    function goToDetail(id) {
        alert("상세보기" +id)
        const url ="/board/boardDetail?id="
        window.location.href = url+id;
    }

    //글쓰기 페이지 이동
    function goToBoardWrite() {
        window.location.href = "/board/boardWrite";
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
                                <th scope="col">No</th>
                                <th scope="col">제목</th>
                                <th scope="col">등록자</th>
                                <th scope="col">등록일자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardList}" var="list2">
                                <tr onclick="goToDetail(${list2.id});">
                                    <th scope="row">${list2.num}</th>
                                    <td>${list2.title}</td>
                                    <td>${list2.systemRegistrarId}</td>
                                    <td>${list2.systemRegistrarDatetime}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- End Table with hoverable rows -->

                        <div class="col-12">
                            <button type="button" class="btn btn-primary" onclick="goToBoardWrite()">글쓰기</button>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>
