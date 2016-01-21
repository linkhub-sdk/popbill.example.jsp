<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		
		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>

		<div id="content">

			<p class="heading1">팝빌 문자메시지 Api SDK jsp Example.</p>
			
			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>

				<fieldset class="fieldset2">
					<legend>회원사 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/checkCorpIsMember.jsp">checkCorpIsMember</a> - 연동회원사 가입 여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/joinMember.jsp">joinMember</a> - 연동회원사 가입 요청</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getBalance.jsp">getBalance</a> - 연동회원사 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
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
				<legend>문제메시지 관련 API</legend>
				
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
					<legend>멀티 문자 전송</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendMMS.jsp">sendMMS</a> - 멀티 문자메시지 1건 전송</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_Multi.jsp">sendMMS</a> - 멀티 문자메시지 다량(최대1000건) 전송</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>전송결과/예약취소</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/search.jsp">search</a> - 문자전송내역 조회 </li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getMessages.jsp">getMessages</a> - 접수번호에 해당하는 문제메시지 전송결과 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/cancelReserve.jsp">cancelReserve</a> - 예약문자메시지의 예약취소. 예약시간 10분전까지만 가능.</li>
					</ul>
				</fieldset>
				
				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/MessageService/getURL.jsp">getURL</a> - 문자메시지 관련 SSO URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/MessageService/getUnitCost.jsp">getUnitCost</a> - 문자메시지 전송 단가 확인</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>