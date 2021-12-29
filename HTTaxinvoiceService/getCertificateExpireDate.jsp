<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 홈택스연동 인증을 위해 팝빌에 등록된 인증서 만료일자를 확인합니다.
	 * - https://docs.popbill.com/httaxinvoice/java/api#GetCertificateExpireDate
	 */

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
	String testCorpNum = "1234567890";

	Date expireDate = null;

	try {

		expireDate = htTaxinvoiceService.getCertificateExpireDate(testCorpNum);

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
				<legend>홈택스연동 공인인증서 만료일시 확인</legend>
				<ul>
					<li>expireDate : <%=expireDate%> </li>
				</ul>
			</fieldset>
		</div>
	</body>
</html>
