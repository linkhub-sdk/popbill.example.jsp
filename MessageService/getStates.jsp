<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.MessageBriefInfo"%>

<%
	/*
	 * 문자전송에 대한 전송결과 요약정보를 확인합니다.
   * - https://docs.popbill.com/message/java/api#GetStates
	 */

	// 팝빌회원 사업자번호, '-'제외 10자리
	String testCorpNum = "1234567890";

	// 문자전송 요청 시 발급받은 접수번호 배열(receiptNum)
	String[] ReceiptNumList = new String[] {"019010716000000003"};

	MessageBriefInfo[] messageBriefInfos = null;

	try {

		messageBriefInfos = messageService.getStates(testCorpNum, ReceiptNumList);

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
				<legend>전송내역 요약정보 확인</legend>
				<%
					MessageBriefInfo messageBriefInfo = null;
					for ( int i = 0; i < messageBriefInfos.length; i++ ) {
						messageBriefInfo = messageBriefInfos[i];
				%>

				<fieldset class="fieldset2">
					<legend>‭전송결과 요약정보 : <%=i+1%></legend>
					<ul>
						<li>rNum (접수번호) : <%=messageBriefInfo.getrNum()%> </li>
						<li>sn (일련번호) : <%=messageBriefInfo.getSn()%></li>
						<li>stat (전송 상태코드) : <%=messageBriefInfo.getStat()%></li>
						<li>rlt (전송 결과코드) : <%=messageBriefInfo.getRlt()%></li>
						<li>sDT (전송일시) : <%=messageBriefInfo.getsDT()%></li>
						<li>rDT (결과코드 수신일시) : <%=messageBriefInfo.getrDT()%></li>
						<li>net (전송 이동통신사명) : <%=messageBriefInfo.getNet()%></li>
						<li>srt (구 전송결과 코드) : <%=messageBriefInfo.getSrt()%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
		 </div>
	</body>
</html>
