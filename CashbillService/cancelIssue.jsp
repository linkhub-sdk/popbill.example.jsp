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
  * [발행완료] 상태의 현금영수증을 [발행취소] 합니다.
  * - 발행취소는 국세청 전송전에만 가능합니다.
  * - 발행취소된 형금영수증은 국세청에 전송되지 않습니다.
	*/

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 현금영수증 문서관리번호
	String mgtKey = "20170307-01";

  // 팝빌회원 아이디
	String userID = "testkorea";

	Response CheckResponse = null;

	try {

		CheckResponse = cashbillService.cancelIssue(testCorpNum, mgtKey, userID);

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
				<legend>현금영수증 발행취소</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
