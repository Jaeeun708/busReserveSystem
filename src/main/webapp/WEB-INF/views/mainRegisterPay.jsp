<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<form method="post">
    <input type="hidden" name="payNo" value="${payNo }">
    <input type="hidden" name="id" id="userId" value="${id }">

    <input type="hidden" name="amount" value="15000">
    <input type="hidden" name="paymentDate" value="${paymentDate }">
    <input type="hidden" name="payStatus" value="${payStatus }">
    <input type="text" id="cardNo1" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"> -
    <input type="text" id="cardNo2" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"> -
    <input type="text" id="cardNo3" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}"> -
    <input type="text" id="cardNo4" name="cardNo" placeholder="카드번호" maxlength="4" pattern="\d{4}">
    <br>
    <select id="cardDropdownMonth">
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
    <select id="cardDropdownYear"></select>
    <label for="cardDropdownYear">년</label>
    <br>
    <input type="text" name="birth" id="birth" placeholder="생년월일 8자리" maxlength="8" value="${birth }" pattern="\d{8}">
    <br>
    <input type="hidden" name="phoneNo" id="phoneNo" placeholder="핸드폰번호" value="${phoneNo }">
    <button type="submit" id="payInsert">제출</button>
</form>

</body>
<script type="text/javascript" src="/resources/js/pay.js"></script>
<script type="text/javascript">
    // 현재 년도를 가져오는 함수
    function getYear() {
        var date = new Date();
        return date.getFullYear();
    }

    // 현재 년도부터 10년 후까지의 옵션을 생성하여 select 요소에 추가하는 함수
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

    // 생년월일을 "xxxxxxxx" 형식으로 변환하는 함수
    function formatBirth(birth) {
        // "-"를 제거하고 공백을 기준으로 문자열을 분리하여 배열로 변환합니다.
        var parts = birth.replace(/[-\s]/g, "").split(" ");
        // 첫 번째 요소인 년월일을 추출합니다.
        var date = parts[0];
        // 년월일을 8자리로 자릅니다.
        var formattedDate = date.slice(0, 8);
        // 자린 생년월일을 반환합니다.
        return formattedDate;
    }

    // 페이지 로드 시 실행
    $(document).ready(function(){

        addYearsDropdown(); // 현재 년도부터 10년 후까지의 옵션을 추가

        var id = $("#userId").val(); // 입력된 ID 값 가져오기

        $.getJSON('/pay/test/' + id, function(data) {
            // 서버에서 받은 데이터를 기반으로 입력 필드에 설정
            $("#birth").val(data.birth); // 생년월일 설정
            $("#phoneNo").val(data.phoneNo); // 전화번호 설정

            // 생년월일을 변환하여 입력 필드에 설정합니다.
            var birth = $("#birth").val(); // 입력된 생년월일 값 가져오기
            var formattedBirth = formatBirth(birth); // 생년월일을 "xxxxxxxx" 형식으로 변환
            $("#birth").val(formattedBirth); // 변환된 생년월일을 입력 필드에 설정

            // 카드 정보가 있다면 설정
            if (data.myCardVO) {
                var cardNo = data.myCardVO.cardNo;
                $("#cardNo1").val(cardNo.slice(0, 4)); // 카드번호 첫 번째 부분
                $("#cardNo2").val(cardNo.slice(5, 9)); // 카드번호 두 번째 부분
                $("#cardNo3").val(cardNo.slice(10, 14)); // 카드번호 세 번째 부분
                $("#cardNo4").val(cardNo.slice(15, 19)); // 카드번호 네 번째 부분
            }
        });
    });

    $("#payInsert").on("click", function(e) {
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
                amount: $("input[name='amount']").val(),
                paymentDate: $("input[name='paymentDate']").val(),
                payStatus: "승인",
                cardNo: formatCardNo(cardNo),
                birth: formatDate(birth),
                phoneNo: formatPhoneNo($("input[name='phoneNo']").val())
            };

            console.log(pay);

            //ajax 메서드 호출 및 입력한 데이터들 삽입
            payInsertService.insert(pay, function(result) {
                console.log("결제가 성공적으로 등록되었습니다.");

            });
        } else {
            var pay = {
                payNo: $("input[name='payNo']").val(),
                id: $("input[name='id']").val(),
                amount: $("input[name='amount']").val(),
                paymentDate: $("input[name='paymentDate']").val(),
                payStatus: "승인",
                cardNo: formatCardNo(cardNo),
                birth: formatDate(birth),
                phoneNo: formatPhoneNo($("input[name='phoneNo']").val())
            };

            console.log(pay);

            payInsertService.insert(pay, function(result) {
                console.log("결제가 성공적으로 등록되었습니다.");

            });
        }

    });

</script>