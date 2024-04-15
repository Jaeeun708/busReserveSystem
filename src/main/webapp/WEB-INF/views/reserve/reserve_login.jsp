<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<style>
	.scrollable-content {
		background-color: #f2f2f2; /* 배경색 설정 */
		padding: 10px; /* 약관 내용과의 간격 조절 */
		border-radius: 5px; /* 모서리를 둥글게 만듦 */
	}

	/* 비회원 정보 입력 섹션의 상단 마진을 추가하여 바닥에서 좀 떨어지게 함 */
	.mt-bottom {
		margin-bottom: 20px; /* 원하는 크기의 상단 마진 설정 */
	}

	/* 로그인을 강조하는 스타일 */
	#page_title h5 {
		font-family: Arial, sans-serif; /* 원하는 글꼴로 변경 */
		font-size: 20px; /* 원하는 폰트 크기로 변경 */
		font-weight: bold; /* 강조하는 글꼴 스타일 */
		color: #333; /* 텍스트 색상 변경 */
	}
</style>

<div id="page_title">
	<h5>승차권 예매 > <span style="color: #007bff;">로그인</span></h5> <!-- 로그인 텍스트를 강조하는 스타일로 변경 -->
</div>

<div class="container">
	<!-- 로그인 섹션 위에 텍스트 추가 -->
	<div class="row justify-content-start"> <!-- 로그인 섹션 위에 추가하고, 시작부터 정렬 -->
		<div class="col-md-5 text-left"> <!-- col-md-5 사용하여 가로 크기 지정, text-left로 텍스트 왼쪽 정렬 -->
			<p>회원 예매를 하시려면 로그인해 주세요.</p>
		</div>
	</div>
	<!-- 로그인 폼 -->
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="card shadow">
				<div class="card-body">
					<h2 class="text-center mb-4">회원 로그인</h2>
					<form id="memberForm" method="post">
						<div class="form-group">
							<input type="text" name="id" id="userId" class="form-control" placeholder="아이디" required>
						</div>
						<div class="form-group mt-2">
							<input type="password" name="userName" class="form-control" placeholder="비밀번호" required>
						</div>
						<div class="form-group mt-2"> <!-- mt-3 클래스 추가 -->
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-start mt-3"> <!-- 로그인 섹션 위에 추가하고, 시작부터 정렬 -->
		<div class="col-md-5 text-left"> <!-- col-md-5 사용하여 가로 크기 지정, text-left로 텍스트 왼쪽 정렬 -->
			<p>비회원 예매를 하시려면 약관에 동의하고 정보를 입력해주세요.</p>
		</div>
	</div>
	<!-- 약관 동의 1 -->
	<div class="row justify-content-center">
		<div class="col-md-20">
			<div class="card shadow">
				<div class="card-body">
					<h2 class="text-center mb-4">개인정보 보호를 위한 이용자 동의사항</h2>
					<!-- 약관 내용 -->
					<div class="scrollable-content" style="max-height: 200px; overflow-y: auto;">
						<h5>수집하는 개인정보 항목 및 수집 방법</h5>
						<p>	회사는 다음의 개인정보 항목을 처리하고 있습니다.</p>

						<p>	필수항목 : 카드번호, 생년월일, 핸드폰번호, IP 주소</p>

						<p>	1) 인터넷 서비스 이용과정에서 아래의 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.</p>
						<p>	① IP 주소</p>
						<p>	2) 계약에 필요한 사항</p>
						<p>	① 카드번호, 생년월일, 핸드폰번호</p>

						<h5>	회사는 다음과 같은 방법으로 개인정보를 수집하고 있습니다.</h5>
						<p>	1) 이용자의 인터넷 이용 시 자동으로 생성되는 정보의 수집</p>
						<p>	2) 예약 진행 및 예약 취소시 수집</p>

						<h5>	개인정보의 수집 및 이용 목적</h5>
						<p>	회사는 다음과 같은 목적을 위하여 개인정보를 수집하며, 해당 목적 내에서만 수집한 개인정보를 이용하고 있습니다.</p>
						<p>	1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 컨텐츠 제공, 특정 맞춤 서비스 제공, 구매 및 요금 결제, 요금추심</p>

						<p>	2) 모니터링 시스템을 통한 서비스 품질 관리</p>
						<p>	개인정보의 보유 및 이용기간</p>
						<p>	고객의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
						<p>	1) 관련법령에 의한 정보보유 사유</p>
						<p>	① 계약 또는 청약철회, 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</p>


						<p>	원하지 않는 경우 개인정보 수집 및 이용에 동의하지 않을 수 있습니다. 이러한 경우 예매 서비스를 제공받으실 수 없음을 알려드립니다.</p>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="agreeCheckbox1">
						<label class="custom-control-label" for="agreeCheckbox1">수집하는 개인정보 항목 및 수집 방법, 수집/이용목적, 개인정보 보유기간에 동의합니다.</label>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 약관 동의 2 -->
	<div class="row justify-content-center mt-3">
		<div class="col-md-20">
			<div class="card shadow">
				<div class="card-body">
					<h2 class="text-center mb-4">인터넷 이용약관</h2>
					<!-- 약관 내용 -->
					<div class="scrollable-content" style="max-height: 200px; overflow-y: auto;">
						<h5>제1장 총칙</h5>
						<h5>	제1조 (목적)</h5>
						<p>	이 약관은 ㈜이동의즐거움이 제공하는 시외버스 승차권 통합 예약/예매/안내 사이트에서 제공하는 제반 서비스의 이용과 관련하여 회사와 고객의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 한다.</p>

						<h5>제2조 (용어의 정의)</h5>
						<p>	① "회사"란 재화나 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 구성한 인터넷상의 영업공간을 만들고, 그 영업공간을 운영하는 사업자를 말합니다.</p>
						<p>	② "www.bustago.or.kr"란 회사가 재화나 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 구성한 인터넷상의 영업공간을 말합니다.</p>
						<p>	③ "이용자"란 이 약관에 따라 "www.bustago.or.kr"가 제공하는 서비스를 이용하는 자를 말합니다.</p>
						<p>	④ "결제"란 이용자가 "www.bustago.or.kr" 서비스 이용을 위해 결제수단으로 일정금액을 지불하는 행위를 말합니다.</p>
						<p>	⑤ "환불"이란 이용자가 결제한 내역에 대해 취소 요청을 하는 경우 결제한 금액을 이용자에게 돌려주는 행위를 말합니다.</p>

						<h5>제3조 (약관의 게시와 개정)</h5>
						<p>	① 회사는 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자 등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 쉽게 확인할 수 있도록 "www.bustago.or.kr" 초기 서비스화면에 게시하거나 기타의 방법으로 이용자에게 공지합니다.</p>
						<p>	② 회사는 「약관의 규제에 관한 법률」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련법을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
						<p>	③ 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고, 그 이전에 체결된 계약에 대해서는 개정 전의 약관이 적용됩니다.</p>
						<p>	④ 이 약관에 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자거래기본법」, 「전자거래소비자보호지침」 및 관계법령 또는 상관례에 따릅니다.</p>

						<h5>제4조 (이용계약 체결)</h5>
						<p>	- 이용계약은 이용자의 약관동의, 이용신청, 회사의 승낙에 의하여 체결됩니다.</p>
						<p>	- 회사는 다음 각 호의 1에 해당하는 경우에는 이용신청을 승낙하지 아니할 수 있습니다.</p>

						<p>	1. 서비스 관련 설비의 용량이 부족한 경우</p>
						<p>	2. 기술상 장애 사유가 있는 경우</p>
						<p>	3. 본인의 실명으로 신청하지 아니한 경우</p>
						<p>	4. 이용신청 시 필요 내용을 허위로 기재하여 신청한 경우</p>
						<p>	5. 공공질서 또는 건전한 미풍약속을 저해할 우려가 있는 경우</p>
						<p>	6. 기타 회사가 필요하다고 인정한 경우</p>

						<h5>제5조 (서비스의 제공 및 변경)</h5>
						<p>	① 회사는 특별한 사유가 없는 한 "www.bustago.or.kr"가 제공하는 서비스를 항시 이용할 수 있도록 합니다.</p>
						<p>	② 회사는 기술적 사양의 변경 또는 기타 불가피한 여건이나 사정 등이 있는 경우에는 장차 체결되는 계약에 의해 제공할 서비스의 내용을 변경할 수 있습니다.</p>
						<p>	이 경우에는 변경된 서비스의 내용 및 제공일자를 명시하여 이용자에게 공지합니다. 단, 제6조 1항의 사유에 해당하는 경우에는 공지하지 않을 수 있습니다.</p>

						<h5>제6조 (서비스의 중단)</h5>
						<p>	① 회사는 다음 각 호의할 수 1에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중단 있습니다</p>
						<p>	1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우</p>
						<p>	2. 고객이 회사의 영업활동을 방해하는 경우</p>
						<p>	3. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</p>
						<p>	4. 서비스 제공업자와의 계약 종료 등과 같은 회사의 제반 사정으로 서비스를 유지할 수 없는 경우</p>
						<p>	5. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</p>
						<p>	② 제1항의 서비스의 제한 또는 중단의 경우에는 내용 및 일자를 이용자에게 공지합니다. 단, 회사가 통제할 수 없는 사유로 인한 서비스의 중단 등 사전 통지가 불가능한 경우에는 공지하지 않을 수 있습니다.</p>
						<p>	③ 회사는 회사의 고의 또는 과실이 없는 서비스의 제한 또는 중단으로 인하여 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.</p>

						<h5>제3장 계약 당사자의 의무</h5>
						<h5>제7조 (회사의 의무)</h5>
						<p>	① 회사는 법령과 이 약관이 금지하거나 공공질서, 미풍양속에 반하는 행위를 하지 않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 재화 및 용역을 제공하는데 최선을 다하여야 합니다.</p>
						<p>	② 회사는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.</p>
						<p>	③ 회사가 상품이나 용역에 대하여 「표시•광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시 또는 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p>
						<p>	④ 회사는 이용자가 원하지 않는 영리목적의 광고성 전자 우편을 발송하지 않습니다.</p>

						<h5>제8조 (이용자의 의무)</h5>
						<p>	① 이용자는 관계법령, 이 약관의 규정, 이용안내 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안됩니다.</p>
						<p>	② 이용자는 서비스의 일부로 보내지는 회사의 전자우편을 받는 것에 동의합니다.</p>
						<p>	③ 이용자는 서비스 이용과 관련하여 다음 각 호의 행위를 해서는 안됩니다.</p>
						<p>	1. 서비스 신청 또는 변경 시 허위내용의 등록</p>
						<p>	2. "www.bustago.or.kr"에 게시된 정보의 허가 받지 않은 변경</p>
						<p>	3. 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시</p>
						<p>	4. 회사 기타 제3자의 저작권 등 지적 재산권에 대한 침해</p>
						<p>	5. 회사 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</p>
						<p>	6. 외설 또는 폭력적인 메시지, 화상, 음성 기타 공공질서 미풍양속에 반하는 정보를 "www.bustago.or.kr"에 공개 또는 게시하는 행위</p>
						<p>	7. 기타 방송통신심의위원회의 시정을 요구 받는 행위</p>

						<h5>제4장 결재관련 의무</h5>
						<h5>제9조 (결제수단)</h5>
						<p>	홈페이지에서 구매하는 재화 또는 용역에 대한 결제수단은 신용카드 또는 기타 회사가 추가로 정의하는 결제수단입니다.</p>

						<h5>제10조 (결제내용)</h5>
						<p>	① 홈페이지에서 승차권 예매 시 예매 수수료는 없습니다.</p>
						<p>	② 홈페이지에서 승차권 예매 시 신용카드 결제는 인터넷 예매시점에 이루어집니다.</p>

						<h5>제5장 서비스의 이용</h5>
						<h5>제11조 (서비스 이용시간)</h5>
						<p>	① 서비스 이용시간은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기점검 등의 필요로 회사가 정한 날이나 시간은 제외됩니다.</p>
						<p>	② 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 이용자에게 사전에 공지합니다.</p>

						<h5>제12조 (서비스 이용책임)</h5>
						<p>	① 이용자는 회사에서 권한 있는 사원이 서명한 명시적인 서면에 의해 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업활동을 할 수 없으며, 특히 해킹, 도박•음란 사이트 등을 통한 상업행위, 상용S/W 불법 배포 등을 할 수 없습니다.</p>
						<p>	② 회사는 이용자가 본조 제1항을 어기고 발생한 영업활동의 결과 및 관계기관에 의한 사법조치 등에 대해서는 책임을 지지 않습니다.</p>

						<h5>제13조 (정보의 제공)</h5>
						<p>	회사는 이용자가 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대해서 전자우편 또는 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.</p>

						<h5>제14조 (게시물의 삭제)</h5>
						<p>	회사는 이용자가 게시하거나 등록하는 서비스의 내용물이 다음 각 항의 1에 해당한다고 판단되는 경우에는 사전통지 없이 삭제할 수 있습니다.</p>
						<p>	① 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우</p>
						<p>	② 공공질서 및 미풍양속에 위반되는 내용을 기재하거나 인터넷 사이트를 링크하는 경우</p>
						<p>	③ 범죄적 행위에 결부된다고 인정되는 경우</p>
						<p>	④ 회사의 저작권, 제3자의 저작권 등의 권리를 침해하는 내용인 경우</p>
						<p>	⑤ 기타 관계법령에 위반된다고 판단되는 경우</p>

						<h5>제15조 (게시물의 저작권)</h5>
						<p>	① 게시물에 대한 권리와 책임은 게시자에게 있으며, 회사는 게시자의 동의 없이는 이를 사이트 내 게재 이외의 영리목적으로 사용할 수 없습니다.</p>
						<p>	② 이용자는 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.</p>

						<h5>제16조 (이용자에 대한 통지)</h5>
						<p>	① 회사가 이용자에 대한 통지를 하는 경우 이용자가 회사에 제출한 전자우편 주소로 할 수 있습니다.</p>
						<p>	② 회사는 불특정다수 이용자에 대한 통지의 경우 1주일 이상 사이트에 게시함으로써 개별 통지에 갈음할 수 있습니다.</p>

						<h5>제6장 취소 및 환불</h5>
						<h5>제17조 (취소, 환불)</h5>
						<p>	① 예매한 승차권의 취소는 운송약관에 명시된 내용에 따릅니다.</p>
						<p>	② 예매 및 취소의 마감 시간 기준은 "www.bustago.or.kr" 해당 터미널의 사정에 따라 다를 수 있습니다.</p>
						<p>	③ 전항의 예매 및 취소의 마감 시간은 버스회사, 터미널 등 관련기관의 사정에 의해 변경될 수 있습니다.</p>
						<p>	예매한 승차권의 취소 시 취소시점에 따라 수수료가 부과될 수 있습니다.</p>
						<p>	④ 승차권을 예매하고 터미널에서 해당 승차권을 발권한 후 또는 해당 차량이 출발한 이후의 환불에 대하여는 운송약관의 규정에 따라 수수료가 부과될 수 있습니다.</p>
						<p>	⑤ 기타 본 약관 및 이용안내에 규정되지 않은 환불 및 취소에 대한 사항 및 수수료의 적용에 대해서는 「소비자 피해보상규정」에 따릅니다.</p>

						<h5>제18조 (수수료의 처리)</h5>
						<p>	① 예매 취소 시에는 승인된 내역에 취소 금액을 차감 후 남은 금액에 대하여 수수료를 부과합니다.</p>
						<p>	② 환불금액의 환급 방법과 환급일은 예매 취소 시점과 해당 신용카드사의 환불 처리기준에 따라 다소 차이가 있을 수 있으며, 보다 상세한 환불 정책에 대해서는 회사 또는 해당 신용카드사로 문의하시기 바랍니다.</p>

						<h5>제7장 기타</h5>
						<h5>제19조 (저작권의 귀속 및 이용제한)</h5>
						<p>	① 회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.</p>
						<p>	② 이용자는 홈페이지를 통해 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p>

						<h5>제20조 (분쟁 해결)</h5>
						<p>	① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상하기 위해 피해보상처리기구를 설치, 운영합니다.</p>
						<p>	② 회사는 이용자가 제기하는 의견이나 불만을 신속하게 처리합니다. 단, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 통보합니다.</p>
						<p>	③ 회사와 이용자 간에 발생한 분쟁은 「전자거래기본법」에 의하여 설치된 전자거래 분쟁조정위원회의 조정에 따를 수 있습니다.</p>

						<h5>제21조 (면책조항)</h5>
						<p>	회사는 다음 각 항의 1에 해당하는 경우에는 책임을 지지 않습니다.</p>
						<p>	① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상하기 위해 피해보상처리기구를 설치, 운영합니다.</p>
						<p>	② 회사는 이용자가 제기하는 의견이나 불만을 신속하게 처리합니다. 단, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 통보합니다.</p>
						<p>	③ 회사와 이용자 간에 발생한 분쟁은 「전자거래기본법」에 의하여 설치된 전자거래 분쟁조정위원회의 조정에 따를 수 있습니다.</p>

						<h5>제22조 (관할 법원)</h5>
						<p>	홈페이지와 관련된 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.</p>

						<h5>부칙<2010. 6. 1></h5>
						<p>	① 이 약관은 2010년 6월 1일부터 시행합니다.</p>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="agreeCheckbox2">
						<label class="custom-control-label" for="agreeCheckbox2">인터넷 이용약관에 동의합니다.</label>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 전체 동의 체크박스 -->
	<div class="row justify-content-end mt-3"> <!-- justify-content-end를 사용하여 가장 오른쪽 정렬 -->
		<div class="col-md-6"> <!-- 전체 동의 체크박스의 컬럼 크기를 유지 -->
			<div class="custom-control custom-checkbox d-flex justify-content-end"> <!-- d-flex와 justify-content-end를 사용하여 내부의 컨텐츠를 오른쪽 정렬 -->
				<input type="checkbox" class="custom-control-input" id="checkAllCheckbox" onclick="checkAll()">
				<label class="custom-control-label" for="checkAllCheckbox">전체 약관에 동의합니다.</label>
			</div>
		</div>
	</div>

	<!-- 비회원 정보 입력 폼 -->
	<div class="row justify-content-center mt-3 mt-bottom">
		<div class="col-md-5">
			<div class="card shadow">
				<div class="card-body">
					<h2 class="text-center mb-4">비회원 정보 입력</h2>
					<form id="myForm" method="post">
						<div class="form-group">
							<input type="text" name="birth" id="birth" class="form-control" placeholder="생년월일 8자리" maxlength="8" pattern="[0-9]{8}" required>
						</div>
						<div class="form-group mt-2">
							<div class="row">
								<div class="col-4">
									<select id="phoneDropdown" class="form-control" onchange="updatePhoneNo()">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</div>
								<div class="col-4">
									<input type="text" id="phoneNo1" class="form-control" placeholder="핸드폰번호" maxlength="4" pattern="[0-9]{4}" oninput="updatePhoneNo()" required>
								</div>
								<div class="col-4">
									<input type="text" id="phoneNo2" class="form-control" placeholder="핸드폰번호" maxlength="4" pattern="[0-9]{4}" oninput="updatePhoneNo()" required>
								</div>
							</div>
						</div>
						<input type="hidden" name="phoneNo" id="phoneNo3">
						<div class="form-group mt-2">
							<button type="button" class="btn btn-primary btn-block" onclick="submitForm()">제출</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- reserve_login 끝 -->

<script>

	// 모든 필수 약관에 동의되었는지 확인
	function checkAgreements() {
		var checkbox1 = document.getElementById("agreeCheckbox1");
		var checkbox2 = document.getElementById("agreeCheckbox2");

		// 두 체크박스가 모두 체크되지 않은 경우
		if (!checkbox1.checked || !checkbox2.checked) {
			alert("약관에 모두 동의해야 합니다."); // 알림창 표시
			return false; // 폼 제출 방지
		}

		return true; // 모든 약관에 동의한 경우 폼 제출 허용
	}

	// 모든 약관 동의 체크박스를 선택/해제하는 함수
	function checkAll() {
		var checkAllCheckbox = document.getElementById("checkAllCheckbox");
		var checkbox1 = document.getElementById("agreeCheckbox1");
		var checkbox2 = document.getElementById("agreeCheckbox2");

		if (checkAllCheckbox.checked) {
			checkbox1.checked = true;
			checkbox2.checked = true;
		} else {
			checkbox1.checked = false;
			checkbox2.checked = false;
		}
	}

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
		// 폼 제출 전 약관 동의 상태 확인
		if (checkAgreements() && testDataForm()) {
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

<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>