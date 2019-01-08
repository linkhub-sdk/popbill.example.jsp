<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.ContactInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 연동회원의 담당자를 신규로 등록합니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	ContactInfo contactInfo = new ContactInfo();

	// 담당자 아이디 (최대 50자)
	contactInfo.setId("testkorea");

	// 비밀번호 (최대 20자)
	contactInfo.setPwd("this_is_password");

	// 담당자명 (최대 100자)
	contactInfo.setPersonName("담당자");

	// 담당자 연락처 (최대 20자)
	contactInfo.setTel("02-1234-1234");

	// 담당자 휴대폰번호 (최대 20자)
	contactInfo.setHp("010-1234-1234");

	// 담당자 팩스번호 (최대 20자)
	contactInfo.setFax("070-1234-1234");

	// 담당자 이메일 (최대 100자)
	contactInfo.setEmail("test@test.com");

	// 회사조회 권한여부, true-회사조회, false-개인조회
	contactInfo.setSearchAllAllowYN(true);

	Response CheckResponse = null;

	try {

		CheckResponse =	taxinvoiceService.registContact(testCorpNum, contactInfo);

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
				<legend>담당자 추가등록</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
