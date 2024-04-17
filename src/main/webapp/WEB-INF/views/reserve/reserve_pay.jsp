<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- header -->
<%@include file="../includes/header.jsp" %>
<style>
    #reserve_pay_content1 {
        margin-top: 120px;
    }

    #birthText, #selectId, #cardText {
        float: left;
    }

    #cardText {
        clear: both;
    }

    #birth {
        margin-bottom: 50px;
    }

    #pay_payInfo-3 {
        background-color: #dcdcdc;
        padding: 20px;
        border-radius: 10px; /* Adjust the value as needed */
    }

    #dispatchText {
        text-align: center;
    }

    .form-control {
        width: 120px; /* 한 줄에 4개의 입력 필드가 들어가도록 너비 설정 */
        display: inline-block; /* 인라인 요소로 표시하여 한 줄에 배열 */
    }

    .pay_label {
        margin-top: 6px;
        margin-right: 15px;
    }

    #birthTextInfo {
        height: 60px;
    }
</style>

<!-- reserve_pay_content1 시작 -->
<div id="reserve_pay_content1">
    <div id="pay_reserveInfo">
        <h5>예매정보</h5>
        <div id="dispatchText">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>출발일</th>
                    <th>버스 번호</th>
                    <th>좌석 번호</th>
                    <th>승객 수</th>
                    <th>금액</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>[${startRegion}]${startTerminal}</td>
                    <td>[${endRegion}]${endTerminal}</td>
                    <td>${departureTime}</td>
                    <td>${busNo}</td>
                    <td>
                        <c:forEach var="seat" items="${seatNo}" varStatus="loop">
                            <c:out value="${seat}"/>
                            <c:if test="${not loop.last}">, </c:if>
                        </c:forEach>
                    </td>
                    <td>${people}</td>
                    <td>${price}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div id="pay_payInfo-2">
        <h5>결제정보</h5>
        <div id="pay_payInfo-3">
            <form method="post" action="reserve_pay_ok">
                <input type="hidden" name="payNo" value="${payNo }">
                <input type="hidden" name="id" id="userId" value="${id }">
                <input type="hidden" name="paymentDate" value="${paymentDate }">
                <input type="hidden" name="payStatus" value="${payStatus }">
                <div id="birthText">
                    <label class="pay_label">생년월일 8자리</label>
                </div>
                <div id="birthTextInfo">
                    <input type="text" name="birth" id="birth" placeholder="생년월일 8자리" maxlength="8" value="${birth }"
                           pattern="\d{8}" class="form-control">
                </div>
                <div id="cardText">
                    <label class="pay_label">카드번호 16자리</label>
                </div>
                <div id="cardTextInfo">
                    <input type="text" id="cardNo1" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"
                           class="form-control"> -
                    <input type="text" id="cardNo2" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"
                           class="form-control"> -
                    <input type="text" id="cardNo3" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"
                           class="form-control"> -
                    <input type="text" id="cardNo4" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"
                           class="form-control">
                </div>
                <br>
                <div id="selectId">
                    <label class="pay_label">유효기간</label>
                </div>
                <div id="selectMonthAndYear">
                    <select id="cardDropdownMonth" class="form-control">
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <label for="cardDropdownMonth">월</label>
                    &emsp;
                    <select id="cardDropdownYear" class="form-control"></select>
                    <label for="cardDropdownYear">년</label>
                </div>
                <br>
                <input type="hidden" name="phoneNo" id="phoneNo" placeholder="핸드폰번호" value="${phoneNo }">
                <button type="submit" id="payInsert" class="btn btn-primary">제출</button>
            </form>
        </div>
    </div>
</div>

