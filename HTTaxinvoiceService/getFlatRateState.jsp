<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.FlatRateState"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 홈택스수집 정액제 서비스 상태를 확인합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/common-api/point#GetFlatRateState
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    FlatRateState flatRateInfo = null;

    try {

        flatRateInfo = htTaxinvoiceService.getFlatRateState(CorpNum, UserID);

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
                  <li>referenceID (사업자번호) : <%=flatRateInfo.getReferenceID()%> </li>
                  <li>contractDT (정액제 서비스 시작일시) : <%=flatRateInfo.getContractDT()%> </li>
                  <li>useEndDate (정액제 서비스 만료일자) : <%=flatRateInfo.getUseEndDate()%> </li>
                  <li>baseDate (자동연장 결제일) : <%=flatRateInfo.getBaseDate()%> </li>
                  <li>state (정액제 서비스 상태) : <%=flatRateInfo.getState()%> </li>
                  <li>closeRequestYN (정액제 서비스 해제신청 여부) : <%=flatRateInfo.getCloseRequestYN()%> </li>
                  <li>useRestrictYN (정액제 서비스 사용제한 여부) : <%=flatRateInfo.getUseRestrictYN()%> </li>
                  <li>closeOnExpired (정액제 서비스 해지 구분) : <%=flatRateInfo.getCloseOnExpired()%> </li>
                  <li>unPaidYN (미수금 보유 여부) : <%=flatRateInfo.getUnPaidYN()%> </li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
