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
        <legend>플리스친구 계정관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getURL_PLUSFRIEND.jsp">GetURL</a> - 플러스친구 계정관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listPlusFriendID.jsp">ListPlusFriendID</a> - 플러스친구 목록 확인</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>발신번호 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getURL_SENDER.jsp">GetURL</a> - 발신번호 관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getSenderNumberList.jsp">GetSenderNumberList</a> - 발신번호 목록 확인</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>알림톡 템플릿 관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getURL_TEMPLATE.jsp">GetURL</a> - 알림톡 템플릿관리 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listATSTemplate.jsp">ListATSTemplate</a> - 알림톡 템플릿 목록 확인</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>알림톡 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_one.jsp">SendATS</a> - 알림톡 단건 전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_same.jsp">SendATS</a> - 알림톡 동일내용 대량 전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendATS_multi.jsp">SendATS</a> - 알림톡 개별내용 대량 전송</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>친구톡 텍스트 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_one.jsp">SendFTS</a> - 친구톡 텍스트 단건 전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_same.jsp">SendFTS</a> - 친구톡 텍스트 동일내용 대량전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFTS_multi.jsp">SendFTS</a> - 친구톡 텍스트 개별내용 대량전송</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>친구톡 이미지 전송</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_one.jsp">SendFMS</a> - 친구톡 이미지 단건 전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_same.jsp">SendFMS</a> - 친구톡 이미지 동일내용 대량전송</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/sendFMS_multi.jsp">SendFMS</a> - 친구톡 이미지 개별내용 대량전송</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>전송내역조회</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/search.jsp">Search</a> - 전송내역 목록 조회</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getURL_BOX.jsp">GetURL</a> - 카카오톡 전송내역 팝업 URL</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>접수번호 관련 기능 (요청번호 미할당)</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReserve.jsp">CancelReserve</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getMessages.jsp">GetMessages</a> - 알림톡/친구톡 전송내역 확인</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>요청번호 할당 전송건 관련 기능</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/cancelReserveRN.jsp">CancelReserveRN</a> - 예약전송 취소</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getMessagesRN.jsp">GetMessagesRN</a> - 알림톡/친구톡 전송내역 확인</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>포인트관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getUnitCost.jsp">GetUnitCost</a> - 전송단가 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getChargeInfo.jsp">GetChargeInfo</a> - 과금정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getBalance.jsp">GetBalance</a> - 연동회원 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPopbillURL_CHRG.jsp">GetPopbillURL</a> - 연동회원 포인트 충전 팝업 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPartnerBalance.jsp">GetPartnerBalance</a> - 파트너 잔여포인트 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPartnerURL.jsp">GetPartnerURL</a> - 파트너 포인트충전 URL</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>회원관리</legend>
        <ul>
            <li><a href="${pageContext.request.contextPath}/KakaoService/checkIsMember.jsp">CheckIsMember</a> - 연동회원 가입여부 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/checkID.jsp">CheckID</a> - 연동회원 아이디 중복 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/joinMember.jsp">JoinMember</a> - 연동회원사 신규가입</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getPopbillURL_LOGIN.jsp">GetPopbillURL</a> - 팝빌 로그인 URL</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/registContact.jsp">RegistContact</a> - 담당자 추가</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/listContact.jsp">ListContact</a> - 담당자 목록 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/updateContact.jsp">UpdateContact</a> - 담당자 정보 수정</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/getCorpInfo.jsp">GetCorpInfo</a> - 회사정보 확인</li>
            <li><a href="${pageContext.request.contextPath}/KakaoService/updateCorpInfo.jsp">UpdateCorpInfo</a> - 회사정보 수정</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
