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
     * 세금계산서에 첨부된 전자명세서를 해제합니다.
     * - https://docs.popbill.com/taxinvoice/java/api#DetachStatement
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 세금계산서 유형 (SELL , BUY , TRUSTEE 중 택 1)
    // - SELL = 매출 , BUY = 매입 , TRUSTEE = 위수탁
    MgtKeyType keyType = MgtKeyType.SELL;

    // 세금계산서 문서번호
    String mgtKey = "20220218-JSP001";

    // 첨부해제할 전자명세서 유형 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
    int subItemCode = 121;

    // 첨부해제할 전자명세서 문서번호
    String subMgtKey = "20220218-JSP002";

    Response CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.detachStatement(testCorpNum, keyType, mgtKey, subItemCode, subMgtKey);

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
            <legend>전자명세서 첨부해제</legend>
            <ul>
                <li>Response.code : <%=CheckResponse.getCode()%></li>
                <li>Response.message : <%=CheckResponse.getMessage()%></li>
            </ul>
        </fieldset>
     </div>
</html>
