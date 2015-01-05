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
	String testCorpNum = "1231212312";			// 회원 사업자번호
	MgtKeyType keyType = MgtKeyType.SELL;		// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	String mgtKey = "20141230-12";				// 세금계산서 연동관리번호.

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
				<legend>세금계산서 문서이력 확인</legend>
				
				<%
						TaxinvoiceLog taxinvoiceLog = new TaxinvoiceLog();
						for(int i=0; i<taxinvoiceLogs.length; i++){
							taxinvoiceLog = taxinvoiceLogs[i];
				%>


				<fieldset class="fieldset2">
					<legend>TaxinvoiceLog.docLogType : <%= taxinvoiceLog.getDocLogType() %></legend>
					<ul>
						<li>log : <%= taxinvoiceLog.getLog() %> </li>
						<li>procType : <%=taxinvoiceLog.getProcType() %></li>
						<li>procCorpName : <%=taxinvoiceLog.getProcCorpName() %></li>
						<li>procContactName : <%=taxinvoiceLog.getProcContactName() %></li>
						<li>procMemo : <%=taxinvoiceLog.getProcMemo() %></li>
						<li>regDT : <%=taxinvoiceLog.getRegDT() %></li>
						<li>ip : <%=taxinvoiceLog.getIP() %></li>
					</ul>
				</fieldset>

				<%
					}
				%>

			</fieldset>
		 </div>
	</body>
</html>