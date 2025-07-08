<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.RefundHistoryResult"%>
<%@page import="com.popbill.api.RefundHistory"%>

<%
    /*
     * 연동회원의 포인트 환불신청내역을 확인합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/common-api/point#GetRefundHistory
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 페이지번호
    int Page = 1;

    // 페이지당 검색개수, 최대 1000건
    int PerPage = 30;

    RefundHistoryResult searchResult = new RefundHistoryResult();

    try {
        searchResult = easyFinBankService.getRefundHistory(testCorpNum, Page, PerPage);

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
                    <li>code (응답코드) : <%= searchResult.getCode()%></li>
                    <li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
                    <li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
                    <li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
                </ul>
                    <%
                        RefundHistory refundHistory = new RefundHistory();

                        for ( int i = 0; i< searchResult.getList().size(); i++ ) {
                            refundHistory = searchResult.getList().get(i);
                    %>

                        <fieldset class="fieldset2">
                            <legend>환불신청 내역정보 [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
                                <ul>
                                    <li>reqDT (신청일자) : <%= refundHistory.getReqDT()%></li>
                                    <li>requestPoint (환불 신청포인트) : <%= refundHistory.getRequestPoint()%></li>
                                    <li>accountBank (환불계좌 은행명) : <%= refundHistory.getAccountBank()%></li>
                                    <li>accountNum (환불계좌번호) : <%= refundHistory.getAccountNum()%></li>
                                    <li>accountName (환불계좌 예금주명) : <%= refundHistory.getAccountName()%></li>
                                    <li>state (상태) : <%= refundHistory.getState()%></li>
                                    <li>reason (환불사유) : <%= refundHistory.getReason()%></li>
                                </ul>
                        </fieldset>
                    <%
                        }
                    %>
            </fieldset>
        </div>
    </body>
</html>
