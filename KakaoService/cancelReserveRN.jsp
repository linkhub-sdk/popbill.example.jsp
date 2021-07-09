<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@include file="common.jsp" %>
<%@page import="com.popbill.api.Response" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 파트너가 할당한 전송요청 번호를 통해 예약접수된 카카오톡을 전송 취소합니다. (예약시간 10분 전까지 가능)
     * - https://docs.popbill.com/kakao/java/api#CancelReserveRN
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 예약전송 요청시 할당한 전송요청번호
    String requestNum = "20190107-002";

    Response CheckResponse = null;

    try {

        CheckResponse = kakaoService.cancelReserveRN(testCorpNum, requestNum);

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
        <legend>예약 알림톡/친구톡 취소</legend>
        <ul>
            <li>Response.code : <%=CheckResponse.getCode()%></li>
            <li>Response.message : <%=CheckResponse.getMessage()%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
