<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</div>
<!-- content_wrap 끝(70%) -->

	<!-- footer시작 -->
	<div id="footer">
		<div id="footer_content1">
			<ul class="footer_nav">
				<li>홈페이지 이용약관</li>
				<li>사업자 정보</li>
			</ul>
			<div class="footer_info">
				(주)버스톡톡&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호: 123-55-78945&nbsp;&nbsp;&nbsp;&nbsp;주소: 경기도 성남시 분당구 성남대로 34<br>
				COPYRIGHT(c) 2024 전국버스운송조합연합회&nbsp;&nbsp;&nbsp;&nbsp;콜센터: 1818-1818&nbsp;&nbsp;&nbsp;&nbsp;이메일: bustalktalk@bus.com
			</div>
		</div>
	</div>
	<!-- footer끝 -->
<%--<script>
	$(document).ready(function() {
		function do_reposition_footer() {
			header_height = document.getElementById('header')[0].clientHeight + 2;
			content_height = document.getElementById('content_wrap')[0].clientHeight;
			footer_height = document.getElementById('footer')[0].clientHeight;
			alert(header_height);
			body_height = header_height + content_height + footer_height;

			if (window.innerHeight > body_height) {
				t = window.innerHeight - header_height - footer_height - 2;
				document.getElementById('content_wrap')[0].style.height = t + 'px';
			}
		}

		window.addEventListener('resize', function(event) {
			document.getElementById('content_wrap')[0].style.height = '';
			do_reposition_footer();
		});
	});
</script>--%>
</body>
</html>