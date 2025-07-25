<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.SentMessage"%>

<%
    /*
     * 팝빌에서 반환받은 접수번호를 통해 문자 전송상태 및 결과를 확인합니다.
     * 문자 상태코드 [https://developers.popbill.com/reference/sms/java/response-code#state-code]
     * 통신사 결과코드 [https://developers.popbill.com/reference/sms/java/response-code#result-code]
     * - https://developers.popbill.com/reference/sms/java/api/info#GetMessages
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문자 전송요청 시 팝빌로부터 반환 받은 접수번호
    String receiptNum = "022100715000000005";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    SentMessage[] sentMessages = null;

    try {

        sentMessages = messageService.getMessages(CorpNum, receiptNum, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                <%
                    for(int i=0; i<sentMessages.length; i++){
                        SentMessage sentMsg = sentMessages[i];
                %>

                <fieldset class="fieldset2">
                    <ul>
                        <li>subject (메시지 제목) : <%=sentMsg.getSubject()%></li>
                        <li>content (메시지 내용) : <%=sentMsg.getContent()%></li>
                        <li>sendNum (발신번호) : <%=sentMsg.getSendNum()%></li>
                        <li>sendName (발신자명) : <%=sentMsg.getSenderName()%></li>
                        <li>receiveNum (수신번호) : <%=sentMsg.getReceiveNum()%></li>
                        <li>receiveName (수신자명) : <%=sentMsg.getReceiveName()%></li>
                        <li>receiptDT (접수일시) : <%=sentMsg.getReceiptDT()%></li>
                        <li>sendDT (전송일시) : <%=sentMsg.getSendDT()%></li>
                        <li>resultDT (전송결과 수신일시) : <%=sentMsg.getResultDT()%></li>
                        <li>reserveDT (예약일시) : <%=sentMsg.getReserveDT()%></li>
                        <li>state (상태코드) : <%=sentMsg.getState()%> </li>
                        <li>result (결과코드) : <%=sentMsg.getResult()%></li>
                        <li>messageType (메시지 타입) : <%=sentMsg.getMessageType()%></li>
                        <li>tranNet (전송처리 이동통신사명) : <%=sentMsg.getTranNet()%></li>
                        <li>receiptNum (접수번호) : <%=sentMsg.getReceiptNum()%></li>
                        <li>requestNum (요청번호) : <%=sentMsg.getRequestNum()%></li>
                        <li>interOPRefKey (파트너 지정키) : <%=sentMsg.getInterOPRefKey()%></li>
                    </ul>
                </fieldset>
                <%
                    }
                %>
        </div>
    </body>
</html>
