<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 현금영수증 SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>현금영수증 발행</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 문서번호 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/registIssue.jsp">registIssue</a> - 즉시발행</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/bulkSubmit.jsp">bulkSubmit</a> - 초대량 발행 접수</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getBulkResult.jsp">getBulkResult</a> - 초대량 접수결과 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/delete.jsp">delete</a> - 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>취소현금영수증 발행</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/revokeRegistIssue.jsp">revokeRegistIssue</a> - 즉시발행</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/revokeRegistIssue_part.jsp">revokeRegistIssue_part</a> - 부분) 즉시발행</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>현금영수증 정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getInfo.jsp">getInfo</a> - 상태확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getInfos.jsp">getInfos</a> - 상태 대량 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getDetailInfo.jsp">getDetailInfo</a> - 상세정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/search.jsp">search</a> - 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getURL.jsp">getURL</a> - 현금영수증 문서함 관련 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>현금영수증 보기/인쇄</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPopUpURL.jsp">getPopUpURL</a> - 현금영수증 보기 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getViewURL.jsp">getViewURL</a> - 현금영수증 보기 URL - 메뉴/버튼 제외</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPrintURL.jsp">getPrintURL</a> - 현금영수증 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getMassPrintURL.jsp">getMassPrintURL</a> - 현금영수증 대량 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getMailURL.jsp">getMailURL</a> - 현금영수증 메일링크 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPDFURL.jsp">getPDFURL</a> - 현금영수증 PDF 다운로드 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>부가기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendEmail.jsp">sendEmail</a> - 메일 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendSMS.jsp">sendSMS</a> - 문자 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendFAX.jsp">sendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/listEmailConfig.jsp">listEmailConfig</a> - 현금영수증 알림메일 전송목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateEmailConfig.jsp">updateEmailConfig</a> - 현금영수증 알림메일 전송설정 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/assignMgtKey.jsp">assignMgtKey</a> - 현금영수증 문서번호 할당</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUnitCost.jsp">getUnitCost</a> - 발행 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트충전 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/paymentRequest.jsp">PaymentRequest</a> - 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getSettleResult.jsp">GetSettleResult</a> - 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPaymentHistory.jsp">GetPaymentHistory</a> - 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUseHistory.jsp">GetUseHistory</a> - 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/refund.jsp">Refund</a> - 환불 신청</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundHistory.jsp">GetRefundHistory</a> - 환불 신청내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkID.jsp">checkID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/deleteContact.jsp">deleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
