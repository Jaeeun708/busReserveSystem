<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<!-- side -->
<%@include file="../includes/mypageSide.jsp"%>

<!-- 자바 스크립트 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function () {
        /*등록 버튼 클릭시 입력페이지로 이동*/
        $('#insertMyCard').on("click", function (){
            window.location.href = '/mypage/mycard_insert'
        });

        /*수정 버튼 클릭시 입력페이지로 이동*/
        $('#updateMyCard').on("click", function (){
            window.location.href = '/mypage/mycard_update'
        });

        /*삭제 버튼 클릭시 DB삭제*/
        $('#deleteMyCard').on("click", function () {
            $.ajax({
                url: "/mypage/mycard_delete",
                type: "DELETE",
                success: function (response) {
                    alert("카드가 삭제되었습니다.");
                    window.location.href = '/mypage/mycard';
                },
                error: function (xhr, status, error) {
                    alert("카드 삭제 중 오류가 발생했습니다.");
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>

<div id="mycard_info_content">
    <div class="content_title"><i class="fa-regular fa-credit-card"></i>자주쓰는 카드</div>
    <div class="myCardInfo">
        <!-- 카드 정보가 없는 경우 -->
        <c:if test="${empty myCardInfo}">
            <button type="button" id="insertMyCard">등록</button>
            <table>
                <tr>
                    <th scope="row">아이디</th>
                    <td><sec:authentication property="principal.user.id"/></td>
                </tr>
                <tr>
                    <th scope="row">카드 이름</th>
                    <td>카드가 등록되어 있지 않습니다.</td>

                </tr>
                <tr>
                    <th scope="row">카드 번호</th>
                    <td>0000-****-****-0000</td>
                </tr>
            </table>
        </c:if>
        <!-- 카드 정보가 있는 경우 -->
        <c:if test="${not empty myCardInfo}">
            <button type="button" id="updateMyCard">수정</button>
            <button type="button" id="deleteMyCard">삭제</button>
            <table>
                <tr>
                    <th scope="row">아이디</th>
                    <td><sec:authentication property="principal.user.id"/></td>
                </tr>
                <tr>
                    <th scope="row">카드 이름</th>
                    <td><c:out value="${myCardInfo.cardName}"/></td>

                </tr>
                <tr>
                    <th scope="row">카드 번호</th>
                    <td id="cardNumber"><c:out value="${myCardInfo.cardNo}"/></td>
                </tr>
            </table>
        </c:if>
    </div>
</div>
<!-- JS 부트스트랩 적용 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>