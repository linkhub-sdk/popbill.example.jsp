<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 한 건의 거래 내역에 메모를 저장합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/api/search#SaveMemo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 메모를 저장할 거래내역 아이디
    // └ 거래내역 조회(Seach API) 함수의 반환값인 EasyFinBankSearchDetail 의 tid를 통해 확인 가능
    String TID = "";

    // 메모
    String Memo = "Memo-테스트";

    Response saveResponse = null;

    try {

        saveResponse = easyFinBankService.saveMemo(testCorpNum, TID, Memo);

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
                <legend>계좌 거래내역 메모저장</legend>
                <ul>
                    <li>응답 코드(code) : <%=saveResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=saveResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
