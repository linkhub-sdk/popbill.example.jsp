<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 팩스를 전송합니다. (전송할 파일 개수는 최대 20개까지 가능)
     * - 팩스전송 문서 파일포맷 안내 : https://docs.popbill.com/fax/format?lang=java
     * - https://docs.popbill.com/fax/java/api#SendFAX
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 발신번호
    String sendNum = "07043042991";

    // 발신자명
    String senderName = "발신자명";

    // 수신자명
    String receiveName = "수신자명";

    // 수신 팩스번호
    String receiveNum = "070111222";

    // 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전송
    Date reserveDT = null;
    // String reserveDTtxt = "20180726120000";
    // SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    // reserveDT = formatter.parse(reserveDTtxt);

    // 팩스전송파일 경로
    // 파일 전송 개수 최대 20개
    File[] files = new File[2];
    files[0] = new File((application.getRealPath("/resources/test.jpg")));
    files[1] = new File((application.getRealPath("/resources/test.jpg")));

    // 광고팩스 전송여부
    Boolean adsYN = false;

    // 팩스제목
    String title = "팩스제목";

    // 전송요청번호
    // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    String receiptNum = null;

    try {

        receiptNum = faxService.sendFAX(testCorpNum, sendNum, receiveNum, receiveName,
                files, reserveDT, testUserID, adsYN, title, requestNum);

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
        <legend>팩스전송 요청</legend>
        <ul>
            <li>receiptNum (팩스전송 접수번호) : <%=receiptNum%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>
