<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 기업정보조회 SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>기업정보조회</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/checkBizInfo.jsp">checkBizInfo</a> - 기업정보조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getUnitCost.jsp">getUnitCost</a> - 조회 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
	        <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getRefundableBalance">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>

        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/checkID.jsp">checkID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/BizInfoCheckService/quitMember.jsp">QuitMember</a> - 팝빌 회원 탈퇴</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
