<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<style type="text/css">

    table{
        height: 100px;
    }
    th {
        font-weight: bold;
        background: #f4f4f4;
        text-align: left;
        border: 1px solid #ccc;
        width: 120px;
    }

    td {
        border: 1px solid #ccc;
        line-height: 13px;
        width: 200px;
    }

    .card-info {
        margin-bottom: 10px;
    }

    .btn-edit, .btn-delete {
        margin-left: 10px;
    }

</style>
<script>
    $(document).ready(function () {
        // 카드 등록 버튼 클릭 시 카드 정보 입력란 표시
        $(".btn-cardRegistration").click(function () {
            $(".card-info").toggle();
        });
    });
</script>

<!-- mypage_info 시작 -->
<div id="mypage_info_content1">
    <h3>마이페이지</h3>
    <table>
        <tr>
            <th scope="row">아이디</th>
            <td><sec:authentication property="principal.user.id"/></td>
            <th scope="row">이메일</th>
            <td><sec:authentication property="principal.user.email"/></td>
        </tr>
        <tr>
            <th scope="row">이름</th>
            <td><sec:authentication property="principal.user.name"/></td>
            <th scope="row">휴대폰번호</th>
            <td><sec:authentication property="principal.user.phoneNo"/></td>
        </tr>
    </table>
    <h3>자주쓰는 카드</h3>
    <button type="button" class="btn-cardRegistration">등록</button>
    <div class="card-info" style="display: none;">
        <label for="cardName">카드 이름</label>
        <input type="text" id="cardName" name="cardName" readonly value="${card.name}">
        <label for="cardNumber">카드 번호</label>
        <input type="text" id="cardNumber" name="cardNumber" readonly value="${card.number}">
        <!-- <button type="button" class="btn btn-warning btn-edit">수정</button>
        <button type="button" class="btn btn-danger btn-delete">삭제</button> -->
    </div>
</div>
<!-- mypage_info1 끝 -->

<!-- JS 부트스트랩 적용 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>