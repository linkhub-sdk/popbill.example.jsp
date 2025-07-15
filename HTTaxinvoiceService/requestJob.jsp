<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.QueryType" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 홈택스에 신고된 전자세금계산서 매입/매출 내역 수집을 팝빌에 요청합니다.
     * - 최대 3개월 단위로 수집 요청이 가능하며, 수집 기한의 제한은 없습니다.
     * - API를 호출하고 반환 받은 작업아이디(JobID)는 수집을 요청한 시점으로부터 1시간 동안만 유효합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/job#RequestJob
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 전자세금계산서 유형, SELL-매출, BUY-매입, TRUSTEE-수탁
    QueryType queryType = QueryType.SELL;

    // 조회할 일자 유형, W-작성일자, I-발행일자, S-전송일자
    String DType = "S";

    // 검색 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20250711";

    // 검색 종료일자, 닐짜형식(yyyyMMdd)
    String EDate = "20250731";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    String jobID = null;

    try {

        jobID = htTaxinvoiceService.requestJob(CorpNum, queryType, DType, SDate, EDate, UserID);

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
                    <li>jobID (작업아이디) : <%=jobID %> </li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
