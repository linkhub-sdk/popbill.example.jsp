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
	/*
	 * 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
	 * - https://docs.popbill.com/fax/java/api#CheckIsMember
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 연동신청시 팝빌에서 발급받은 링크아이디
	String linkID = "TESTER";

	Response CheckResponse = null;

	try {

		CheckResponse = faxService.checkIsMember(testCorpNum, linkID);

	} catch (PopbillException pe) {
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>연동회원 가입여부 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
