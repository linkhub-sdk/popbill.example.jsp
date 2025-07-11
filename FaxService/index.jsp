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
        <legend>발신번호 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/checkSenderNumber.jsp">CheckSenderNumber</a> - 발신번호 등록여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSenderNumberMgtURL.jsp">GetSenderNumberMgtURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSenderNumberList.jsp">GetSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>팩스 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAX.jsp">SendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAX_Multi.jsp">SendFAX</a> - 팩스 동보전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAXBinary.jsp">SendFAXBinary</a> - 팩스 전송(Binary)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAXBinary_Multi.jsp">SendFAXBinary</a> - 팩스 동보전송(Binary)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAX.jsp">ResendFAX</a> - 팩스 재전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAXRN.jsp">ResendFAXRN</a> - 팩스 재전송 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAX_Multi.jsp">ResendFAX</a> - 팩스 동보재전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAXRN_Multi.jsp">ResendFAXRN</a> - 팩스 동보재전송 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/cancelReserve.jsp">CancelReserve</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/cancelReserveRN.jsp">CancelReserveRN</a> - 예약전송 취소 (요청번호 할당)</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/getFaxResult.jsp">GetFaxResult</a> - 전송내역 및 전송상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getFaxResultRN.jsp">GetFaxResultRN</a> - 전송내역 및 전송상태 확인 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/search.jsp">Search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSentListURL.jsp">GetSentListURL</a> - 팩스 전송내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPreviewURL.jsp">GetPreviewURL</a> - 팩스 미리보기 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getUnitCost.jsp">GetUnitCost</a> - 전송 단가 확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
        	<li><a href="${pageContext.request.contextPath}/FaxService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/registContact.jsp">RegistContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
 </div>
</body>
</html>
