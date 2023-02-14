<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 문자 API SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>발신번호 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkSenderNumber.jsp">checkSenderNumber</a> - 발신번호 등록여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSenderNumberMgtURL.jsp">getSenderNumberMgtURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSenderNumberList.jsp">getSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>문자 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendSMS.jsp">sendSMS</a> - 단문 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendSMS_Multi.jsp">sendSMS</a> - 단문 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendLMS.jsp">sendLMS</a> - 장문 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendLMS_Multi.jsp">sendLMS</a> - 장문 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS.jsp">sendMMS</a> - 포토 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_Multi.jsp">sendMMS</a> - 포토 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendXMS.jsp">sendXMS</a> - 단문/장문 자동인식 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendXMS_Multi.jsp">sendXMS</a> - 단문/장문 자동인식 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getMessages.jsp">getMessages</a> - 전송내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getMessagesRN.jsp">getMessagesRN</a> - 전송내역 확인 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkAutoDenyNumber.jsp">checkAutoDenyNumber</a> - 발신번호 등록여부 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserve.jsp">cancelReserve</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserveRN.jsp">cancelReserveRN</a> - 예약전송 취소 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReservebyRCV.jsp">cancelReservebyRCV</a> - 예약전송 취소 (접수번호, 수신번호)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserveRNbyRCV.jsp">cancelReserveRNbyRCV</a> - 예약전송 취소 (요청번호, 수신번호)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/search.jsp">search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSentListURL.jsp">getSentListURL</a> - 문자 전송내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getAutoDenyList.jsp">getAutoDenyList</a> - 080 수신거부 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUnitCost.jsp">getUnitCost</a> - 전송 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkID.jsp">checkID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
