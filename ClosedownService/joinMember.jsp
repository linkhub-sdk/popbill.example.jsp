<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.JoinForm"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	//연동회원 가입 요청

	JoinForm joinInfo = new JoinForm();

	joinInfo.setLinkID("TESTER");			// 링크아이디
	joinInfo.setCorpNum("1234567890");		// 사업자번호 "-" 제외 10자리
	joinInfo.setCEOName("대표자성명");
	joinInfo.setCorpName("상호");
	joinInfo.setAddr("주소");
	joinInfo.setZipCode("500-100");			// 우편번호
	joinInfo.setBizType("업태");			// 업태
	joinInfo.setBizClass("업종");			// 업종
	joinInfo.setID("user1234");				// 아이디, 6자 이상 20자 미만
	joinInfo.setPWD("12345678");			// 비밀번호, 6자 이상 20자 미만
	joinInfo.setContactName("담당자명");	
	joinInfo.setContactTEL("02-999-9999");
	joinInfo.setContactHP("010-1234-5678");
	joinInfo.setContactFAX("02-999-9999");
	joinInfo.setContactEmail("code@linkhub.co.kr");

	Response CheckResponse = null;

	try {

		CheckResponse =	closedownService.joinMember(joinInfo);

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
				<legend>연동회원 가입 요청 결과</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>