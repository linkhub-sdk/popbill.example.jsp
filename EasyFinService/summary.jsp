<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.easyfin.EasyFinBankSummary"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 금융기관에서 수집된 계좌 거래내역의 입금 및 출금 합계정보를 제공합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/search#Summary
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 작업아이디
    String jobID = "022021815000000001";

    // 거래유형 ("I" 와 "O" 중 선택, 다중 선택 가능)
    // └ I = 입금 , O = 출금
    // - 미입력 시 전체조회
    String[] TradeType = { "I", "O" };

    // 조회 검색어, "입·출금액" / "거래내역 메모" / "비고" 중 검색하고자 하는 값 입력
    // - 거래내역 메모 = 거래내역 메모저장(SaveMemo API) 함수를 사용하여 저장한 값
    // - 비고 = EasyFinBankSearchDetail의 remark1, remark2, remark3 값
    // - 미입력시 전체조회
    String SearchString = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    EasyFinBankSummary result = null;

    try {
        result = easyFinBankService.summary(CorpNum, jobID, TradeType, SearchString, UserID);

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
                <li>cntAccIn (입금거래 건수) : <%= result.getCntAccIn() %></li>
                <li>cntAccOut (출금거래 건수) : <%= result.getCntAccOut() %></li>
                <li>totalAccIn (입금액 합계) : <%= result.getTotalAccIn() %></li>
                <li>totalAccOut (출금액 합계) : <%= result.getTotalAccOut() %></li>
            </ul>
        </fieldset>
    </div>
    </body>
</html>
