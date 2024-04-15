<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<form id="memberForm" method="post">
    <input type="text" name="id" id="userId" placeholder="아이디">
    <br>
    <input type="password" name="userName" placeholder="비밀번호">
    <button type="submit">로그인</button>
</form>

<form id="myForm" method="post">
    <input type="text" name="birth" id="birth" placeholder="생년월일 8자리" maxlength="8" pattern="[0-9]{8}">
    <br>
    <select id="phoneDropdown" onchange="updatePhoneNo()">
        <option value="010">010</option>
        <option value="011">011</option>
        <option value="016">016</option>
        <option value="017">017</option>
        <option value="018">018</option>
        <option value="019">019</option>
    </select> -
    <input type="text" id="phoneNo1" placeholder="핸드폰번호" maxlength="4" pattern="[0-9]{4}" oninput="updatePhoneNo()"> -
    <input type="text" id="phoneNo2" placeholder="핸드폰번호" maxlength="4" pattern="[0-9]{4}" oninput="updatePhoneNo()">
    <input type="hidden" name="phoneNo" id="phoneNo3">
    <button type="button" onclick="submitForm()">제출</button>
</form>

</body>
<script>

    // 생년월일 유효성 검사
    function testBirth() {
        var birth = document.getElementById("birth").value;
        var birthPattern = /^\d{8}$/;
        if (!birthPattern.test(birth)) {
            alert("생년월일을 8자리 숫자로 입력하세요.");
            return false;
        }
        return true;
    }

    // 핸드폰번호 유효성 검사
    function testPhoneNo() {
        var phoneNo1 = document.getElementById("phoneNo1").value;
        var phoneNo2 = document.getElementById("phoneNo2").value;
        var phoneNoPattern = /^\d{4}$/;
        if (!phoneNoPattern.test(phoneNo1) || !phoneNoPattern.test(phoneNo2)) {
            alert("핸드폰번호를 올바르게 입력하세요.");
            return false;
        }
        return true;
    }

    // 모든 필드의 유효성을 검사하고 제출 여부를 결정
    function testDataForm() {
        if (!testBirth()) {
            return false;
        }
        if (!testPhoneNo()) {
            return false;
        }

        return true;
    }

    // 폼 제출
    function submitForm() {
        if (testDataForm()) {
            document.getElementById("myForm").submit();
        }
    }

    // 드롭다운에서 선택된 값을 핸드폰번호 첫번째에 반영
    function updatePhoneNo() {
        var phoneDropdown = document.getElementById("phoneDropdown").value;
        var phoneNo1 = document.getElementById("phoneNo1").value;
        var phoneNo2 = document.getElementById("phoneNo2").value;
        var phoneNo = phoneDropdown + phoneNo1 + phoneNo2;

        // hidden input에 전화번호 설정
        document.getElementById("phoneNo3").value = phoneNo;
    }

</script>
</html>