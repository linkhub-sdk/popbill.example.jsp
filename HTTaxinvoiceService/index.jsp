<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />

		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>

		<div id="content">

			<p class="heading1">팝빌 홈택스 전자(세금)계산서 연계 SDK jsp Example.</p>

			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>
				<fieldset class="fieldset2">
					<legend>회원 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/joinMember.jsp">joinMember</a> - 연동회원 가입 요청</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getChargeInfo.jsp">getChargeInfo</a> - 연동회원 과금정보 확인 </li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트 충전 URL</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>

					</ul>
				</fieldset>

			</fieldset>

			<br />

			<fieldset class="fieldset1">
				<legend>홈택스 전자(세금)계산서 관련 API</legend>

				<fieldset class="fieldset2">
					<legend>홈택스 전자(세금)계산서 매출/매입 내역 수집</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/requestJob.jsp">requestJob</a> - 수집 요청</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getJobState.jsp">getJobState</a> - 수집 상태 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/listActiveJob.jsp">listActiveJob</a> - 수집 상태 목록 확인</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>홈택스 전자(세금)계산서 매출/매입 내역 수집 결과 조회</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/search.jsp">search</a> - 수집 결과 조회</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/summary.jsp">summary</a> - 수집 결과 요약정보 조회</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getTaxinvoice.jsp">getTaxinvoice</a> - 상세정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getXML.jsp">getXML</a> - 상세정보 확인 (XML)</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPopUpURL.jsp">getPopUpURL</a> - 홈택스 전자세금계산서 팝업 URL</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>부가 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getFlatRatePopUpURL.jsp">getFlatRatePopUpURL</a> - 정액제 서비스 신청 URL</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getFlatRateState.jsp">getFlatRateState</a> - 정액제 서비스 상태 확인</li>
					</ul>
				</fieldset>

				<fieldset class="fieldset2">
					<legend>홈택스 인증관련 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCertificatePopUpURL.jsp">getCertificatePopUpURL</a> - 홈택스연동 인증관리 팝업 URL</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCertificateExpireDate.jsp">getCertificateExpireDate</a> - 홈택스연동 공인인증서 만료일자 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkCertValidation.jsp">checkCertValidation</a> - 홈택스 공인인증서 로그인 테스트</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/registDeptUser.jsp">registDeptUser</a> - 홈택스 전자세금계산서 부서사용자 계정등록</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkDeptUser.jsp">checkDeptUser</a> - 홈택스 부서사용자 등록정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkLoginDeptUser.jsp">checkLoginDeptUser</a> - 홈택스 부서사용자 로그인 테스트</li>
						<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/deleteDeptUser.jsp">deleteDeptUser</a> - 홈택스 부서사용자 등록정보 삭제</li>
					</ul>
				</fieldset>

			</fieldset>
		 </div>
	</body>
</html>
