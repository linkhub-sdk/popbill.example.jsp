<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.EmailSendConfig"%>

<%
    /*
     * 현금영수증 관련 메일 항목에 대한 발송설정을 확인합니다.
     * - https://developers.popbill.com/reference/cashbill/java/api/etc#ListEmailConfig
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    EmailSendConfig[] emailSendConfigs = null;

    try {

        emailSendConfigs = cashbillService.listEmailConfig(CorpNum, UserID);

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
                    <%
                        EmailSendConfig emailSendConfig = null;
                        for ( int i = 0; i < emailSendConfigs.length; i++ ) {
                            emailSendConfig = emailSendConfigs[i];

                            if (emailSendConfig.getEmailType().equals("CSH_ISSUE")) {
                    %>
                    <li>CSH_ISSUE (전송 여부) : <%= emailSendConfig.getSendYN()%></li>
                    <%
                            }
                        }
                    %>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
