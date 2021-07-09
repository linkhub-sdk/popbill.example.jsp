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
     * - https://docs.popbill.com/taxinvoice/java/api#ListEmailConfig
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    EmailSendConfig[] emailSendConfigs = null;

    try {

        emailSendConfigs = taxinvoiceService.listEmailConfig(testCorpNum);

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
        <legend>알림메일 전송목록 조회</legend>
        <ul>
            <%
                EmailSendConfig emailSendConfig = null;
                for (int i = 0; i < emailSendConfigs.length; i++) {
                    emailSendConfig = emailSendConfigs[i];
                    if (emailSendConfig.getEmailType().equals("TAX_ISSUE")) {
            %>
            <li>[정발행] TAX_ISSUE (공급받는자에게 전자세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_ISSUE_INVOICER")) {
            %>
            <li>[정발행] TAX_ISSUE_INVOICER (공급자에게 전자세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CHECK")) {
            %>
            <li>[정발행] TAX_CHECK (공급자에게 전자세금계산서 수신확인 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CANCEL_ISSUE")) {
            %>
            <li>[정발행] TAX_CANCEL_ISSUE (공급받는자에게 전자세금계산서 발행취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_SEND")) {
            %>
            <li>[발행예정] TAX_SEND (공급받는자에게 [발행예정] 세금계산서 발송 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_ACCEPT")) {
            %>
            <li>[발행예정] TAX_ACCEPT (공급자에게 [발행예정] 세금계산서 승인 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_ACCEPT_ISSUE")) {
            %>
            <li>[발행예정] TAX_ACCEPT_ISSUE (공급자에게 [발행예정] 세금계산서 자동발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_DENY")) {
            %>
            <li>[발행예정] TAX_DENY (공급자에게 [발행예정] 세금계산서 거부 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CANCEL_SEND")) {
            %>
            <li>[발행예정] TAX_CANCEL_SEND (공급받는자에게 [발행예정] 세금계산서 취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_REQUEST")) {
            %>
            <li>[역발행] TAX_REQUEST (공급자에게 세금계산서를 발행요청 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CANCEL_REQUEST")) {
            %>
            <li>[역발행] TAX_CANCEL_REQUEST (공급받는자에게 세금계산서 취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_REFUSE")) {
            %>
            <li>[역발행] TAX_REFUSE (공급받는자에게 세금계산서 거부 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ISSUE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE (공급받는자에게 전자세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ISSUE_TRUSTEE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE_TRUSTEE (수탁자에게 전자세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ISSUE_INVOICER")) {
            %>
            <li>[위수탁발행] TAX_TRUST_ISSUE_INVOICER (공급자에게 전자세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_CANCEL_ISSUE")) {
            %>
            <li>[위수탁발행] TAX_TRUST_CANCEL_ISSUE (공급받는자에게 전자세금계산서 발행취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_CANCEL_ISSUE_INVOICER")) {
            %>
            <li>[위수탁발행] TAX_TRUST_CALCEL_ISSUE_INVOICER (공급자에게 전자세금계산서 발행취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_SEND")) {
            %>
            <li>[위수탁 발행예정] TAX_TRUST_SEND (공급받는자에게 [발행예정] 세금계산서 발송 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ACCEPT")) {
            %>
            <li>[위수탁 발행예정] TAX_TRUST_ACCEPT (수탁자에게 [발행예정] 세금계산서 승인 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_ACCEPT_ISSUE")) {
            %>
            <li>[위수탁 발행예정] TAX_TRUST_ACCEPT_ISSUE (수탁자에게 [발행예정] 세금계산서 자동발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_DENY")) {
            %>
            <li>[위수탁 발행예정] TAX_TRUST_DENY (수탁자에게 [발행예정] 세금계산서 거부 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_TRUST_CANCEL_SEND")) {
            %>
            <li>[위수탁 발행예정] TAX_TRUST_CANCEL_SEND (공급받는자에게 [발행예정] 세금계산서 취소 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_CLOSEDOWN")) {
            %>
            <li>[처리결과] TAX_CLOSEDOWN (거래처의 휴폐업 여부 확인 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_NTSFAIL_INVOICER")) {
            %>
            <li>[처리결과] TAX_NTSFAIL_INVOICER (전자세금계산서 국세청 전송실패 안내 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("TAX_SEND_INFO")) {
            %>
            <li>[정기발송] TAX_SEND_INFO (전월 귀속분 [매출 발행 대기] 세금계산서 발행 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
            <%
                }
                if (emailSendConfig.getEmailType().equals("ETC_CERT_EXPIRATION")) {
            %>
            <li>[정기발송] ETC_CERT_EXPIRATION (팝빌에서 이용중인 공인인증서의 갱신 메일 전송 여부) : <%= emailSendConfig.getSendYN()%></li>
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
