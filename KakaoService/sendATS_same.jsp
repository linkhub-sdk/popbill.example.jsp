<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.popbill.api.kakao.KakaoReceiver" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /**
     * 동일한 내용의 알림톡을 대량 전송합니다.
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 알림톡 템플릿코드
    // 승인된 알림톡 템플릿 코드는 ListATStemplate API, GetURL(TEMPLATE) API, 또는 팝빌사이트에서 확인 가능합니다.
    String templateCode = "018020000001";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042993";

    // 알림톡 내용 (최대 1000자)
    String content = "[테스트] 테스트 템플릿입니다.";

    // 대체문자 내용 (최대 2000byte)
    String altContent = "대체문자 내용";

    // 대체문자 유형 [공백-미전송, C-알림톡내용, A-대체문자내용]
    String altSendType = "C";

    // 1회 최대 전송 1,000건 전송 가능
    KakaoReceiver[] receivers = new KakaoReceiver[10];

    for (int i = 0; i < 10; i++) {
        KakaoReceiver message = new KakaoReceiver();
        message.setReceiverNum("010111222" + i);
        message.setReceiverName("수신자명" + i);
        receivers[i] = message;
    }

    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendATS(testCorpNum, templateCode, senderNum, content, altContent, altSendType,
                receivers, sndDT);

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
        <legend>알림톡 전송</legend>
        <ul>
            <li>접수번호 : <%=receiptNum%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>