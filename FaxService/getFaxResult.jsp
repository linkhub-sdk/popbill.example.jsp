<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.fax.FaxResult"%>

<%
	String testCorpNum = "1231212312";			// 회원 사업자번호
	String receiptNum = "014123117464200001";	// 전송요청(sendFAX)시 발급받은 접수번호
	
	FaxResult[] faxResults = null;

	try {

		faxResults = faxService.getFaxResult(testCorpNum, receiptNum);

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
			<legend>팩스전송 전송결과 확인</legend>
				<%
					FaxResult faxResult = new FaxResult();

					for(int i=0; i<faxResults.length; i++){
						faxResult = faxResults[i];
				%>

				<fieldset class="fieldset2">
					<legend>FaxResult : <%=i+1%></legend>
					<ul>
						<li>sendState : <%=faxResult.getSendState()%></li>
						<li>convState : <%=faxResult.getConvState()%></li>
						<li>sendNum : <%=faxResult.getSendNum()%></li>
						<li>receiveNum : <%=faxResult.getReceiveNum()%></li>
						<li>receiveName : <%=faxResult.getReceiveName()%></li>
						<li>sendPageCnt : <%=faxResult.getSendPageCnt()%></li>
						<li>successPageCnt : <%=faxResult.getSuccessPageCnt()%></li>
						<li>failPageCnt : <%=faxResult.getFailPageCnt()%></li>
						<li>refundPageCnt : <%=faxResult.getRefundPageCnt()%></li>
						<li>cancelPageCnt : <%=faxResult.getCancelPageCnt()%></li>
						<li>receiptDT : <%=faxResult.getReceiptDT()%></li>
						<li>reserveDT : <%=faxResult.getReserveDT()%></li>
						<li>sendDT : <%=faxResult.getSendDT()%></li>
						<li>resultDT : <%=faxResult.getResultDT()%></li>
						<li>sendResult : <%=faxResult.getSendResult()%></li>
						<%
							String fileNames = "";
							int namesLength = faxResult.getFileNames().length;

							for(int j = 0; j < namesLength ; j++){
								if ( namesLength == 1 || j == faxResult.getFileNames().length -1 ) {
									fileNames += faxResult.getFileNames()[j];
								} else {
									fileNames += faxResult.getFileNames()[j]+", ";
								}
							}
						%>
						<li>fileNames : <%=fileNames%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
			</fieldset>
		 </div>
	</body>
</html>