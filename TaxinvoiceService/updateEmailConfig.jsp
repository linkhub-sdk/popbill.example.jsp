<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 세금계산서 관련 메일 항목에 대한 발송설정을 수정합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/etc#UpdateEmailConfig
     *
     * 메일전송유형
     * [정발행]
     * - TAX_ISSUE : 공급받는자에게 전자세금계산서가 발행 되었음을 알려주는 메일입니다.
     * - TAX_ISSUE_INVOICER : 공급자에게 전자세금계산서가 발행 되었음을 알려주는 메일입니다.
     * - TAX_CHECK : 공급자에게 전자세금계산서가 수신확인 되었음을 알려주는 메일입니다.
     * - TAX_CANCEL_ISSUE : 공급받는자에게 전자세금계산서가 발행취소 되었음을 알려주는 메일입니다.
     *
     * [역발행]
     * - TAX_REQUEST : 공급자에게 세금계산서를 전자서명 하여 발행을 요청하는 메일입니다.
     * - TAX_CANCEL_REQUEST : 공급받는자에게 세금계산서가 취소 되었음을 알려주는 메일입니다.
     * - TAX_REFUSE : 공급받는자에게 세금계산서가 거부 되었음을 알려주는 메일입니다.
     *
     * [위수탁발행]
     * - TAX_TRUST_ISSUE : 공급받는자에게 전자세금계산서가 발행 되었음을 알려주는 메일입니다.
     * - TAX_TRUST_ISSUE_TRUSTEE : 수탁자에게 전자세금계산서가 발행 되었음을 알려주는 메일입니다.
     * - TAX_TRUST_ISSUE_INVOICER : 공급자에게 전자세금계산서가 발행 되었음을 알려주는 메일입니다.
     * - TAX_TRUST_CANCEL_ISSUE : 공급받는자에게 전자세금계산서가 발행취소 되었음을 알려주는 메일입니다.
     * - TAX_TRUST_CANCEL_ISSUE_INVOICER : 공급자에게 전자세금계산서가 발행취소 되었음을 알려주는 메일입니다.
     *
     * [처리결과]
     * - TAX_CLOSEDOWN : 거래처의 휴폐업 여부를 확인하여 안내하는 메일입니다.
     * - TAX_NTSFAIL_INVOICER : 전자세금계산서 국세청 전송실패를 안내하는 메일입니다.
     *
     * [정기발송]
     * - ETC_CERT_EXPIRATION : 팝빌에서 이용중인 공동인증서의 갱신을 안내하는 메일입니다.
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 메일 전송 유형
    String emailType = "TAX_ISSUE";

    // 전송 여부 (true = 전송, false = 미전송)
    Boolean sendYN = true;

    Response CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.updateEmailConfig(testCorpNum, emailType, sendYN);

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
                <legend>알림메일 전송설정 수정</legend>
                <ul>
                    <li>Response.code : <%=CheckResponse.getCode()%></li>
                    <li>Response.message : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
