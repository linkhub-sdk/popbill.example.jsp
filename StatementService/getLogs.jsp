<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.StatementLog"%>

<%
	/*
	 * 전자명세서 상태 변경이력을 확인합니다.
	 * - 상태 변경이력 확인(GetLogs API) 응답항목에 대한 자세한 정보는
	 *   "[전자명세서 API 연동매뉴얼] > 3.2.5 GetLogs (상태 변경이력 확인)" 을 참조하시기 바랍니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

	// 전자명세서 문서번호
	String mgtKey = "20190107-001";

	StatementLog[] statementLogs = null;

	try {

		statementLogs = statementService.getLogs(testCorpNum, itemCode, mgtKey);

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
				<legend>전자명세서 상태변경 이력 확인</legend>
				<%
						StatementLog statementLog = new StatementLog();

            for ( int i = 0; i < statementLogs.length; i++ ) {
							statementLog = statementLogs[i];
				%>
				<fieldset class="fieldset2">
					<ul>
						<li>docLogType(로그타입) : <%= statementLog.getDocLogType() %> </li>
						<li>log(이력정보) : <%= statementLog.getLog() %> </li>
						<li>procMemo(처리메모) : <%= statementLog.getProcMemo() %> </li>
						<li>procType(처리형태) : <%=statementLog.getProcType() %></li>
						<li>regDT(등록일시) : <%=statementLog.getRegDT() %></li>
						<li>ip(아이피) : <%=statementLog.getIp() %></li>
					</ul>
				</fieldset>

				<%
					}
				%>

			</fieldset>
		 </div>
	</body>
</html>
