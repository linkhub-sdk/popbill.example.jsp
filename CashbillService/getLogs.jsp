<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CashbillLog"%>

<%
	// 현금영수증 문서이력 확인

	String testCorpNum = "1234567890";			// 연동회원 사업자번호
	String mgtKey = "20150318-02";				// 현금영수증 문서관리번호.

	CashbillLog[] cashbillLogs = null;

	try {

		cashbillLogs = cashbillService.getLogs(testCorpNum, mgtKey);

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
				<legend>현금영수증 문서이력 확인</legend>
				<%
						CashbillLog cashbillLog = new CashbillLog();
						for(int i=0; i<cashbillLogs.length; i++){
							cashbillLog = cashbillLogs[i];
				%>
				<fieldset class="fieldset2">
					<ul>
						<li>docLogType : <%= cashbillLog.getDocLogType() %> </li>
						<li>log : <%= cashbillLog.getLog() %> </li>
						<li>procType : <%=cashbillLog.getProcType() %></li>
						<li>procMemo : <%=cashbillLog.getProcMemo() %></li>
						<li>regDT : <%=cashbillLog.getRegDT() %></li>
						<li>ip : <%=cashbillLog.getIp() %></li>
					</ul>
				</fieldset>

				<%
					}
				%>

			</fieldset>
		 </div>
	</body>
</html>