<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 홈택스수집(전자세금계산서) SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>홈택스 수집 요청</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/requestJob.jsp">RequestJob</a> - 수집 요청</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getJobState.jsp">GetJobState</a> - 수집 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/listActiveJob.jsp">ListActiveJob</a> - 수집 상태 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>수집 내역 확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/search.jsp">Search</a> - 수집 내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/summary.jsp">Summary</a> - 수집 내역 합계</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getTaxinvoice.jsp">GetTaxinvoice</a> - 수집 상세 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getXML.jsp">GetXML</a> - 수집 상세 확인 (XML)</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPopUpURL.jsp">GetPopUpURL</a> - 전자세금계산서 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPrintURL.jsp">GetPrintURL</a> - 전자세금계산서 인쇄 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>홈택스 인증 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCertificatePopUpURL.jsp">GetCertificatePopUpURL</a> - 홈택스 인증정보 등록 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCertificateExpireDate.jsp">GetCertificateExpireDate</a> - 인증서 만료일자 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkCertValidation.jsp">CheckCertValidation</a> - 인증서 유효성 검증</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/registDeptUser.jsp">RegistDeptUser</a> - 부서사용자 계정 등록</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkDeptUser.jsp">CheckDeptUser</a> - 부서사용자 등록 여부</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkLoginDeptUser.jsp">CheckLoginDeptUser</a> - 부서사용자 유효성 검증</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/deleteDeptUser.jsp">DeleteDeptUser</a> - 부서사용자 계정 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정액제 신청 / 포인트 관리</legend>
        <ul>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getFlatRateState.jsp">GetFlatRateState</a> - 정액제 서비스 상태 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getFlatRatePopUpURL.jsp">GetFlatRatePopUpURL</a> - 정액제 신청 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트 충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/registContact.jsp">RegistContact</a> - 담당자 추가</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/HTTaxinvoiceService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
