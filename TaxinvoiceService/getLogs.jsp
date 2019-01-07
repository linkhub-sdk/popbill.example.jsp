<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceLog"%>

<%
	/*
	 * 세금계산서 상태 변경이력을 확인합니다.
	 * - 상태 변경이력 확인(GetLogs API) 응답항목에 대한 자세한 정보는
	 *   "[전자세금계산서 API 연동매뉴얼] > 3.5.5 상태 변경이력 확인" 을 참조하시기 바랍니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

	// 세금계산서 문서관리번호
	String mgtKey = "20161130-01";

	TaxinvoiceLog[] taxinvoiceLogs = null;

	try {

		taxinvoiceLogs = taxinvoiceService.getLogs(testCorpNum, keyType, mgtKey);

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
				<legend>세금계산서 상태변경 이력</legend>
				<%
						TaxinvoiceLog taxinvoiceLog = new TaxinvoiceLog();

						for ( int i = 0; i < taxinvoiceLogs.length; i++ ) {
							taxinvoiceLog = taxinvoiceLogs[i];
				%>
				<fieldset class="fieldset2">
					<legend>TaxinvoiceLog.docLogType : <%= taxinvoiceLog.getDocLogType() %></legend>
					<ul>
						<li>log (이력정보) : <%= taxinvoiceLog.getLog() %> </li>
						<li>procType (처리형태) : <%=taxinvoiceLog.getProcType() %></li>
						<li>procCorpName (처리회사명) : <%=taxinvoiceLog.getProcCorpName() %></li>
						<li>procContactName (처리담당자) : <%=taxinvoiceLog.getProcContactName() %></li>
						<li>procMemo (처리메모) : <%=taxinvoiceLog.getProcMemo() %></li>
						<li>regDT (등록일시) : <%=taxinvoiceLog.getRegDT() %></li>
						<li>ip (아이피) : <%=taxinvoiceLog.getIP() %></li>
					</ul>
				</fieldset>
				<%
					}
				%>
			</fieldset>
		 </div>
	</body>
</html>
