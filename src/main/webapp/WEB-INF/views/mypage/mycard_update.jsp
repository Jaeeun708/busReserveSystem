<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function (){
        /*수정 버튼 클릭시 이벤트 발생*/
        $('#updateMyCard').on("click", function (){
            var mycardName = $('#mycardName').val();
            var mycardNumbers = $('.mycardNumber').map(function (){
                return $(this).val();
            }).get();

            var mycardNumber = mycardNumbers.join('-');

            $.ajax({
                type: 'POST',
                url: '/mypage/mycard_update',
                data: {
                    _method: 'PUT',
                    cardName: mycardName,
                    cardNo: mycardNumber
                },
                success: function (response){
                    alert("카드수정이 완료되었습니다.");
                    window.location.href = '/mypage/mycard';
                },
                error: function (xhr, status, error) {
                    alert("카드 수정 중 오류가 발생했습니다.");
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>

<div id="mycard_insert_content">
    <div class="content_title">자주쓰는 카드
        <div class="myCardInsert">
            <button type="submit" id="updateMyCard">변경 완료</button>
            <table>
                <tr>
                    <th scope="row">카드 이름</th>
                    <td><input type="text" id="mycardName" value="${myCardInfo.cardName}"></td>

                </tr>
                <tr>
                    <th scope="row">카드 번호</th>
                    <td>
                        <input type="text" class="mycardNumber" value="${myCardInfo.cardNo.substring(0,4)}">
                        -
                        <input type="text" class="mycardNumber" value="${myCardInfo.cardNo.substring(5,9)}">
                        -
                        <input type="text" class="mycardNumber" value="${myCardInfo.cardNo.substring(10,14)}">
                        -
                        <input type="text" class="mycardNumber" value="${myCardInfo.cardNo.substring(15,19)}">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- JS 부트스트랩 적용 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>