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
    * "임시저장" 상태의 전자명세서를 발행하여, "발행완료" 상태로 처리합니다.
    * - 팝빌 사이트 [전자명세서] > [관리] > [환경설정] 메뉴의 발행시 자동승인 옵션 설정을 통해 전자명세서를 "발행완료" 상태가 아닌 "승인대기" 상태로 발행 처리 할 수 있습니다.
    * - 전자명세서 발행 함수 호출시 수신자에게 발행 안내 메일이 발송됩니다.
    * - https://developers.popbill.com/reference/statement/java/api/issue#Issue
    */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int itemCode = 121;

    // 전자명세서 문서번호
    String mgtKey = "20230102-JSP001";

    // 전자명세서 상태 이력을 관리하기 위한 메모
    String memo = "상태메모";

    // 전자명세서 발행 안내메일 제목
    // - 미입력시 팝빌에서 지정한 이메일 제목으로 전송
    String emailSubject = "메일제목";

    Response CheckResponse = null;

    try {

        CheckResponse = statementService.issue(testCorpNum, itemCode, mgtKey, memo, emailSubject, null);

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
                    <li>응답 코드(code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>