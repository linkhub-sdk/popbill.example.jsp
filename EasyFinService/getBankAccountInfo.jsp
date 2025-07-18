<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.easyfin.EasyFinBankAccount" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 팝빌에 등록된 계좌 정보를 확인합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/manage#GetBankAccountInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 은행 기관코드
    String BankCode = "";

    // 계좌번호 하이픈('-') 제외
    String AccountNumber = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    EasyFinBankAccount bankAccountInfo = null;

    try {

        bankAccountInfo = easyFinBankService.getBankAccountInfo(CorpNum, BankCode, AccountNumber, UserID);

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
                <li>accountNumber (계좌번호) : <%=bankAccountInfo.getAccountNumber() %> </li>
                <li>bankCode (은행 기관코드) : <%=bankAccountInfo.getBankCode() %> </li>
                <li>accountName (계좌 별칭) : <%=bankAccountInfo.getAccountName() %> </li>
                <li>accountType (계좌 유형) : <%=bankAccountInfo.getAccountType() %> </li>
                <li>state (계좌 상태) : <%=bankAccountInfo.getState() %> </li>
                <li>regDT (팝빌에 계좌를 등록한 일시) : <%=bankAccountInfo.getRegDT() %> </li>
                <li>contractDT (정액제 서비스 시작일시) : <%=bankAccountInfo.getContractDT() %> </li>
                <li>useEndDate (정액제 서비스 만료일자) : <%=bankAccountInfo.getUseEndDate() %> </li>
                <li>baseDate (자동연장 결제일) : <%=bankAccountInfo.getBaseDate() %> </li>
                <li>contractState (정액제 서비스 상태) : <%=bankAccountInfo.getContractState() %> </li>
                <li>closeRequestYN (정액제 서비스 해지신청 여부) : <%=bankAccountInfo.getCloseRequestYN() %> </li>
                <li>useRestrictYN (정액제 서비스 사용제한 여부) : <%=bankAccountInfo.getUseRestrictYN() %> </li>
                <li>closeOnExpired (정액제 서비스 해지 구분) : <%=bankAccountInfo.getCloseOnExpired() %> </li>
                <li>unPaidYN (미수금 보유 여부) : <%=bankAccountInfo.getUnPaidYN() %> </li>
                <li>memo (메모) : <%=bankAccountInfo.getMemo() %> </li>
            </ul>
        </fieldset>
    </div>
    </body>
</html>
