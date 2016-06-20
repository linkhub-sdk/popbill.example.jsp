<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />

		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>

		<div id="content">

			<p class="heading1">팝빌 팩스 SDK jsp Example.</p>

			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>
				<fieldset class="fieldset2">
					<legend>회원사 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/FaxService/checkCorpIsMember.jsp">checkCorpIsMember</a> - 연동회원사 가입 여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/joinMember.jsp">joinMember</a> - 연동회원사 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원사 과금정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getBalance.jsp">getBalance</a> - 연동회원사 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
					</ul>
				</fieldset>
			</fieldset>

			<br />

			<fieldset class="fieldset1">
				<legend>팩스 관련 API</legend>

				<fieldset class="fieldset2">
					<legend>팩스 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/FaxService/sendFAX.jsp">sendFAX</a> - 팩스 전송. 1파일 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/sendFAX_Multi.jsp">sendFAX</a> - 팩스 전송. 1파일 동보 전송(수신번호 최대 1000개)</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>전송결과/예약취소</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/FaxService/search.jsp">search</a> - 팩스전송내역 조회</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/getFaxResult.jsp">getFaxResult</a> - 접수번호에 해당하는 팩스 전송결과 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/cancelReserve.jsp">cancelReserve</a> - 예약전송 팩스의 예약 취소. 예약시간 10분전까지만 가능.</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/FaxService/getURL.jsp">getURL</a> - 팩스 관련 SSO URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/FaxService/getUnitCost.jsp">getUnitCost</a> - 팩스 발송 단가 확인</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
