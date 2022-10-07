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
     * 하나의 전자명세서에 다른 전자명세서를 첨부합니다.
     * - https://docs.popbill.com/statement/java/api#AttachStatement
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 전자명세서 문서번호
    String mgtKey = "20220218-JSP001";

    // 첨부할 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int subItemCode = 121;

    // 첨부할 전자명세서 문서번호
    String subMgtKey = "20220218-JSP002";

    Response CheckResponse = null;

    try {

        CheckResponse = statementService.attachStatement(testCorpNum, itemCode, mgtKey, subItemCode, subMgtKey);

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
                <legend>다른 전자명세서 첨부</legend>
                <ul>
                    <li>Response.code : <%=CheckResponse.getCode()%></li>
                    <li>Response.message : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
