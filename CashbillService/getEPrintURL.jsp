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
		현금영수증 공급받는자용 인쇄 팝업 URL 확인, 등록(임시저장) 상태의 문서는 표시되지 않음
	*/

	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	String mgtKey = "20150319-01";			// 현금영수증 문서관리번호
	String userID = "testkorea";			// 연동회원 아이디

	String url = null;

	try {

		url = cashbillService.getEPrintURL(testCorpNum, mgtKey, userID);

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
				<legend>현금영수증 공급받는자용 인쇄 팝업 URL 확인</legend>
				<ul>
					<li>URL : <%=url%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>