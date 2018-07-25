<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />

		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>

		<div id="content">

			<p class="heading1">팝빌 문자 API SDK jsp Example.</p>

			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>

				<fieldset class="fieldset2">
					<legend>회원 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/joinMember.jsp">joinMember</a> - 연동회원 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원 과금정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트 충전 URL</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
					</ul>
				</fieldset>

			</fieldset>

			<br />

			<fieldset class="fieldset1">
				<legend>문자 전송 관련 API</legend>

				<fieldset class="fieldset2">
					<legend>단문 문자 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendSMS.jsp">sendSMS</a> - 단문 문자메시지 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendSMS_Multi.jsp">sendSMS</a> - 단문 문자메시지 다량(최대1000건) 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>장문 문자 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendLMS.jsp">sendLMS</a> - 장문 문자메시지 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendLMS_Multi.jsp">sendLMS</a> - 장문 문자메시지 다량(최대1000건) 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>단/장문 자동인식 문자 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendXMS.jsp">sendXMS</a> - 단/장문 문자메시지 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendXMS_Multi.jsp">sendXMS</a> - 단/장문 문자메시지 다량(최대1000건) 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>포토 문자 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendMMS.jsp">sendMMS</a> - 포토(멀티) 문자메시지 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_Multi.jsp">sendMMS</a> - 포토(멀티) 문자메시지 다량(최대1000건) 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>전송내역조회/요약정보확인</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/search.jsp">search</a> - 문자전송내역 조회 </li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getStates.jsp">getStates</a> - 문자메시지 전송결과 요약정보 확인</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>접수번호 관련 기능 (요청번호 미할당)</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/getMessages.jsp">getMessages</a> - 문자메시지 전송결과 조회</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/cancelReserve.jsp">cancelReserve</a> - 예약문자메시지 취소</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>요청번호 할당 전송건 관련 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/getMessagesRN.jsp">getMessagesRN</a> - 문자메시지 전송결과 조회</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/cancelReserveRN.jsp">cancelReserveRN</a> - 예약문자메시지 취소</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/getAutoDenyList.jsp">getAutoDenyList</a> - 080 수신거부목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getURL.jsp">getURL</a> - 문자전송 내역 보기 팝업 URL</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getUnitCost.jsp">getUnitCost</a> - 문자메시지 전송단가 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSenderNumberList.jsp">getSenderNumberList</a> - 문자 발신번호 목록 확인</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
