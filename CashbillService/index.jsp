<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />

		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>
		<div id="content">
			<p class="heading1">팝빌 현금영수증 SDK jsp Example.</p>
			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>
				<fieldset class="fieldset2">
					<legend>회원 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/joinMember.jsp">joinMember</a> - 연동회원 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원 과금정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
					</ul>
				</fieldset>
			</fieldset>

			<br />

			<fieldset class="fieldset1">
				<legend>현금영수증 관련 API</legend>

				<fieldset class="fieldset2">
					<legend>등록/수정/확인/삭제</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 문서관리번호 사용여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/registIssue.jsp">registIssue</a> - 현금영수증 즉시발행</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/register.jsp">register</a> - 현금영수증 등록</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/update.jsp">update</a> - 현금영수증 수정</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/search.jsp">search</a> - 현금영수증 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getInfo.jsp">getInfo</a> - 현금영수증 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getInfos.jsp">getInfos</a> - 현금영수증 상태/요약 정보 확인 - 대량</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getDetailInfo.jsp">getDetailInfo</a> - 현금영수증 상세정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/delete.jsp">delete</a> - 현금영수증 삭제</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getLogs.jsp">getLogs</a> - 현금영수증 상태변경 이력 확인</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>처리 프로세스</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/issue.jsp">issue</a> - 현금영수증 발행</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/cancelIssue.jsp">cancelIssue</a> - 현금영수증 발행취소</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>부가 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/sendEmail.jsp">sendEmail</a> - 현금영수증 이메일 재전송</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/sendSMS.jsp">sendSMS</a> - 안내문자 메시지 전송</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/sendFAX.jsp">sendFAX</a> - 현금영수증 팩스 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>팝빌 현금영수증 SSO URL 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getURL.jsp">getURL</a> - 현금영수증 관련 SSO URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getPopUpURL.jsp">getPopUpURL</a> - 현금영수증 보기 팝업 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getPrintURL.jsp">getPrintURL</a> - 현금영수증 인쇄 팝업 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getMassPrintURL.jsp">getMassPrintURL</a> - 현금영수증 인쇄 팝업 URL 확인 - 대량</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getEPrintURL.jsp">getEPrintURL</a> - 현금영수증 인쇄 팝업 URL - 공급받는자용</li>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getMailURL.jsp">getMailURL</a> - 현금영수증 메일링크 URL</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/CashbillService/getUnitCost.jsp">getUnitCost</a> - 현금영수증 발행단가</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
