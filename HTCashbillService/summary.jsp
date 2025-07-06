<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTCashbillSummary"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 수집 상태 확인(GetJobState API) 함수를 통해 상태 정보가 확인된 작업아이디를 활용하여 수집된 현금영수증 매입/매출 내역의 요약 정보를 조회합니다.
     * - 요약 정보 : 현금영수증 수집 건수, 공급가액 합계, 세액 합계, 봉사료 합계, 합계 금액
     * - https://developers.popbill.com/reference/htcashbill/java/api/search#Summary
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 수집요청(requestJob API) 함수 호출 시 발급받은 작업아이디
    String jobID = "";

    // 거래구분 배열 ("P" 와 "C" 중 선택, 다중 선택 가능)
    // └ P = 소득공제용 , C = 지출증빙용
    // └ 미입력시 전체조회
    String[] TradeUsage = {"P", "C"};

    // 문서형태 배열 ("N" 와 "C" 중 선택, 다중 선택 가능)
    // └ N = 일반 현금영수증 , C = 취소현금영수증
    // └ 미입력시 전체조회
    String[] TradeType = {"N", "C"};

    HTCashbillSummary result = null;

    try {

        result = htCashbillService.summary(testCorpNum, jobID, TradeUsage, TradeType);

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
                    <li>count (수집 건수) : <%= result.getCount() %></li>
                    <li>supplyCostTotal (공급가액 합계) : <%= result.getSupplyCostTotal() %></li>
                    <li>taxTotal (세액 합계) : <%= result.getTaxTotal() %></li>
                    <li>serviceFeeTotal (봉사료 합계) : <%= result.getServiceFeeTotal() %></li>
                    <li>amountTotal (총계) : <%= result.getAmountTotal() %></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
