<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/side.jsp"%>
<!-- manager_payment1 시작 -->
<div id="manager_payment_content1">
	<!-- 큰제목 -->
	<div class="content_title"><i class="fa-regular fa-credit-card"></i>결제내역</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>결제번호</th>
				<th>아이디</th>
				<th>결제금액</th>
				<th>결제일시</th>
				<th>결제상태</th>
				<th>카드번호</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${paymentList}" var="payment">
			<tr>
				<td><c:out value="${payment.payNo}"/></td>
				<td><c:out value="${payment.id}"/></td>
				<td><c:out value="${payment.amount}"/></td>
				<td><fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:out value="${payment.payStatus}"/></td>
				<td><c:out value="${payment.cardNo}"/></td>
			</tr>
		</c:forEach>
		</tbody>

	</table>
</div>
<!-- manager_payment1 끝 -->
	
<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>