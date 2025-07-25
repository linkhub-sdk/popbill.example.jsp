<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.CorpInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 연동회원의 회사정보를 수정합니다.
     * - https://developers.popbill.com/reference/easyfinbank/java/common-api/member#UpdateCorpInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 회사 객체정보
    CorpInfo corpInfo = new CorpInfo();

    // 대표자 성명, 최대 100자
    corpInfo.setCeoname("대표자 성명 수정 테스트");

    // 회사명, 최대 200자
    corpInfo.setCorpName("회사명 수정 테스트");

    // 주소, 최대 300자
    corpInfo.setAddr("주소 수정 테스트");

    // 업태, 최대 100자
    corpInfo.setBizType("업태 수정 테스트");

    // 종목, 최대 100자
    corpInfo.setBizClass("종목 수정 테스트");

    // 팝빌회원 아이디
    String UserID =  "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = easyFinBankService.updateCorpInfo(CorpNum, corpInfo, UserID);

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
                <li>code (응답코드) : <%=CheckResponse.getCode()%></li>
                <li>message (응답메시지) : <%=CheckResponse.getMessage()%></li>
            </ul>
        </fieldset>
    </div>
    </body>
</html>
