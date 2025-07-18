<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 카카오톡 API SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>비즈니스 채널 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPlusFriendMgtURL.jsp">GetPlusFriendMgtURL</a> - 비즈니스 채널 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listPlusFriendID.jsp">ListPlusFriendID</a> - 비즈니스 채널 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>발신번호 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/checkSenderNumber.jsp">CheckSenderNumber</a> - 발신번호 등록여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getSenderNumberMgtURL.jsp">GetSenderNumberMgtURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getSenderNumberList.jsp">GetSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>알림톡 템플릿 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getATSTemplateMgtURL.jsp">GetATSTemplateMgtURL</a> - 알림톡 템플릿관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getATSTemplate.jsp">GetATSTemplate</a> - 알림톡 템플릿 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listATSTemplate.jsp">ListATSTemplate</a> - 알림톡 템플릿 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>알림톡 / 친구톡 전송</legend>
        <fieldset class="fieldset2">
            <legend>알림톡 전송</legend>
            <ul>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_one.jsp">SendATS</a> - 알림톡 단건 전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_same.jsp">SendATS</a> - 알림톡 동일내용 대량 전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_multi.jsp">SendATS</a> - 알림톡 개별내용 대량 전송</li>
            </ul>
        </fieldset>
        <fieldset class="fieldset2">
            <legend>친구톡 텍스트 전송</legend>
            <ul>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_one.jsp">SendFTS</a> - 친구톡 텍스트 단건 전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_same.jsp">SendFTS</a> - 친구톡 텍스트 동일내용 대량전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_multi.jsp">SendFTS</a> - 친구톡 텍스트 개별내용 대량전송</li>
            </ul>
        </fieldset>
        <fieldset class="fieldset2">
            <legend>친구톡 이미지 전송</legend>
            <ul>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_one.jsp">SendFMS</a> - 친구톡 이미지 단건 전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_same.jsp">SendFMS</a> - 친구톡 이미지 동일내용 대량전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_multi.jsp">SendFMS</a> - 친구톡 이미지 개별내용 대량전송</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_one_binary.jsp">SendFMSBinary</a> - 친구톡 이미지 단건 전송 (Binary)</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_same_binary.jsp">SendFMSBinary</a> - 친구톡 이미지 동일내용 대량전송 (Binary)</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_multi_binary.jsp">SendFMSBinary</a> - 친구톡 이미지 개별내용 대량전송 (Binary)</li>
            </ul>
        </fieldset>
        <fieldset class="fieldset2">
            <legend>예약전송 취소</legend>
            <ul>
                <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReserve.jsp">CancelReserve</a> - 예약전송 취소</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReservebyRCV.jsp">CancelReservebyRCV</a> - 예약전송 일부 취소 (접수번호)</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReserveRN.jsp">CancelReserveRN</a> - 예약전송 취소 (요청번호 할당)</li>
                <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReserveRNbyRCV.jsp">CancelReserveRNbyRCV</a> - 예약전송 일부 취소 (전송요청번호)</li>
            </ul>
        </fieldset>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getMessages.jsp">GetMessages</a> - 알림톡/친구톡 전송내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getMessagesRN.jsp">GetMessagesRN</a> - 알림톡/친구톡 전송내역 확인 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/search.jsp">Search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getSentListURL.jsp">GetSentListURL</a> - 카카오톡 전송내역 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getUnitCost.jsp">GetUnitCost</a> - 전송 단가 확인</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getChargeURL.jsp">GetChargeURL</a> 연동회원 포인트 충전 팝업 URL</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
        	<li><a href="${pageContext.request.contextPath}/KakaoService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/checkID.jsp">CheckID</a> - 연동회원 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/joinMember.jsp">JoinMember</a> - 연동회원사 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/registContact.jsp">RegistContact</a> - 담당자 추가</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
