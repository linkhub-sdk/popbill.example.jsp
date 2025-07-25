<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.EmailSendConfig" %>

<%
    /*
     * 세금계산서 관련 메일 항목에 대한 발송설정을 확인합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/etc#ListEmailConfig
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    EmailSendConfig[] emailSendConfigs = null;

    try {

        emailSendConfigs = taxinvoiceService.listEmailConfig(CorpNum, UserID);

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
            <%
                EmailSendConfig emailSendConfig = null;
                for (int i = 0; i < emailSendConfigs.length; i++) {
                    emailSendConfig = emailSendConfigs[i];
                    if (emailSendConfig.getEmailType().equals("TAX_ISSUE")) {
            %>
            <li>[정발행] TAX_ISSUE (공급받는자에게 세금계산서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_ISSUE_INVOICER")) {
            %>
            <li>[정발행] TAX_ISSUE_INVOICER (공급자에게 세금계산서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CHECK")) {
            %>
            <li>[정발행] TAX_CHECK (공급자에게 세금계산서가 수신확인 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CANCEL_ISSUE")) {
            %>
            <li>[정발행] TAX_CANCEL_ISSUE (공급받는자에게 세금계산서가 발행취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_REQUEST")) {
            %>
            <li>[역발행] TAX_REQUEST (공급자에게 세금계산서를 전자서명 하여 발행을 요청하는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CANCEL_REQUEST")) {
            %>
            <li>[역발행] TAX_CANCEL_REQUEST (공급받는자에게 세금계산서가 취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_REFUSE")) {
            %>
            <li>[역발행] TAX_REFUSE (공급받는자에게 세금계산서가 거부 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_REVERSE_ISSUE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE (공급받는자에게 세금계산서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ISSUE_TRUSTEE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE_TRUSTEE (수탁자에게 세금계산서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ISSUE_INVOICER")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE_INVOICER (공급자에게 세금계산서가 발행 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_CANCEL_ISSUE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_CANCEL_ISSUE (공급받는자에게 세금계산서가 발행취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_CANCEL_ISSUE_INVOICER")) {
            %>
            <li>[위수탁발행] TAX_TRUST_CANCEL_ISSUE_INVOICER (공급자에게 세금계산서가 발행취소 되었음을 알려주는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CLOSEDOWN")) {
            %>
            <li>[처리결과] TAX_CLOSEDOWN (거래처의 휴폐업 여부를 확인하여 안내하는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_NTSFAIL_INVOICER")) {
            %>
            <li>[처리결과] TAX_NTSFAIL_INVOICER (세금계산서 국세청 전송실패를 안내하는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("ETC_CERT_EXPIRATION")) {
            %>
            <li>[정기발송] ETC_CERT_EXPIRATION (팝빌에 등록된 인증서의 만료예정을 안내하는 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                    }
                }
            %>
        </ul>
    </fieldset>
    <ul>
</div>
</body>
</html>