<!-- reserve_pay_content1 끝 -->
<script type="text/javascript" src="/resources/js/pay.js"></script>
<script type="text/javascript">
    // 현재 년도를 가져오는 함수
    function getYear() {
        var date = new Date();
        return date.getFullYear();
    }

    // 현재 년도부터 10년 후까지의 옵션을 생성하여 select 요소에 추가
    function addYearsDropdown() {
        var dropdown = document.getElementById("cardDropdownYear");
        var currentYear = getYear();

        for (var i = 0; i <= 10; i++) {
            var year = currentYear + i;
            var option = document.createElement("option");
            option.text = year;
            option.value = year;
            dropdown.add(option);
        }
    }

    // 생년월일을 "xxxxxxxx" 형식으로 변환
    function formatBirth(birth) {
        var parts = birth.replace(/[-\s]/g, "").split(" ");
        var date = parts[0];
        var formattedDate = date.slice(0, 8);
        return formattedDate;
    }

    $(document).ready(function () {

        addYearsDropdown(); // 현재 년도부터 10년 후까지의 옵션을 추가

        var id = $("#userId").val(); // 입력된 ID 값 가져오기

        $.getJSON('/reserve/getInfo/' + id, function (data) {
            $("#birth").val(data.birth);
            $("#phoneNo").val(data.phoneNo);

            // 생년월일을 변환하여 입력 필드에 설정
            var birth = $("#birth").val();
            var formattedBirth = formatBirth(birth);
            $("#birth").val(formattedBirth);

            // 카드 정보가 있다면 설정
            if (data.myCardVO) {
                var cardNo = data.myCardVO.cardNo;
                $("#cardNo1").val(cardNo.slice(0, 4));
                $("#cardNo2").val(cardNo.slice(5, 9));
                $("#cardNo3").val(cardNo.slice(10, 14));
                $("#cardNo4").val(cardNo.slice(15, 19));
            } // end if
        }); //end getJson
    }); //end ready

    $("#payInsert").on("click", function (e) {
        e.preventDefault();

        //카드와 생년월일에 대한 유효성 검사
        var cardNoPattern = /^\d{4}$/;
        var birthPattern = /^\d{8}$/;

        var cardNo1 = $("#cardNo1").val();
        var cardNo2 = $("#cardNo2").val();
        var cardNo3 = $("#cardNo3").val();
        var cardNo4 = $("#cardNo4").val();
        var birth = $("input[name='birth']").val();
        var cardNo = cardNo1 + cardNo2 + cardNo3 + cardNo4;

        if (!cardNoPattern.test(cardNo1) || !cardNoPattern.test(cardNo2) ||
            !cardNoPattern.test(cardNo3) || !cardNoPattern.test(cardNo4)) {
            alert("카드번호를 16자리 숫자로 입력하세요.");
            return;
        }

        if (!birthPattern.test(birth)) {
            alert("생년월일을 8자리 숫자로 입력하세요.");
            e.preventDefault();
            return;
        }

        function formatCardNo(cardNo) {
            return cardNo.replace(/(\d{4})(\d{4})(\d{4})(\d{4})/, '$1-$2-$3-$4');
        }

        function formatPhoneNo(phoneNo) {
            return phoneNo.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }

        function formatDate(birth) {
            return birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
        }

        if ($("input[name='id']").val() == "") {
            //ajax에 입력될 데이터들 입력
            var pay = {
                payNo: $("input[name='payNo']").val(),
                id: "nonmember",
                amount: $("input[name='price']").val(),
                paymentDate: $("input[name='paymentDate']").val(),
                payStatus: "승인",
                cardNo: formatCardNo(cardNo),
                birth: formatDate(birth),
                phoneNo: formatPhoneNo($("input[name='phoneNo']").val())
            };

            console.log(pay);

        } else {
            var pay = {
                payNo: $("input[name='payNo']").val(),
                id: $("input[name='id']").val(),
                amount: $("input[name='price']").val(),
                paymentDate: $("input[name='paymentDate']").val(),
                payStatus: "승인",
                cardNo: formatCardNo(cardNo),
                birth: formatDate(birth),
                phoneNo: formatPhoneNo($("input[name='phoneNo']").val())
            };

            console.log(pay);
        } //end else

        payInsertService.insert(pay, function (result) {
            console.log("결제가 성공적으로 등록되었습니다.");
        });
    }); //end clickEvent

</script>

<!-- JS 부트스트랩 적용 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp" %>