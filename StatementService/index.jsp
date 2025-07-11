<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">팝빌 전자명세서 SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>전자명세서 발행</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/checkMgtKeyInUse.jsp">CheckMgtKeyInUse</a> - 문서번호 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/registIssue.jsp">RegistIssue</a> - 즉시 발행</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/register.jsp">Register</a> - 임시저장</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/update.jsp">Update</a> - 수정</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/issue.jsp">Issue</a> - 발행</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/cancel.jsp">Cancel</a> - 발행취소</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/delete.jsp">Delete</a> - 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>전자명세서 정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getInfo.jsp">GetInfo</a> - 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getInfos.jsp">GetInfos</a> - 상태 대량 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getDetailInfo.jsp">GetDetailInfo</a> - 상세정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/search.jsp">Search</a> - 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getLogs.jsp">GetLogs</a> - 상태 변경이력 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getURL.jsp">GetURL</a> - 전자명세서 문서함 관련 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>전자명세서 보기/인쇄</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPopUpURL.jsp">GetPopUpURL</a> - 전자명세서 보기 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getViewURL.jsp">GetViewURL</a> - 전자명세서 보기 URL(메뉴/버튼 제외)</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPrintURL.jsp">GetPrintURL</a> - 전자명세서 인쇄 [공급자] URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getEPrintURL.jsp">getEPrintURL</a> - 전자명세서 인쇄 [공급받는자용] URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getMassPrintURL.jsp">GetMassPrintURL</a> - 전자명세서 대량 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getMailURL.jsp">GetMailURL</a> - 전자명세서 메일링크 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>부가기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getAccessURL.jsp">GetAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getSealURL.jsp">GetSealURL</a> - 인감 및 첨부문서 등록 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/attachFile.jsp">AttachFile</a> - 첨부파일 추가</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/deleteFile.jsp">DeleteFile</a> - 첨부파일 삭제</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getFiles.jsp">GetFiles</a> - 첨부파일 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendEmail.jsp">SendEmail</a> - 메일 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendSMS.jsp">SendSMS</a> - 문자 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendFAX.jsp">SendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/FAXSend.jsp">FAXSend</a> - 선팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/attachStatement.jsp">AttachStatement</a> - 전자명세서 첨부</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/detachStatement.jsp">DetachStatement</a> - 전자명세서 첨부해제</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/listEmailConfig.jsp">ListEmailConfig</a> - 전자명세서 알림메일 전송목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateEmailConfig.jsp">UpdateEmailConfig</a> - 전자명세서 알림메일 전송설정 수정</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
        	<li><a href="${pageContext.request.contextPath}/StatementService/getUnitCost.jsp">GetUnitCost</a> - 발행 단가 확인</li>
        	<li><a href="${pageContext.request.contextPath}/StatementService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getChargeURL.jsp">GetChargeURL</a> - 연동회원 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/paymentRequest.jsp">PaymentRequest</a> - 무통장 입금신청</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getSettleResult.jsp">GetSettleResult</a> - 무통장 입금신청 정보확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPaymentHistory.jsp">GetPaymentHistory</a> - 포인트 결제내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPaymentURL.jsp">GetPaymentURL</a> - 연동회원 포인트 결제내역 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getUseHistory.jsp">GetUseHistory</a> - 포인트 사용내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getUseHistoryURL.jsp">GetUseHistoryURL</a> - 연동회원 포인트 사용내역 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/refund.jsp">Refund</a> - 환불 신청</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getRefundHistory.jsp">GetRefundHistory</a> - 환불 신청내역 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getRefundInfo.jsp">getRefundInfo</a> - 환불 신청 상태 조회</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getRefundableBalance.jsp">GetRefundableBalance</a> - 환불 가능 포인트 조회</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/joinMember.jsp">JoinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/quitMember.jsp">QuitMember</a> - 연동회원 탈퇴</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/registContact.jsp">RegistContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/deleteContact.jsp">DeleteContact</a> - 담당자 삭제</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
