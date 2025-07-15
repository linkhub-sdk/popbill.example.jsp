<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
    /*
     * 공급자가 요청받은 역발행 세금계산서를 발행하기 전, 공급받는자가 역발행요청을 취소합니다.
     * 함수 호출시 "취소" 상태로 변경되고, 해당 역발행 세금계산서는 공급자에 의해 발행 될 수 없습니다.
    * - https://developers.popbill.com/reference/taxinvoice/java/api/issue#CancelRequest
    */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문서번호 유형 (SELL-매출, BUY-매입, TRUSTEE-위수탁)
    MgtKeyType keyType = MgtKeyType.BUY;

    // 파트너가 할당한 문서번호
    String mgtKey = "20250711-MVC004";

    // 세금계산서 상태 이력을 관리하기 위한 메모
    String memo = "역발행 취소 메모";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.cancelRequest(CorpNum, keyType, mgtKey, memo, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }

%>
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
</html>
