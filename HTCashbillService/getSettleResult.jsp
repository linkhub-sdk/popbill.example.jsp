<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.PaymentHistory"%>

<%
    /*
     * 연동회원 포인트 무통장 입금신청내역 1건을 확인합니다.
     * - https://developers.popbill.com/reference/htcashbill/java/common-api/point#GetSettleResult
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // paymentRequest 를 통해 얻은 settleCode.
    String settleCode = "202210040000000070";

    PaymentHistory paymentHistory = null;

    try {

        paymentHistory = htCashbillService.getSettleResult(testCorpNum, settleCode);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }

%>
    <div id="content">
        <p class="heading1">Response</p>
        <br/>
        <fieldset class="fieldset1">
            <legend><%=request.getRequestURI()%></legend>
            <ul>
                <li>productType (결제 내용) : <%=paymentHistory.getProductType()%></li>
                <li>productName (결제 상품명) : <%=paymentHistory.getProductName()%></li>
                <li>settleType (결제유형) : <%=paymentHistory.getSettleType()%></li>
                <li>settlerName (담당자명) : <%=paymentHistory.getSettlerName()%></li>
                <li>settlerEmail (담당자메일) : <%=paymentHistory.getSettlerEmail()%></li>
                <li>settleCost (결제금액) : <%=paymentHistory.getSettleCost()%></li>
                <li>settlePoint (충전포인트) : <%=paymentHistory.getSettlePoint()%></li>
                <li>settleState (결제상태) : <%=paymentHistory.getSettleState()%></li>
                <li>regDT (등록일시) : <%=paymentHistory.getRegDT()%></li>
                <li>stateDT (상태일시) : <%=paymentHistory.getStateDT()%></li>
            </ul>
        </fieldset>
    </div>
</html>
