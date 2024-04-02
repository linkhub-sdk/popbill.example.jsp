<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.Response" %>

<%
    /**
     * 전자세금계산서 발행에 필요한 공동인증서를 팝빌 인증서버에 등록합니다.
     * - 공동인증서는 팝빌에서 발급하는 '표준 인증서', 은행에서 발급하는 '전자세금용 인증서' 또는 '기업범용 인증서'만 등록 가능합니다.
     * 공동인증서 정보는 통신 구간의 보안을 위해 필드 레벨 암호화(FLE)되어 처리됩니다.
     * 통신구간 암호화 키 발급은 파트너 센터(1600-8536)로 문의하여 주시기 바랍니다.
     * 공동인증서 비밀번호의 안전한 관리를 위해 DB 저장시 컬럼 암호화 하여 저장합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/cert#RegistTaxCert
     */

    // 팝빌회원 사업자번호
    String CorpNum = "1234567890";

    // 공동인증서 공개키(Base64 Encoded)
    String CertPublicKey = "";

    // 공동인증서 개인키(Base64 Encoded)
    String CertPrivateKey = "";

    // 공동인증서 비밀번호
    String CertCipher = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response Response = null;

    try {

        Response = taxinvoiceService.registTaxCert(CorpNum, CertPublicKey, CertPrivateKey, CertCipher, UserID);

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
        <legend>인증서 등록</legend>
        <ul>
            <li>응답 코드(code) : <%=Response.getCode()%>
            </li>
            <li>응답메시지 (message) : <%=Response.getMessage()%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>