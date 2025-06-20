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
     * 팝빌에 등록된 계좌정보 목록을 반환합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/manage#ListBankAccount
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    EasyFinBankAccount[] bankList = null;

    try {

        bankList = easyFinBankService.listBankAccount(testCorpNum);

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
            <%
                if ( bankList != null ){
                    for ( int i = 0; i < bankList.length; i++ ) {
            %>
            <fieldset class="fieldset2">
                <ul>
                    <li>bankCode (기관코드) : <%=bankList[i].getBankCode() %> </li>
                    <li>accountNumber (계좌번호) : <%=bankList[i].getAccountNumber() %> </li>
                    <li>accountName (계좌 별칭) : <%=bankList[i].getAccountName() %> </li>
                    <li>accountType (계좌 유형) : <%=bankList[i].getAccountType() %> </li>
                    <li>state (계좌 정액제 상태) : <%=bankList[i].getState() %> </li>
                    <li>regDT (등록일시) : <%=bankList[i].getRegDT() %> </li>
                    <li>memo (메모) : <%=bankList[i].getMemo() %> </li>
                    <li>contractDT (정액제 서비스 시작일시) : <%=bankList[i].getContractDT() %> </li>
                    <li>useEndDate (정액제 서비스 종료일) : <%=bankList[i].getUseEndDate() %> </li>
                    <li>baseDate (자동연장 결제일) : <%=bankList[i].getBaseDate() %> </li>
                    <li>contractState (정액제 서비스 상태) : <%=bankList[i].getContractState() %> </li>
                    <li>closeRequestYN (정액제 서비스 해지신청 여부) : <%=bankList[i].getCloseRequestYN() %> </li>
                    <li>useRestrictYN (정액제 서비스 사용제한 여부) : <%=bankList[i].getUseRestrictYN() %> </li>
                    <li>closeOnExpired (정액제 서비스 만료 시 해지 여부) : <%=bankList[i].getCloseOnExpired() %> </li>
                    <li>unPaidYN (미수금 보유 여부) : <%=bankList[i].getUnPaidYN() %> </li>
                </ul>
            </fieldset>
            <%  }
            }
            %>
        </fieldset>
    </div>
    </body>
</html>
