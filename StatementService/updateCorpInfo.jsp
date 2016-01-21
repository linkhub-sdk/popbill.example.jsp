<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.CorpInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	String testUserId = "testkorea";		// 연동회원 아이디 
	
	CorpInfo corpInfo = new CorpInfo();
	corpInfo.setCeoname("대표자명");		// 대표자 성명, 최대 30자 
	corpInfo.setCorpName("상호");			// 상호, 최대 70자 
	corpInfo.setAddr("주소");				// 주소, 최대 300자
	corpInfo.setBizType("업태");			// 업태, 최대 40자
	corpInfo.setBizClass("업종");			// 업종, 최대 40자
	
	Response CheckResponse = null;

	try {

		CheckResponse = statementService.updateCorpInfo(testCorpNum, corpInfo, testUserId);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>회사정보 수정 결과</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>