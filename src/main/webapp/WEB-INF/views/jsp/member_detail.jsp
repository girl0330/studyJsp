<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    //update 공백 검사 실행
    let update = {
        //최초실행
        init : function () {
            if(!this.emptyChkFn()){
                return;
            }

            //전송 실행
            this.formSubmit();
        },

        //공백 검사 함수 정의
        emptyChkFn : function () {
            let valid = true;
            const form = document.getElementById("updateForm")
            const updates = form.querySelectorAll("input [type='text']");

            for(const update of updates) {
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

        //전송 함수 정의
        formSubmit : function () {
            const form = document.getElementById('updateForm');
            const formData = new FormData(form);

            // FormData 객체 확인
            for (const pair of formData.entries()) {
                console.log(pair[0] + ', ' + pair[1])
            }

            const url = "/board/boardUpdate";


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
                    if(data.code === 'success') {
                        alert(data.message);
                        location.href='/board/boardList'
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    }


    function listDelete(id) {
        alert(id+ "을/를 삭제합니다.")
        const url ="/member/memberDelete?id=";
        window.location.href = url+id;
    }

    function go_boardList() {
        const url ="/board/boardList";
        window.location.href =url;
    }

    const button_comment = () => {
        alert("클릭!")
        const writer = document.getElementById("commentWriter").value;
        const content = document.getElementById("commentContent").value;
        const board = '${detail.boardNo}';

        console.log("writer:", writer);
        console.log("content:", content);
        console.log("board:", board);


        const data = {
            commentWriter: writer,
            commentContent: content,
            boardNo: board
        };

        const url = "/comment/save";

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(commentList => {
                console.log('작성성공');
                console.log(commentList);
                // 여기서 commentList를 사용할 수 있습니다.
                let output = "<table class='table table-hover'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>내용</th>";
                output += "<th>작성자</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentContent+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentCreatedDate+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment_list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContent').value='';
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }

    //DOM 실행 후 안의 내용이 실행 됨
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("button_update").addEventListener("click", function () {
            update.init();
        });
    });

</script>

    <div class="pagetitle">
        <h1>Form Layouts</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item">Forms</li>
                <li class="breadcrumb-item active">Layouts</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Vertical Form</h5>

                        <!-- Vertical Form -->
                        <%--                        <form class="row g-3" action="/boardupdate" method="POST">--%>
                        <form class="row g-3" id="updateForm" name="updateForm">
                            <input type="hidden" id="boardNo" name="boardNo" value="${memberDetail.memberNo}">
                            <div class="col-12">
                                <label for="userId" class="form-label">아이디</label>
                                <input type="text" class="form-control" id="userId" name="userId" value="${memberDetail.userId}" data-name="id">
                            </div>
                            <div class="col-12">
                                <label for="password" class="form-label">비밀번호</label>
                                <input type="text" class="form-control" id="password" name="password" value="${memberDetail.password}" data-name="비밀번호">
                            </div>
                            <div class="col-12">
                                <label for="member_name" class="form-label">이름</label>
                                <input type="text" class="form-control" id="member_name" name="member_name" value="${memberDetail.name}" data-name="이름">
                            </div>
                            <div class="col-12">
                                <label for="nickname" class="form-label">닉네임</label>
                                <input type="text" class="form-control" id="nickname" name="nickname" value="${memberDetail.nickname}" data-name="닉네임">
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label">이메일</label>
                                <input type="text" class="form-control" id="email" name="content" value="${memberDetail.email}" data-name="이메일">
                            </div>
                            <div class="col-12">
                                <label for="phoneNumber" class="form-label">핸드폰 번호</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${memberDetail.phoneNumber}" data-name="핸드폰 번호">
                            </div>
                            <div class="col-12">
                                <label for="mobileNumber" class="form-label">모바일 번호</label>
                                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="${memberDetail.mobileNumber}" data-name="모바일 번호">
                            </div>
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" id="button_update" name="button_update">수정</button>
                                <button type="button" onclick="listDelete(${memberDetail.memberNo})" class="btn btn-secondary">삭제</button>
                                <button type="button" onclick="go_boardList()" href="member/memberList" class="btn btn-secondary">목록</button>
                            </div>
                        </form><!-- Vertical Form -->

                        </div>

                    <div>
                        <div class="col-12">
                            <label for="commentWriter" class="form-label">댓글 내용</label>
                            <input type="text" class="form-control" id="commentWriter" data-name="댓글 내용">
                        </div>
                        <div class="col-12">
                            <label for="commentContent" class="form-label">댓글 작성자</label>
                            <input type="text" class="form-control" id="commentContent" data-name="댓글 작성자">
                        </div>
                        <div class="text-center">
                            <button type="button" id="comment-write-btn" onclick="button_comment()" class="btn btn-secondary">댓글 등록</button>
<%--                            <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>--%>
                        </div>
                    </div>

                    <div class="col-12" id="comment_list">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">댓글번호</th>
                                <th scope="col">댓글내용</th>
                                <th scope="col">작성자</th>
                                <th scope="col">등록일자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${commentList}" var="comment">
                                    <th scope="row">${comment.id}</th>
                                    <td>${comment.commentContent}</td>
                                    <td>${comment.commentWriter}</td>
                                    <td>${comment.commentCreatedDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
