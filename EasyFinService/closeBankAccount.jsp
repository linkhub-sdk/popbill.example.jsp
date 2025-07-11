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
     * 계좌의 정액제 해지를 요청합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/manage#CloseBankAccount
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 기관코드
    String BankCode = "";

    // 계좌번호 하이픈('-') 제외
    String AccountNumber = "";

    // 해지유형, “일반”, “중도” 중 택 1
    // 일반(일반해지) – 이용중인 정액제 기간 만료 후 해지
    // 중도(중도해지) – 해지 요청일 기준으로 정지되고 팝빌 담당자가 승인시 해지
    // └ 중도일 경우, 정액제 잔여기간은 일할로 계산되어 포인트 환불 (무료 이용기간 중 해지하면 전액 환불)
    String CloseType = "중도";

    Response saveResponse = null;

    try {

        saveResponse = easyFinBankService.closeBankAccount(testCorpNum, BankCode, AccountNumber, CloseType);

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
                        <li>응답 코드(code) : <%=saveResponse.getCode()%></li>
                        <li>응답메시지 (message) : <%=saveResponse.getMessage()%></li>
                    </ul>
            </fieldset>
        </div>
    </body>
</html>
