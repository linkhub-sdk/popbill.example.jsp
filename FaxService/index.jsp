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
        <legend>발신번호 사전등록</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSenderNumberMgtURL.jsp">getSenderNumberMgtURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSenderNumberList.jsp">getSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>팩스 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAX.jsp">sendFAX</a> - 팩스 전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/sendFAX_Multi.jsp">sendFAX</a> - 팩스 동보전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAX.jsp">resendFAX</a> - 팩스 재전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAXRN.jsp">resendFAX</a> - 팩스 재전송 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAX_Multi.jsp">resendFAX</a> - 팩스 동보재전송</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/resendFAXRN_Multi.jsp">resendFAX</a> - 팩스 동보재전송 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/cancelReserve.jsp">cancelReserve</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/cancelReserveRN.jsp">cancelReserveRN</a> - 예약전송 취소 (요청번호 할당)</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>정보확인</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/getFaxResult.jsp">getFaxResult</a> - 전송내역 및 전송상태 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getFaxResultRN.jsp">getFaxResultRN</a> - 전송내역 및 전송상태 확인 (요청번호 할당)</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/search.jsp">search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getSentListURL.jsp">getSentListURL</a> - 팩스 전송내역 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPreviewURL.jsp">getPreviewURL</a> - 팩스 미리보기 팝업 URL</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>포인트 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/getBalance.jsp">getBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getChargeURL.jsp">getChargeURL</a> - 연동회원 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getPartnerURL.jsp">getPartnerURL</a> - 파트너 포인트충전 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getUnitCost.jsp">getUnitCost</a> - 전송 단가 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getChargeInfo.jsp">getChargeInfo</a> - 과금정보 확인</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>회원정보</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/FaxService/checkIsMember.jsp">checkIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/checkID.jsp">checkID</a> - 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/joinMember.jsp">joinMember</a> - 연동회원 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getAccessURL.jsp">getAccessURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/registContact.jsp">registContact</a> - 담당자 등록</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/FaxService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
        </ul>
    </fieldset>
 </div>
</body>
</html>
