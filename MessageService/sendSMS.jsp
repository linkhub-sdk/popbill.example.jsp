<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 최대 90byte의 단문(SMS) 메시지 1건 전송을 팝빌에 접수합니다.
     * 팝빌 서비스의 안정적인 제공을 위하여 동시호출이 제한될 수 있습니다.
     * 동시에 1,000건 이상 요청하는 경우 동보전송 또는 대량전송 API를 이용하시는 것을 권장합니다.
     * - https://developers.popbill.com/reference/sms/java/api/send#SendSMSOne
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String sender = "07043042991";

    // 발신자명
    String senderName = "발신자명";

    // 수신번호
    String receiver = "010111222";

    // 수신자명
    String receiverName = "수신자명";

    // 메시지 내용, 90byte 초과된 내용은 삭제되어 전송
    // └ 한글, 한자, 특수문자 2byte / 영문, 숫자, 공백 1byte
    String content = "문자메시지\r내용";

    // 전송 예약일시, null인 경우 즉시전송
    Date reserveDT = null;

    // 광고메시지 전송 여부 ( true , false 중 택 1)
    // └ true = 광고 , false = 일반
    Boolean adsYN = false;

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    String receiptNum = null;

    try {

        receiptNum = messageService.sendSMS(CorpNum, sender, senderName, receiver, receiverName, content, reserveDT, adsYN, UserID, requestNum);

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
                <ul>
                    <li>접수번호 : <%=receiptNum%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>