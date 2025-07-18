<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 계좌 간편조회 API SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>계좌관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/registBankAccount.jsp">RegistBankAccount</a> - 계좌 등록</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/updateBankAccount.jsp">UpdateBankAccount</a> - 계좌정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getBankAccountInfo.jsp">GetBankAccountInfo</a> - 계좌정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/listBankAccount.jsp">ListBankAccount</a> - 계좌정보 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getBankAccountMgtURL.jsp">GetBankAccountMgtURL</a> - 계좌 등록 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/closeBankAccount.jsp">CloseBankAccount</a> - 정액제 해지요청</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/revokeCloseBankAccount.jsp">RevokeCloseBankAccount</a> - 정액제 해지요청 취소</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/deleteBankAccount.jsp">DeleteBankAccount</a> - 계좌 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>계좌 거래내역 수집 요청</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/requestJob.jsp">RequestJob</a> - 수집 요청</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getJobState.jsp">GetJobState</a> - 수집 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/listActiveJob.jsp">ListActiveJob</a> - 수집 상태 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>계좌 거내내역 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/search.jsp">Search</a> - 수집 내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/summary.jsp">Summary</a> - 수집 내역 합계</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/saveMemo.jsp">SaveMemo</a> - 거래 내역 메모저장</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정액제 신청 / 포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getFlatRateState.jsp">GetFlatRateState</a> - 정액제 서비스 상태 확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getFlatRatePopUpURL.jsp">GetFlatRatePopUpURL</a> - 정액제 신청 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트 충전 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/paymentRequest.jsp">PaymentRequest</a> - 연동회원 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getSettleResult.jsp">GetSettleResult</a> - 연동회원 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getPaymentHistory.jsp">GetPaymentHistory</a> - 연동회원 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getUseHistory.jsp">GetUseHistory</a> - 연동회원 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 팝업 URL</li>
	        <li><a href="${pageContext.request.contextPath}/EasyFinService/refund.jsp">Refund</a> - 연동회원 포인트 환불신청</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getRefundHistory.jsp">GetRefundHistory</a> - 연동회원 포인트 환불내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/registContact.jsp">RegistContact</a> - 담당자 추가</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/EasyFinService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
