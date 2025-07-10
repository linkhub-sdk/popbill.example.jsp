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
     * 전자명세서 관련 메일 항목에 대한 발송설정을 확인합니다.
     * - https://developers.popbill.com/reference/statement/java/api/etc#ListEmailConfig
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    EmailSendConfig[] emailSendConfigs = null;

    try {

        emailSendConfigs = statementService.listEmailConfig(testCorpNum, UserID);

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

                    if (emailSendConfig.getEmailType().equals("SMT_ISSUE")) {
            %>
                        <li>SMT_ISSUE (수신자에게 전자명세서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("SMT_ACCEPT")) {
            %>
                        <li>SMT_ACCEPT (발신자에게 전자명세서가 승인 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("SMT_DENY")) {
            %>
                    <li>SMT_DENY (발신자에게 전자명세서가 거부 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("SMT_CANCEL")) {
            %>
                        <li>SMT_CANCEL (수신자에게 전자명세서가 취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("SMT_CANCEL_ISSUE")) {
            %>
                        <li>SMT_CANCEL_ISSUE (수신자에게 전자명세서가 발행취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                    }
                }
            %>
            </ul>
            </fieldset>
        </div>
    </body>
</html>
