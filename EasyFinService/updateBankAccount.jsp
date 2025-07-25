<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@ page import="com.popbill.api.easyfin.UpdateEasyFinBankAccountForm" %>

<%
    /*
     * 팝빌에 등록된 계좌정보를 수정합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/manage#UpdateBankAccount
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 은행 기관코드
    String BankCode = "";

    // 계좌번호 하이픈('-') 제외
    String AccountNumber = "";

    // 수정할 계좌 정보
    UpdateEasyFinBankAccountForm BankAccountInfo = new UpdateEasyFinBankAccountForm();

    // 계좌 비밀번호
    BankAccountInfo.setAccountPWD("");

    // 계좌 별칭
    BankAccountInfo.setAccountName("");

    // 인터넷뱅킹 아이디 (국민은행 필수)
    BankAccountInfo.setBankID("");

    // 조회전용 계정 아이디 (아이엠뱅크, 신한은행, 신협중앙회 필수)
    BankAccountInfo.setFastID("");

    // 조회전용 계정 비밀번호 (아이엠뱅크, 신한은행, 신협중앙회 필수)
    BankAccountInfo.setFastPWD("");

    // 메모
    BankAccountInfo.setMemo("");

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = easyFinBankService.updateBankAccount(CorpNum, BankCode, AccountNumber, BankAccountInfo,
                UserID);

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
            <li>code (응답코드) : <%=CheckResponse.getCode()%>
            </li>
            <li>message (응답메시지) : <%=CheckResponse.getMessage()%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>