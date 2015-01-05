<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.SentMessage"%>

<%
	String testCorpNum= "1231212312";			// 회원 사업자번호
	String receiptNum = "014123015000000007";	// 문자전송(sendSMS)시 발급받은 접수번호

	SentMessage[] sentMessages = null;

	try {
	
		sentMessages = messageService.getMessages(testCorpNum, receiptNum);

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
				<legend>메시지 전송결과 조회</legend>
				<% 
					for(int i=0; i<sentMessages.length; i++){
						SentMessage sentMsg = sentMessages[i];
				%>

				<fieldset class="fieldset2">
					<legend>SentMessage : <%=i+1%></legend>
					<ul>
						<li>sendState : <%=sentMsg.getState()%> </li>
						<li>subject : <%=sentMsg.getSubject()%></li>
						<li>messageType : <%=sentMsg.getMessageType()%></li>
						<li>content : <%=sentMsg.getContent()%></li>
						<li>sendNum : <%=sentMsg.getSendNum()%></li>
						<li>receiveNum : <%=sentMsg.getReceiveNum()%></li>
						<li>receiveName : <%=sentMsg.getReceiveName()%></li>
						<li>reserveDT : <%=sentMsg.getReserveDT()%></li>
						<li>sendDT : <%=sentMsg.getSendDT()%></li>
						<li>resultDT : <%=sentMsg.getResultDT()%></li>
						<li>sendResult : <%=sentMsg.getSendResult()%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
		 </div>
	</body>
</html>