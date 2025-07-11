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
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkMgtKeyInUse.jsp">CheckMgtKeyInUse</a> - 문서번호 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/registIssue.jsp">RegistIssue</a> - 즉시발행</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/bulkSubmit.jsp">BulkSubmit</a> - 초대량 발행 접수</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getBulkResult.jsp">GetBulkResult</a> - 초대량 접수결과 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/delete.jsp">Delete</a> - 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>취소현금영수증 발행</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/revokeRegistIssue.jsp">RevokeRegistIssue</a> - 즉시발행</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/revokeRegistIssue_part.jsp">RevokeRegistIssue_part</a> - 부분) 즉시발행</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>현금영수증 정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getInfo.jsp">GetInfo</a> - 상태확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getInfos.jsp">GetInfos</a> - 상태 대량 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getDetailInfo.jsp">GetDetailInfo</a> - 상세정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/search.jsp">Search</a> - 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getURL.jsp">GetURL</a> - 현금영수증 문서함 관련 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>현금영수증 보기/인쇄</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPopUpURL.jsp">GetPopUpURL</a> - 현금영수증 보기 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getViewURL.jsp">GetViewURL</a> - 현금영수증 보기 URL - 메뉴/버튼 제외</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPrintURL.jsp">GetPrintURL</a> - 현금영수증 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getMassPrintURL.jsp">GetMassPrintURL</a> - 현금영수증 대량 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getMailURL.jsp">GetMailURL</a> - 현금영수증 메일링크 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getPDFURL.jsp">GetPDFURL</a> - 현금영수증 PDF 다운로드 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>부가기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getAccessURL.jsp">GetAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendEmail.jsp">SendEmail</a> - 메일 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendSMS.jsp">SendSMS</a> - 문자 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/sendFAX.jsp">SendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/listEmailConfig.jsp">ListEmailConfig</a> - 현금영수증 알림메일 전송목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateEmailConfig.jsp">UpdateEmailConfig</a> - 현금영수증 알림메일 전송설정 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/assignMgtKey.jsp">AssignMgtKey</a> - 현금영수증 문서번호 할당</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUnitCost.jsp">GetUnitCost</a> - 발행 단가 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트충전 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/paymentRequest.jsp">PaymentRequest</a> - 무통장 입금신청</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getSettleResult.jsp">GetSettleResult</a> - 무통장 입금신청 정보확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPaymentHistory.jsp">GetPaymentHistory</a> - 포인트 결제내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUseHistory.jsp">GetUseHistory</a> - 포인트 사용내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 URL</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/refund.jsp">Refund</a> - 환불 신청</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundHistory.jsp">GetRefundHistory</a> - 환불 신청내역 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
	        <li><a href="${pageContext.request.contextPath}/CashbillService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundInfo.jsp">GetRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/registContact.jsp">RegistContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/CashbillService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
