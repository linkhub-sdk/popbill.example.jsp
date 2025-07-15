<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.CorpInfo"%>

<%
    /*
     * 연동회원의 회사정보를 확인합니다.
     * - https://developers.popbill.com/reference/sms/java/common-api/member#QuitMember
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID =  "testkorea";

    CorpInfo corpInfo = null;

    try {

        corpInfo = messageService.getCorpInfo(CorpNum, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response </p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>ceoname (대표자 성명) : <%=corpInfo.getCeoname() %> </li>
                    <li>corpName (회사명) : <%=corpInfo.getCorpName() %> </li>
                    <li>addr (주소) : <%=corpInfo.getAddr() %> </li>
                    <li>bizType (업태) : <%=corpInfo.getBizType() %> </li>
                    <li>bizClass (종목) : <%=corpInfo.getBizClass() %> </li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
