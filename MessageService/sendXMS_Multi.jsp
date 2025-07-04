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
<%@page import="com.popbill.api.message.Message"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 메시지 길이(90byte)에 따라 단문/장문(SMS/LMS)을 자동으로 인식하여 다수건의 메시지 전송을 팝빌에 접수합니다. (최대 1,000건)
     * - https://developers.popbill.com/reference/sms/java/api/send#SendXMSAll
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // [동보전송시 필수] 발신번호, 개별 전송정보에 발신번호가 없는 경우 적용
    String sender = "07043042991";

    // [동보전송시 필수] 문자메시지 제목, 개별 전송정보에 메시지 제목이 없는 경우 적용
    String subject = "장문문자 제목";

    // [동보전송시 필수] 문자메시지 내용, 개별 전송정보에 메시지 내용이 없는 경우 적용
    String content = "문자메시지 내용";

    // 전송 정보 배열, 최대 1000건.
    Message[] messages = new Message[2];

    Message msg1 = new Message();
    msg1.setSender("07043042991");      // 발신번호
    msg1.setSenderName("발신자1");      // 발신자명
    msg1.setReceiver("010111222");      // 수신번호
    msg1.setReceiverName("수신자1");    // 수신자명
    msg1.setContent("메시지 내용1");    // 메시지내용
    msg1.setInterOPRefKey("20221007-XMS001");     // 파트너 지정키
    messages[0] = msg1;

    Message msg2 = new Message();
    msg2.setSender("07043042991");
    msg2.setSenderName("발신자2");
    msg2.setReceiver("010333444");
    msg2.setReceiverName("수신자2");
    msg2.setContent("메시지 내용2");
    msg2.setInterOPRefKey("20221007-XMS002");
    messages[1] = msg2;

    // 예약전송일시, null인 경우 즉시전송
    Date reserveDT = null;
    // 예약전송시 아래의 코드 참조
    // String reserveDTtxt = "20220228180000";
    // SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    // reserveDT = formatter.parse(reserveDTtxt);

    // 광고 메시지 여부 ( true , false 중 택 1)
    // └ true = 광고 , false = 일반
    Boolean adsYN = false;

    // 전송요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    String receiptNum = null;

    try {

        receiptNum = messageService.sendXMS(testCorpNum, sender, subject, content, messages,
                reserveDT, adsYN, testUserID, requestNum);

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
