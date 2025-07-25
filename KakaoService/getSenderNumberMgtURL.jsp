<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 대체문자 전송 발신번호를 등록하는 팝업 URL을 반환합니다.
     * - 권장 사이즈 : width = 1,200px (최소 1,000px) / height = 800px
     * - 반환되는 URL은 30초 동안만 사용이 가능합니다.
     * - 반환되는 URL에서만 유효한 세션을 포함하고 있습니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/sendnum#GetSenderNumberMgtURL
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    String url = null;

    try {

        url = kakaoService.getSenderNumberMgtURL(CorpNum, UserID);

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
            <li>URL : <%=url%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>
