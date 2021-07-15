<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.fax.SenderNumber"%>

<%
	/*
	 * 팝빌에 등록한 연동회원의 팩스 발신번호 목록을 확인합니다.
	 * - https://docs.popbill.com/fax/java/api#GetSenderNumberList
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	SenderNumber[] senderNumberList = null;

	try {

		senderNumberList = faxService.getSenderNumberList(testCorpNum);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}

%>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>팩스 발신번호 목록</legend>
				<%
					for ( int i = 0; i < senderNumberList.length; i++ ) {
						SenderNumber info = senderNumberList[i];
				%>
				<fieldset class="fieldset2">
					<legend>발신번호 정보[<%=i+1%>/<%=senderNumberList.length%>]</legend>
						<ul>
							<li>number (발신번호) : <%= info.getNumber() %></li>
							<li>representYN (대표번호 지정여부) : <%= info.getRepresentYN() %></li>
							<li>state (등록상태) : <%= info.getState() %></li>
							<li>memo (메모) : <%= info.getMemo() %></li>
						</ul>
				</fieldset>
					<%
						}
					%>
			</fieldset>
		 </div>
</html>
