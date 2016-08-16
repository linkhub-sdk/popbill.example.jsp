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
	String testCorpNum = "1234567890";		// 회원 사업자번호
	String userID = "testkorea";				// 회원 아이디
	String TOGO = "CHRG";					// CHRG : 포인트 충전, LOGIN : 메인, CERT : 공인인증서 등록, SEAL : 인감 및 첨부문서 등록
	String url = null;

	try {

		url = taxinvoiceService.getPopbillURL(testCorpNum, userID, TOGO);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>팝빌 SSO URL 확인</legend>
				<ul>
					<li>URL : <%=url%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
