<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 최대 2,000byte의 메시지와 이미지로 구성된 포토문자(MMS) 1건 전송을 팝빌에 접수합니다.
     * - 이미지 파일의 크기는 최대 300Kbtye (JPEG), 가로/세로 1000px 이하 권장
     * - https://developers.popbill.com/reference/sms/java/api/send#SendMMSOne
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 발신번호
    String sender = "07043042991";

    // 발신자명
    String senderName = "발신자명";

    // 수신번호
    String receiver = "010111222";

    // 수신자명
    String receiverName = "수신자명";

    // 메시지 제목
    String subject = "멀티 문자메시지 제목";

    // 메시지 내용
    // └ 한글, 한자, 특수문자 2byte / 영문, 숫자, 공백 1byte
    String content = "멀티 문자메시지 내용";

    // 전송할 이미지 파일 경로
    File file = new File((application.getRealPath("/resources/test.jpg")));

    // 전송예약시간, null인 경우 즉시전송
    Date reserveDT = null;
    // 예약전송시 아래의 코드 참조
    // String reserveDTtxt ="20220228180000";
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

        receiptNum = messageService.sendMMS(testCorpNum, sender, senderName, receiver, receiverName,
                subject, content, file, reserveDT, adsYN, testUserID, requestNum);

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