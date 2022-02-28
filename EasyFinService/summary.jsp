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
     * 수집 상태 확인(GetJobState API) 함수를 통해 상태 정보가 확인된 작업아이디를 활용하여 계좌 거래내역의 요약 정보를 조회합니다.
     * - 요약 정보는 입·출금액 합계, 입·출 거래 건수를 가리킵니다.
     * - https://docs.popbill.com/easyfinbank/java/api#Summary
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 수집 요청시 발급받은 작업아이디
    String jobID = "022021815000000002";

    // 거래유형 배열 ("I" 와 "O" 중 선택, 다중 선택 가능)
    // └ I = 입금 , O = 출금
    // - 미입력 시 전체조회
    String[] TradeType = {"I", "O"};

    // "입·출금액" / "메모" / "비고" 중 검색하고자 하는 값 입력
    // - 메모 = 거래내역 메모저장(SaveMemo)을 사용하여 저장한 값
    // - 비고 = EasyFinBankSearchDetail의 remark1, remark2, remark3 값
    // - 미입력시 전체조회
    String searchString = "";

    EasyFinBankSummary result = null;

    try {
        result = easyFinBankService.summary(testCorpNum, jobID, TradeType, searchString, testUserID);

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
            <legend> 조회결과 </legend>
            <ul>
                <li>count (수집 결과 건수) : <%= result.getCount() %></li>
                <li>cntAccIn (입금거래 건수) : <%= result.getCntAccIn() %></li>
                <li>cntAccOut (출금거래 건수) : <%= result.getCntAccOut() %></li>
                <li>totalAccIn (입금액 합계) : <%= result.getTotalAccIn() %></li>
                <li>totalAccOut (출금액 합계) : <%= result.getTotalAccOut() %></li>
            </ul>
        </fieldset>
    </div>
    </body>
</html>
