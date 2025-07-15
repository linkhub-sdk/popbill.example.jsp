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
     * 발신자가 발행한 전자명세서를 발행취소합니다.
     * - "발행취소" 상태의 전자명세서를 삭제(Delete API) 함수를 이용하면, 전자명세서 관리를 위해 할당했던 문서번호를 재사용 할 수 있습니다.
     * - https://developers.popbill.com/reference/statement/java/api/issue#Cancel
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 전자명세서 문서 유형, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 파트너가 할당한 문서번호
    String mgtKey = "20250711-MVC002";

    // 전자명세서 상태 이력을 관리하기 위한 메모
    String memo = "발행취소 메모";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = statementService.cancel(CorpNum, itemCode, mgtKey, memo, UserID);

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
                <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>응답코드 (code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
