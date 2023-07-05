<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.PaymentHistoryResult"%>
<%@page import="com.popbill.api.PaymentHistory"%>

<%
    /*
     * 연동회원의 포인트 결제내역을 확인합니다.
     * - https://developers.popbill.com/reference/closedown/java/api/point#GetPaymentHistory
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20230102";

    // 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20230131";

    // 페이지번호
    int Page = 1;

    // 페이지당 검색개수, 최대 1000건
    int PerPage = 30;

    PaymentHistoryResult searchResult = new PaymentHistoryResult();

    try {
        searchResult = closedownService.getPaymentHistory(testCorpNum, SDate, EDate, Page, PerPage);

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
                <legend>포인트 결제내역 목록조회</legend>
                <ul>
                    <li>code (응답코드) : <%= searchResult.getCode()%></li>
                    <li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
                    <li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
                    <li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
                </ul>
                    <%
                        PaymentHistory paymentHistory = new PaymentHistory();

                        for ( int i = 0; i< searchResult.getList().size(); i++ ) {
                            paymentHistory = searchResult.getList().get(i);
                    %>

                        <fieldset class="fieldset2">
                            <legend>포인트 결제내역정보 [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
                                <ul>
                                    <li>productType (결제 내용) : <%= paymentHistory.getProductType()%></li>
                                    <li>productName (결제 상품명) : <%= paymentHistory.getProductName()%></li>
                                    <li>settleType (결제유형) : <%= paymentHistory.getSettleType()%></li>
                                    <li>settlerName (담당자명) : <%= paymentHistory.getSettlerName()%></li>
                                    <li>settlerEmail (담당자메일) : <%= paymentHistory.getSettlerEmail()%></li>
                                    <li>settleCost (결제금액) : <%= paymentHistory.getSettleCost()%></li>
                                    <li>settlePoint (충전포인트) : <%= paymentHistory.getSettlePoint()%></li>
                                    <li>settleState (결제상태) : <%= paymentHistory.getSettleState()%></li>
                                    <li>regDT (등록일시) : <%= paymentHistory.getRegDT()%></li>
                                    <li>stateDT (상태일시) : <%= paymentHistory.getStateDT()%></li>
                                </ul>
                        </fieldset>
                    <%
                        }
                    %>
            </fieldset>
        </div>
    </body>
</html>
