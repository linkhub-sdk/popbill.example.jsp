<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.kakao.KakaoSentInfo" %>
<%@page import="com.popbill.api.kakao.KakaoButton" %>
<%@page import="com.popbill.api.kakao.KakaoSentDetail" %>
<%@page import="java.util.List" %>

<%
    /*
     * 카카오톡 전송요청시 발급받은 접수번호(receiptNum)로 전송결과를 확인합니다
     * - https://docs.popbill.com/kakao/java/api#GetMessages
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 카카오톡 전송 요청 시 발급받은 접수번호(receiptNum)
    String receiptNum = "020080717052100001";

    KakaoSentInfo kakaoSentInfo = null;

    try {

        kakaoSentInfo = kakaoService.getMessages(testCorpNum, receiptNum);

    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
<body>
<div id="content">
    <p class="heading1">Response</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>알림톡/친구톡 전송결과 조회</legend>
        <fieldset class="fieldset2">
            <legend>개별 전송내역</legend>
            <ul>
                <li>contentType (카카오톡 유형) : <%=kakaoSentInfo.getContentType()%></li>
                <li>templateCode (템플릿 코드) : <%=kakaoSentInfo.getTemplateCode()%></li>
                <li>plusFriendID (카카오톡 채널 아이디) : <%=kakaoSentInfo.getPlusFriendID()%></li>
                <li>sendNum (발신번호) : <%=kakaoSentInfo.getSendNum()%></li>
                <li>altContent (대체문자 내용) : <%=kakaoSentInfo.getAltContent()%></li>
                <li>altSendType (대체문자 유형) : <%=kakaoSentInfo.getAltSendType()%></li>
                <li>reserveDT (예약일시) : <%=kakaoSentInfo.getReserveDT()%></li>
                <li>adsYN (광고전송 여부) : <%=kakaoSentInfo.getAdsYN()%></li>
                <li>imageURL (친구톡 이미지 URL) : <%=kakaoSentInfo.getImageURL()%></li>
                <li>sendCnt (전송건수) : <%=kakaoSentInfo.getSendCnt()%></li>
                <li>successCnt (성공건수) : <%=kakaoSentInfo.getSuccessCnt()%></li>
                <li>failCnt (실패건수) : <%=kakaoSentInfo.getFailCnt()%></li>
                <li>altCnt (대체문자 건수) : <%=kakaoSentInfo.getAltCnt()%></li>
                <li>cancelCnt (취소건수) : <%=kakaoSentInfo.getCancelCnt()%></li>
            </ul>

            <% if (kakaoSentInfo.getBtns() != null) {
                List<KakaoButton> btns = kakaoSentInfo.getBtns();
                    for (int j = 0; j < btns.size(); j++) { %>
            <fieldset class="fieldset3">
                <legend>버튼 목록 [<%= j + 1 %>]</legend>
                <ul>
                    <li>n (버튼명) : <%=btns.get(j).getN()%></li>
                    <li>t (버튼유형) : <%=btns.get(j).getT()%></li>
                    <li>u1 (버튼링크1) : <%=btns.get(j).getU1()%></li>
                    <li>u2 (버튼링크2) : <%=btns.get(j).getU2()%></li>
                </ul>
            </fieldset>
            <%
                    }
                }
            %>

            <% if (kakaoSentInfo.getMsgs() != null) {
                List<KakaoSentDetail> msgs = kakaoSentInfo.getMsgs();
                    for (int j = 0; j < msgs.size(); j++) { %>
            <fieldset class="fieldset3">
                <legend>전송결과 정보 배열 [<%= j + 1 %>]</legend>
                <ul>
                    <li>state (전송 상태코드) : <%=msgs.get(j).getState()%></li>
                    <li>sendDT (전송일시) : <%=msgs.get(j).getSendDT()%></li>
                    <li>result (전송 결과코드) : <%=msgs.get(j).getResult()%></li>
                    <li>resultDT (전송결과 수신일시) : <%=msgs.get(j).getResultDT()%></li>
                    <li>contentType (카카오톡 유형) : <%=msgs.get(j).getContentType()%></li>
                    <li>receiveNum (수신번호) : <%=msgs.get(j).getReceiveNum()%></li>
                    <li>receiveName (수신자명) : <%=msgs.get(j).getReceiveName()%></li>
                    <li>content (알림톡/친구톡 내용) : <%=msgs.get(j).getContent()%></li>
                    <li>altContentType (대체문자 전송타입) : <%=msgs.get(j).getAltContentType()%></li>
                    <li>altSendDT (대체문자 전송일시) : <%=msgs.get(j).getAltSendDT()%></li>
                    <li>altResult (대체문자 전송결과 코드) : <%=msgs.get(j).getAltResult()%></li>
                    <li>altResultDT (대체문자 전송결과 수신일시) : <%=msgs.get(j).getAltResultDT()%></li>
                    <li>receiptNum (접수번호) : <%=msgs.get(j).getReceiptNum()%></li>
                    <li>requestNum (요청번호) : <%=msgs.get(j).getRequestNum()%></li>
                    <li>interOPRefKey (파트너 지정키) : <%=msgs.get(j).getInterOPRefKey()%></li>
                </ul>
            </fieldset>
            <%
                    }
                }
            %>
        </fieldset>
</div>
</body>
</html>
