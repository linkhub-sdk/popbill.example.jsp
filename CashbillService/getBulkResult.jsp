<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.List" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.BulkCashbillResult"%>
<%@page import="com.popbill.api.cashbill.BulkCashbillIssueResult" %>

<%
    /*
     * 접수시 기재한 SubmitID를 사용하여 현금영수증 접수결과를 확인합니다.
     * - 개별 현금영수증 처리상태는 접수상태(txState)가 완료(2) 시 반환됩니다.
     * - https://developers.popbill.com/reference/cashbill/java/api/issue#GetBulkResult
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    //대량 발행 접수시 기재한 제출아이디
    String SubmitID = "20230102-JSP-BULK";

    BulkCashbillResult bulkResult = null;

    try {

        bulkResult = cashbillService.getBulkResult(testCorpNum, SubmitID);

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
                    <li>code (응답코드) : <%= bulkResult.getCode() %></li>
                    <li>message (응답 메시지) : <%= bulkResult.getMessage() %></li>
                    <li>submitID (제출아이디) : <%= bulkResult.getSubmitID() %></li>
                    <li>submitCount (접수건수) : <%= bulkResult.getSuccessCount() %></li>
                    <li>successCount (발행 성공건수) : <%= bulkResult.getSuccessCount() %></li>
                    <li>failCount (발행 실패건수) : <%= bulkResult.getFailCount() %></li>
                    <li>txState (접수 상태코드) : <%= bulkResult.getTxState() %></li>
                    <li>txResultCode (접수 결과코드) : <%= bulkResult.getTxResultCode() %></li>
                    <li>txStartDT (발행처리 시작일시) : <%= bulkResult.getTxStartDT() %></li>
                    <li>txEndDT (발행처리 완료일시) : <%= bulkResult.getTxEndDT() %></li>
                    <li>receiptID (접수아이디) : <%= bulkResult.getReceiptID() %></li>
                    <li>receiptDT (접수일시) : <%= bulkResult.getReceiptDT() %></li>
                </ul>
            </fieldset>

            <% if (bulkResult.getIssueResult() != null) {
                List<BulkCashbillIssueResult> issueResult = bulkResult.getIssueResult();
                    for (int i = 0; i < issueResult.size(); i++) { %>
            <fieldset class="fieldset2">
                <legend>발행결과 [<%= i + 1 %>]</legend>
                <ul>
                    <li>code (응답코드) : <%= issueResult.get(i).getCode() %></li>
                    <li>message (응답메시지) : <%= issueResult.get(i).getMessage() %></li>
                    <li>mgtKey (문서번호) : <%= issueResult.get(i).getMgtKey() %></li>
                    <li>confirmNum (국세청 승인번호) : <%= issueResult.get(i).getConfirmNum() %></li>
                    <li>tradeDate (거래일자) : <%= issueResult.get(i).getTradeDate() %></li>
                    <li>issueDT (발행일시) : <%= issueResult.get(i).getIssueDT() %></li>
                </ul>
            </fieldset>
            <% }
            }
            %>
        </div>
    </body>
</html>
