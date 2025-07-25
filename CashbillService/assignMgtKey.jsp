<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.Response"%>

<%
    /*
     * 팝빌 사이트를 통해 발행하여 문서번호가 할당되지 않은 현금영수증에 문서번호를 할당합니다.
     * - https://developers.popbill.com/reference/cashbill/java/api/etc#AssignMgtKey
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌에서 현금영수증 관리 목적으로 할당한 식별번호, 문서 목록조회(Search API) 함수의 반환항목 중 ItemKey 참조
    String ItemKey = "022025071115800001";

    // 파트너가 할당한 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    String MgtKey = "20250711-JSP007";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = cashbillService.assignMgtKey(CorpNum, ItemKey, MgtKey, UserID);

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
                <li>code (응답코드) : <%=CheckResponse.getCode()%></li>
                <li>message (응답메시지) : <%=CheckResponse.getMessage()%></li>
            </ul>
        </fieldset>
    </div>
</html>
