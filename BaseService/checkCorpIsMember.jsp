<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="/TaxinvoiceService/common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%
	Response CheckResponse = null;
	try {
		CheckResponse = taxinvoiceService.checkIsMember("1231212312","TESTER");
	} catch (PopbillException e) {
		throw e;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">회원가입여부 확인</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>회원가엽여부 확인 결과</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
