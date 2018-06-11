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
    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 발신번호
    String sendNum = "07043042991";

    // 발신자명
    String senderName = "발신자명";

    // 수신자명
    String receiveName = "수신자 명칭";

    // 수신 팩스번호
    String receiveNum = "070111222";

    // 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전송
    //	String reserveDTtxt = "20141230180000";
    //	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    //	reserveDT = formatter.parse(reserveDTtxt);
    Date reserveDT = null;

    // 팩스전송파일 경로
    // 파일 전송 개수 최대 20개
    File[] files = new File[2];
    File file = new File((application.getRealPath("/resources/test.jpg")));
    for(int i=0; i<2; i++){
        files[i] = file;
    }


    // 광고팩스 전송여부
    Boolean adsYN = false;

    // 팩스제목
    String title = "팩스제목";

    String receiptNum = null;

    try {

        receiptNum = faxService.sendFAX(testCorpNum, sendNum, receiveNum, receiveName,
                files, reserveDT, testUserID, adsYN, title);

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
