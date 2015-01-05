<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1231212312";		// 사업자번호 ("-"제외)
	String linkID = "TESTER";				// 연동아이디

	Response CheckResponse = null;

	try {

		CheckResponse = messageService.checkIsMember(testCorpNum,linkID);

	} catch (PopbillException e) {
		throw e;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>연동회원사 가입 여부 확인 결과</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>