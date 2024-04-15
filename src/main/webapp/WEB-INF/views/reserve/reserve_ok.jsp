<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<!-- container -->
예매완료 페이지(예매정보, 결제정보)

	<!-- ticket_ok_content1 시작 -->
	<div id="ticket_ok_content1">
		<!-- 예매 정보 출력 -->
		<label>Start Region: ${startRegion}</label><br>
		<label>Start Terminal: ${startTerminal}</label><br>
		<label>End Region: ${endRegion}</label><br>
		<label>End Terminal: ${endTerminal}</label><br>
		<label>Departure Time: ${departureTime}</label><br>
		<label>Bus No: ${busNo}</label><br>
		<label>Seat No: ${seatNo}</label><br>
		<label>Price: ${price}</label><br>

		<!-- 결제 정보 출력 -->
		<label>People: ${people}</label><br>
		<label>Purchase: ${people}</label><br>
		<label>Price: ${price}</label><br>

	</div>

	<!-- ticket_ok_content1 끝 -->
	
<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>