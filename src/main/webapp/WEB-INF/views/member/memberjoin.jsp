<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>

<!-- 자바 스크립트 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function(){

        //birth 형식 변환
        function formatDateTimeFromInput(inputValue) {
            // inputValue 형식은 "YYYY-MM-DD"
            // 시간, 분, 초를 각각 '00'으로 설정하여 날짜만 가지도록 변환
            const formatted = inputValue + '00:00:00';
            return formatted;
        }

        /* 회원가입 버튼 클릭시 DB저장*/
        $('#sineUp').on("click", function(){

            // 기본 이벤트 제거
            event.preventDefault();

            //XMLHttpRequest 객체 생성
            const xhr = new XMLHttpRequest();
            //입력값 변수에 저장
            var dateTimeInputValue = $('#birth').val();
            //가져온 값을 형식에 맞게 변환
            var formattedDepartureTime = formatDateTimeFromInput(dateTimeInputValue);

            var obj = {
                id : $('#username').val(),
                password : $('#password').val(),
                name : $('#name').val(),
                birth : formattedDepartureTime,
                phoneNo : $('#phoneNo').val(),
                email : $('#email').val()
            };

            //AJAX 요청 보내기
            $.ajax({
                type: 'post',
                url: '/member/register',
                dataType: 'text',
                data: JSON.stringify(obj),
                contentType: 'application/json; charset=utf-8',
                success: function(data){
                    alert("회원가입 성공");
                    window.location.href = '/member/login';
                },
                error: function(xhr, status, er){
                    console.log("error: " + er);
                }
            })//ajax end
        });//sineup end

        /* 취소 버튼 클릭시 메인페이지로 이동 */
        $('#cancel').on("click", function(){
            location.href = "/reserve/reserve_main";
        });

    });
</script>

<div id="join_content1">
    <div class="content_title">
        <form action="/member/register" method="post">
            <div class="form-group has-feedback">
                <label class="control-label" >아이디</label>
                <input class="form-control" type="text" id="username" name="username" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">비밀번호</label>
                <input class="form-control" type="password" id="password" name="password" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">이름</label>
                <input class="form-control" type="text" id="name" name="name" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">생년월일</label>
                <input class="form-control" type="date" id="birth" name="birth" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">휴대폰번호</label>
                <input class="form-control" type="tel" id="phoneNo" name="phoneNo" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label">이메일</label>
                <input class="form-control" type="email" id="email" name="email" />
            </div>
            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="sineUp">회원가입</button>
                <button class="cencle btn btn-danger" type="button" id="cancel">취소</button>
            </div>
        </form>
    </div>
</div>

<!-- JS 부트스트랩 적용 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>