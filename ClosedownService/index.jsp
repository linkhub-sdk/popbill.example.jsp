<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 휴폐업조회 SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>휴폐업조회</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/checkCorpNum.jsp">checkCorpNum</a> - 휴폐업 단건조회</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/checkCorpNums.jsp">checkCorpNums</a> - 휴폐업 대량조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getUnitCost.jsp">getUnitCost</a> - 발행 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/ClosedownService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getPartnerBalance.jsp">getPartnerBalance</a> -  파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/checkID.jsp">checkID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/ClosedownService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
