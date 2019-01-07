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
	/*
	 * 파트너의 연동회원으로 회원가입을 요청합니다.
	 */

	JoinForm joinInfo = new JoinForm();

	// 링크아이디
	joinInfo.setLinkID("TESTER");

	// 사업자번호 "-" 제외
	joinInfo.setCorpNum("0000000016");

	// 대표자명
	joinInfo.setCEOName("대표자성명");

	// 상호
	joinInfo.setCorpName("상호");

	// 주소
	joinInfo.setAddr("주소");

	// 업태
	joinInfo.setBizType("업태");

	// 종목
	joinInfo.setBizClass("종목");

	// 아이디, 최대 20자
	joinInfo.setID("testkorea");

	// 비밀번호, 최대 20자
	joinInfo.setPWD("12345678");

	// 담당자명
	joinInfo.setContactName("담당자명");

	// 담당자 연락처
	joinInfo.setContactTEL("02-999-9999");

	// 담당자 휴대폰번호
	joinInfo.setContactHP("010-000-1234");

	// 담당자 팩스번호
	joinInfo.setContactFAX("02-999-9999");

	// 담당자 메일주소
	joinInfo.setContactEmail("test@test.co.kr");

	Response CheckResponse = null;

	try {

		CheckResponse =	htCashbillService.joinMember(joinInfo);

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
				<legend>연동회원가입 요청</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
