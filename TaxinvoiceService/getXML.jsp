<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceXML"%>

<%
    /*
     * 세금계산서 1건의 상세정보를 XML로 확인합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/info#GetXML
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 세금계산서 유형 (SELL , BUY , TRUSTEE 중 택 1)
    // - SELL = 매출 , BUY = 매입 , TRUSTEE = 위수탁
    MgtKeyType keyType = MgtKeyType.SELL;

    // 세금계산서 문서번호
    String mgtKey = "20230102-JHP0201";

    TaxinvoiceXML taxinvoiceXML = null;

    try {

        taxinvoiceXML = taxinvoiceService.getXML(testCorpNum, keyType, mgtKey);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
<body>
    <div id="content">
        <p class="heading1">TaxinvoiceXML</p>
        <fieldset class="fieldset1">
            <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>code (응답코드) : <%=taxinvoiceXML.getCode() %></li>
                    <li>message (응답메시지) : <%=taxinvoiceXML.getMessage() %></li>
                    <li>retObject (전자세금계산서 XML 문서) : <%=taxinvoiceXML.getRetObject().replaceAll("<","&lt;").replaceAll(">", "&gt;") %></li>

                </ul>
        </fieldset>
    </div>
</body>
</html>
