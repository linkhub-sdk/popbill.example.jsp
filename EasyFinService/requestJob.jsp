<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
    * 계좌 거래내역을 확인하기 위해 팝빌에 수집요청을 합니다. (조회기간 단위 : 최대 1개월)
    * - 조회일로부터 최대 3개월 이전 내역까지 조회할 수 있습니다.
    * - https://docs.popbill.com/easyfinbank/java/api#RequestJob
    */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 기관코드
    String BankCode = "";

    // 계좌번호
    String AccountNumber = "";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20210701";

    // 종료일자, 닐짜형식(yyyyMMdd)
    String EDate = "20210710";

    String jobID = null;

    try {
        jobID = easyFinBankService.requestJob(testCorpNum, BankCode, AccountNumber, SDate, EDate);

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
                <legend>계좌 거래내역 수집 요청</legend>
                <ul>
                    <li>jobID (작업아이디) : <%=jobID %> </li>
                </ul>
            </fieldset>
         </div>
    </body>
</html>
