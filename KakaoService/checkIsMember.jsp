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
    /**
     * 해당 사업자의 파트너 연동회원 가입여부를 확인합니다.
     * - LinkID는 인증정보로 설정되어 있는 링크아이디 값입니다.
     */

    // 사업자번호
    String testCorpNum = "1234567890";

    // 링크아이디
    String linkID = "TESTER";

    Response CheckResponse = null;

    try {

        CheckResponse = kakaoService.checkIsMember(testCorpNum, linkID);

    } catch (PopbillException e) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw e;
    }
%>
<body>
<div id="content">
    <p class="heading1">Response</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>연동회원 가입여부 확인</legend>
        <ul>
            <li>Response.code : <%=CheckResponse.getCode()%></li>
            <li>Response.message : <%=CheckResponse.getMessage()%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
