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
            <li><a href="${pageContext.request.contextPath}/StatementService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 문서번호 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/registIssue.jsp">registIssue</a> - 즉시 발행</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/register.jsp">register</a> - 임시저장</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/update.jsp">update</a> - 수정</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/issue.jsp">issue</a> - 발행</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/cancel.jsp">cancel</a> - 발행취소</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/delete.jsp">delete</a> - 삭제</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>전자명세서 정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getInfo.jsp">getInfo</a> - 상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getInfos.jsp">getInfos</a> - 상태 대량 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getDetailInfo.jsp">getDetailInfo</a> - 상세정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/search.jsp">search</a> - 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getLogs.jsp">getLogs</a> - 상태 변경이력 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getURL.jsp">getURL</a> - 전자명세서 문서함 관련 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>전자명세서 보기/인쇄</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPopUpURL.jsp">getPopUpURL</a> - 전자명세서 보기 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getViewURL.jsp">getViewURL</a> - 전자명세서 보기 URL(메뉴/버튼 제외)</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPrintURL.jsp">getPrintURL</a> - 전자명세서 인쇄 [공급자] URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getEPrintURL.jsp">getEPrintURL</a> - 전자명세서 인쇄 [공급받는자용] URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getMassPrintURL.jsp">getMassPrintURL</a> - 전자명세서 대량 인쇄 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getMailURL.jsp">getMailURL</a> - 전자명세서 메일링크 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>부가기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getSealURL.jsp">getSealURL</a> - 인감 및 첨부문서 등록 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/attachFile.jsp">attachFile</a> - 첨부파일 추가</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/deleteFile.jsp">deleteFile</a> - 첨부파일 삭제</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getFiles.jsp">getFiles</a> - 첨부파일 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendEmail.jsp">sendEmail</a> - 메일 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendSMS.jsp">sendSMS</a> - 문자 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/sendFAX.jsp">sendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/FAXSend.jsp">FAXSend</a> - 선팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/attachStatement.jsp">attachStatement</a> - 전자명세서 첨부</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/detachStatement.jsp">detachStatement</a> - 전자명세서 첨부해제</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/listEmailConfig.jsp">listEmailConfig</a> - 전자명세서 알림메일 전송목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateEmailConfig.jsp">updateEmailConfig</a> - 전자명세서 알림메일 전송설정 수정</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPaymentURL.jsp">getPaymentURL</a> - 연동회원 포인트 결제내역 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getUseHistoryURL.jsp">getUseHistoryURL</a> - 연동회원 포인트 사용내역 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getUnitCost.jsp">getUnitCost</a> - 발행 단가 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/StatementService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/checkID.jsp">checkID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/getContactInfo.jsp">GetContactInfo</a> - 담당자 정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/StatementService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
