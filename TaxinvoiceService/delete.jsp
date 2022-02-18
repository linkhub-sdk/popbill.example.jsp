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
     * 삭제 가능한 상태의 세금계산서를 삭제합니다.
     * - 삭제 가능한 상태: "임시저장", "발행취소", "역발행거부", "역발행취소", "전송실패"
     * - 삭제처리된 세금계산서의 문서번호는 재사용이 가능합니다.
     * - https://docs.popbill.com/taxinvoice/java/api#Delete
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 세금계산서 유형 (SELL , BUY , TRUSTEE 중 택 1)
    // - SELL = 매출 , BUY = 매입 , TRUSTEE = 위수탁
    MgtKeyType keyType = MgtKeyType.SELL;

    // 세금계산서 문서번호
    String mgtKey = "20210708-002";

    Response CheckResponse = null;

    try {

            CheckResponse = taxinvoiceService.delete(testCorpNum, keyType, mgtKey);

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
            <legend>세금계산서 삭제</legend>
            <ul>
                <li>Response.code : <%=CheckResponse.getCode()%></li>
                <li>Response.message : <%=CheckResponse.getMessage()%></li>
            </ul>
        </fieldset>
     </div>
</html>
