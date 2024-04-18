<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>

<!-- container -->
<div id="successText">
	<h1 id="ok_h1">예매가 완료되었습니다.</h1>
</div>

	<!-- ticket_ok_content1 시작 -->
<div id="ticket_container" class="container">
	<div id="ticket_ok_content1" >
		<h4 id="ok_h4-1">예매 정보</h4>
		<table class="table table-shadow" id="ok_table-1">
			<tr>
				<th>출발지</th>
				<th>도착지</th>
				<th>출발일</th>
				<th>버스번호</th>
				<th>좌석번호</th>
				<th>금액</th>
			</tr>
			<tr id="ok_tr-td-1">
				<td>[${startRegion}]${startTerminal}</td>
				<td>[${endRegion}]${endTerminal}</td>
				<td>${departureTime}</td>
				<td>${busNo}</td>
				<td>
					<c:forEach var="seatNo" items="${seatNo}">${seatNo}번 </c:forEach>
				</td>
				<td>${price} 원</td>
			</tr>
		</table>

		<h4 id="ok_h4-2">결제 정보</h4>
		<table class="table table-shadow" id="ok_table-2">
			<tr id="ok_tr-th-2">
				<th>인원</th>
				<th>매수</th>
				<th>결제금액</th>
			</tr>
			<tr id="ok_tr-td-2">
				<td>${people}</td>
				<td>${people}</td>
				<td>${price} 원</td>
			</tr>
		</table>

		<button type="button" onclick="reserveSearch()" class="btn btn-primary" id="ok_reserveSearch">예매조회</button>
	</div>
</div>
<!-- ticket_ok_content1 끝 -->
<script>
	function reserveSearch() {
		window.location.href = "/reserve/reserve_list";
	}
</script>

<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>