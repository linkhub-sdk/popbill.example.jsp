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
            <li><a href="${pageContext.request.contextPath}/MessageService/checkSenderNumber.jsp">CheckSenderNumber</a> - 발신번호 등록여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSenderNumberMgtURL.jsp">GetSenderNumberMgtURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSenderNumberList.jsp">GetSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>문자 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendSMS.jsp">SendSMS</a> - 단문 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendSMS_Multi.jsp">SendSMS</a> - 단문 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendLMS.jsp">SendLMS</a> - 장문 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendLMS_Multi.jsp">SendLMS</a> - 장문 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS.jsp">SendMMS</a> - 포토 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_Multi.jsp">SendMMS</a> - 포토 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_binary.jsp">SendMMSBinary</a> - 포토 전송 (Binary)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendMMS_Multi_binary.jsp">SendMMSBinary</a> - 포토 전송 [대량] (Binary)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendXMS.jsp">SendXMS</a> - 단문/장문 자동인식 전송</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/sendXMS_Multi.jsp">SendXMS</a> - 단문/장문 자동인식 전송 [대량]</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getMessages.jsp">GetMessages</a> - 전송내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getMessagesRN.jsp">GetMessagesRN</a> - 전송내역 확인 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkAutoDenyNumber.jsp">CheckAutoDenyNumber</a> - 발신번호 등록여부 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserve.jsp">CancelReserve</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserveRN.jsp">CancelReserveRN</a> - 예약전송 취소 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReservebyRCV.jsp">CancelReservebyRCV</a> - 예약전송 취소 (접수번호, 수신번호)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/cancelReserveRNbyRCV.jsp">CancelReserveRNbyRCV</a> - 예약전송 취소 (요청번호, 수신번호)</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/search.jsp">Search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getSentListURL.jsp">GetSentListURL</a> - 문자 전송내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getAutoDenyList.jsp">GetAutoDenyList</a> - 080 수신거부 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUnitCost.jsp">GetUnitCost</a> - 전송 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/MessageService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/registContact.jsp">RegistContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/MessageService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
