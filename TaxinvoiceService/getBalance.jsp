<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 연동회원의 잔여포인트를 확인합니다.
	 * - 과금방식이 파트너과금인 경우 파트너 잔여포인트(GetPartnerBalance API) 를 통해 확인하시기 바랍니다.
	 * - https://docs.popbill.com/taxinvoice/java/api#GetBalance
	 */

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리), "-" 제외 10자리
	String testCorpNum = "1234567890";

	double remainPoint;

	try {

		remainPoint = taxinvoiceService.getBalance(testCorpNum);

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
			<legend>연동회원 잔여포인트 확인</legend>
			<ul>
				<li>잔여포인트 : <%=remainPoint%> </li>
			</ul>
		</fieldset>
	 </div>
</body>
</html>
