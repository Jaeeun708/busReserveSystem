<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- 로그인 부트스트랩 -->
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <form action="/login" method="post">
        <input type="text" name="username"><br/>
        <input type="password" name="password"><br/>
        <button>로그인</button>
    </form>
    <a href="/member/memberjoin">회원가입</a>

</body>
</html>