<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.UseHistoryResult"%>
<%@page import="com.popbill.api.UseHistory"%>

<%
    /*
     * 포인트 사용내역을 확인합니다.
     * - https://docs.popbill.com/htcashbill/java/api#GetUseHistory
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20220901";

    // 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20220930";

    // 페이지번호
    int Page = 1;

    // 페이지당 검색개수, 최대 1000건
    int PerPage = 30;

    // 정렬방향, A-오름차순, D-내림차순
    String Order = "D";

    UseHistoryResult searchResult = new UseHistoryResult();

    try {
        searchResult = htCashbillService.getUseHistory(testCorpNum, SDate, EDate, Page, PerPage, Order);

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
                <legend>포인트사용내역 목록조회</legend>
                <ul>
                    <li>code (응답코드) : <%= searchResult.getCode()%></li>
                    <li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
                    <li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
                    <li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
                </ul>
                    <%
                        UseHistory useHistory = new UseHistory();

                        for ( int i = 0; i< searchResult.getList().size(); i++ ) {
                            useHistory = searchResult.getList().get(i);
                    %>

                        <fieldset class="fieldset2">
                            <legend>포인트 사용내역정보 [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
                                <ul>
                                    <li>itemCode (서비스 코드) : <%= useHistory.getItemCode()%></li>
                                    <li>txType (포인트 증감 유형) : <%= useHistory.getTxType()%></li>
                                    <li>balance (증감 포인트) : <%= useHistory.getBalance()%></li>
                                    <li>txDT (포인트 증감 일시) : <%= useHistory.getTxDT()%></li>
                                    <li>userID (담당자 아이디) : <%= useHistory.getUserID()%></li>
                                    <li>userName (담당자명) : <%= useHistory.getUserName()%></li>
                                </ul>
                        </fieldset>
                    <%
                        }
                    %>
            </fieldset>
        </div>
    </body>
</html>
