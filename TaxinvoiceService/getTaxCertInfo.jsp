<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.TaxinvoiceCertificate" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 팝빌 인증서버에 등록된 인증서의 정보를 확인합니다.
     * - https://docs.popbill.com/taxinvoice/java/api#GetTaxCertInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 계정 아이디
    String testUserID = "testkorea";

    TaxinvoiceCertificate taxinvoiceCertificate = null;

    try {

        taxinvoiceCertificate = taxinvoiceService.getTaxCertInfo(testCorpNum, testUserID);

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
        <legend>공동인증서 정보확인</legend>
        <ul>
            <li>regDT (등록일시) : <%=taxinvoiceCertificate.getRegDT() %> </li>
            <li>expireDT (만료일시) : <%=taxinvoiceCertificate.getExpireDT() %> </li>
            <li>issuerDN (인증서 발급자 DN) : <%=taxinvoiceCertificate.getIssuerDN() %> </li>
            <li>subjectDN (등록된 인증서 DN) : <%=taxinvoiceCertificate.getSubjectDN() %> </li>
            <li>issuerName (인증서 종류) : <%=taxinvoiceCertificate.getIssuerName() %> </li>
            <li>oid (OID) : <%=taxinvoiceCertificate.getOid() %> </li>
            <li>regContactName (등록 담당자 성명) : <%=taxinvoiceCertificate.getRegContactName() %> </li>
            <li>regContactID (등록 담당자 아이디) : <%=taxinvoiceCertificate.getRegContactID() %> </li>
        </ul>
    </fieldset>
</div>
</body>
</html>
