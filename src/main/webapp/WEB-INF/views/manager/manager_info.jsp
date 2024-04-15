<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div id="manager_info_content1">
    <div class="content_title">관리자 정보
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
    </div>
</div>
</body>
</html>