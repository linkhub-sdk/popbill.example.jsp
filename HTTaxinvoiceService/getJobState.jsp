<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTTaxinvoiceJobState" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * [RequestJob - 수집 요청] API를 호출하고 반환 받은 작업아이디(JobID)를 이용하여 수집 상태를 확인합니다.
     * - 수집상태(jobState) = 3(완료) 이면서, 수집 결과코드(errorCode) = 1(수집성공)인 경우 [Search - 수집 내역 확인] 이 가능합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/job#GetJobState
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 수집 요청(RequestJob API) 호출시 반환받은 작업아이디
    String jobID = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    HTTaxinvoiceJobState jobState = null;

    try {

        jobState = htTaxinvoiceService.getJobState(CorpNum, jobID, UserID);

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
                    <li>jobID (작업아이디) : <%=jobState.getJobID() %> </li>
                    <li>jobState (수집상태) : <%=jobState.getJobState() %> </li>
                    <li>queryType (수집유형) : <%=jobState.getQueryType() %> </li>
                    <li>queryDateType (일자유형) : <%=jobState.getQueryDateType() %> </li>
                    <li>queryStDate (시작일자) : <%=jobState.getQueryStDate() %> </li>
                    <li>queryEnDate (종료일자) : <%=jobState.getQueryEnDate() %> </li>
                    <li>errorCode (수집 결과코드) : <%=jobState.getErrorCode() %> </li>
                    <li>errorReason (오류메시지) : <%=jobState.getErrorReason() %> </li>
                    <li>jobStartDT (작업 시작일시) : <%=jobState.getJobStartDT() %> </li>
                    <li>jobEndDT (작업 종료일시) : <%=jobState.getJobEndDT() %> </li>
                    <li>collectCount (수집개수) : <%=jobState.getCollectCount() %> </li>
                    <li>regDT (수집 요청일시) : <%=jobState.getRegDT() %> </li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>