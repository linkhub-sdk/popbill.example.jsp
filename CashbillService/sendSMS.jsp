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
		알림문자 전송
		문자전송내용이 90Byte를 초과한경우 길이가 조정되어 전송됨
	*/

	String testCorpNum = "1234567890";			// 연동회원 사업자번호
	String mgtKey = "20150319-01";				// 현금영수증 문서관리번호
	String userID = "testkorea";				// 연동회원 아이디

	String sender = "07075103710";				// 발신번호
	String receiver = "01043245117";			// 수신번호 
	String contents = "현금영수증 문자메시지 전송 테스트입니다.";		// 문자 전송 내용 (90Byte 초과시 길이가 조정되어 전송)

	Response CheckResponse = null;

	try {

		CheckResponse = cashbillService.sendSMS(testCorpNum, mgtKey, sender, receiver, contents, userID);

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
				<legend>알림문자 전송</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>