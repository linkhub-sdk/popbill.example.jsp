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
	 * 문자전송요청시 할당한 전송요청번호(requestNum)로 전송상태를 확인합니다
	 * - 응답항목에 대한 자세한 사항은 "[문자 API 연동매뉴얼] > 3.3.2. GetMessagesRN (전송내역 확인 - 요청번호 할당)을 참조하시기 바랍니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 예약문자전송 요청시 할당한 전송요청번호
	String requestNum = "20190107-002";

	Response CheckResponse = null;

	try {

		CheckResponse = messageService.cancelReserveRN(testCorpNum, requestNum);

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
				<legend>예약문자전송 취소</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
