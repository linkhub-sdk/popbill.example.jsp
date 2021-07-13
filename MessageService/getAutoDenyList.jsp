<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.AutoDeny"%>

<%
	/*
	 * 전용 080 번호에 등록된 수신거부 목록을 반환합니다.
	 * - https://docs.popbill.com/message/java/api#GetAutoDenyList
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	AutoDeny[] autoDenyList = null;

	try {

		autoDenyList = messageService.getAutoDenyList(testCorpNum);

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
				<legend>080 수신거부번호 목록</legend>
				<%
					for ( int i = 0; i < autoDenyList.length; i++ ) {
						AutoDeny autoDeny = autoDenyList[i];
				%>
				<fieldset class="fieldset2">
					<legend>080수신거부 등록정보 [ <%=i+1%> / <%=autoDenyList.length%>]</legend>
						<ul>
							<li>number (수신거부번호) : <%= autoDeny.getNumber() %></li>
							<li>regDT (등록일시) : <%= autoDeny.getRegDT() %></li>
						</ul>
				</fieldset>
					<%
						}
					%>

			</fieldset>
		</div>
</html>
