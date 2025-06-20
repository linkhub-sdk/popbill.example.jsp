<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 홈택스수집(현금영수증) SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>홈택스 수집 요청</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/requestJob.jsp">requestJob</a> - 수집 요청</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getJobState.jsp">getJobState</a> - 수집 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/listActiveJob.jsp">listActiveJob</a> - 수집 상태 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>수집 내역 확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/search.jsp">search</a> - 수집 내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/summary.jsp">summary</a> - 수집 내역 합계</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>홈택스 인증 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getCertificatePopUpURL.jsp">getCertificatePopUpURL</a> - 홈택스 인증정보 등록 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getCertificateExpireDate.jsp">getCertificateExpireDate</a> - 인증서 만료일자 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/checkCertValidation.jsp">checkCertValidation</a> - 인증서 유효성 검증</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/registDeptUser.jsp">registDeptUser</a> - 부서사용자 계정 등록</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/checkDeptUser.jsp">checkDeptUser</a> - 부서사용자 등록 여부</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/checkLoginDeptUser.jsp">checkLoginDeptUser</a> - 부서사용자 유효성 검증</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/deleteDeptUser.jsp">deleteDeptUser</a> - 부서사용자 계정 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정액제 신청 / 포인트 관리</legend>
        <ul>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getFlatRateState.jsp">getFlatRateState</a> - 정액제 서비스 상태 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getFlatRatePopUpURL.jsp">getFlatRatePopUpURL</a> - 정액제 신청 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
        	<li><a href="${pageContext.request.contextPath}/HTCashbillService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트 충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/checkID.jsp">checkID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/registContact.jsp">registContact</a> - 담당자 추가</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/HTCashbillService/deleteContact.jsp">deleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
