<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTTaxinvoiceXMLResponse" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 홈택스에서 수집된 전자세금계산서 1건의 상세정보를 XML 데이터 포맷으로 제공합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/search#GetXML
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 전자세금계산서 국세청승인번호
    String ntsConfirmNum = "202507118888888800000109";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    HTTaxinvoiceXMLResponse xmlResponse = null;

    String xmlData = null;

    try {

        xmlResponse = htTaxinvoiceService.getXML(CorpNum, ntsConfirmNum, UserID);

        xmlData = xmlResponse.getRetObject();
        xmlData = xmlData.replaceAll("<","&lt;").replaceAll(">", "&gt;");
        // Browser 에서 xml정보를 프린트하기위해 '<', '>' 특수기호를 치환하였습니다.
        // xml원본정보틑 xmlResponse.getRegObject(); 를 통해 반환되는 정보를 참조하시기 바랍니다.

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
                      <li>resultCode (응답코드) : <%=xmlResponse.getResultCode()%> </li>
                      <li>message (응답메시지) : <%=xmlResponse.getMessage()%> </li>
                      <li>retObject (전자세금계산서 XML 문서) :<%=xmlData%> </li>
                </ul>
          </fieldset>
        </div>
    </body>
</html>
