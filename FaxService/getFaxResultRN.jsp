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
	/*
	 * 파트너가 할당한 전송요청 번호를 통해 팩스 전송상태 및 결과를 확인합니다.
	 * - https://docs.popbill.com/fax/java/api#GetFaxResultRN
	 */

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
	String testCorpNum = "1234567890";

	// 팩스 전송요청시 파트너가 할당한 전송요청번호
	String requestNum = "fax_jsp_test1234";

	FaxResult[] faxResults = null;

	try {

		faxResults = faxService.getFaxResultRN(testCorpNum, requestNum);

	} catch (PopbillException pe) {
		// 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		// 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
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

			for ( int i = 0; i < faxResults.length; i++ ) {
				faxResult = faxResults[i];
		%>

		<fieldset class="fieldset2">
			<ul>
				<li>state (전송상태 코드) : <%=faxResult.getState()%></li>
				<li>result (전송결과 코드) : <%=faxResult.getResult()%></li>
				<li>title (팩스제목) : <%=faxResult.getTitle()%></li>
				<li>sendNum (발신번호) : <%=faxResult.getSendNum()%></li>
				<li>senderName (발신자명) : <%=faxResult.getSenderName()%></li>
				<li>receiveNumType (수신번호 유형) : <%=faxResult.getReceiveNumType()%></li>
				<li>receiveNum (수신번호) : <%=faxResult.getReceiveNum()%></li>
				<li>receiveName (수신자명) : <%=faxResult.getReceiveName()%></li>
				<li>sendPageCnt (전체 페이지수) : <%=faxResult.getSendPageCnt()%></li>
				<li>successPageCnt (성공 페이지수) : <%=faxResult.getSuccessPageCnt()%></li>
				<li>failPageCnt (실패 페이지수) : <%=faxResult.getFailPageCnt()%></li>
				<li>refundPageCnt (환불 페이지수) : <%=faxResult.getRefundPageCnt()%></li>
				<li>cancelPageCnt (취소 페이지수) : <%=faxResult.getCancelPageCnt()%></li>
				<li>receiptDT (접수일시) : <%=faxResult.getReceiptDT()%></li>
				<li>reserveDT (예약일시) : <%=faxResult.getReserveDT()%></li>
				<li>sendDT (전송일시) : <%=faxResult.getSendDT()%></li>
				<li>resultDT (전송결과 수신일시) : <%=faxResult.getResultDT()%></li>
				<li>receiptNum (접수번호) : <%=faxResult.getReceiptNum()%></li>
				<li>requestNum (요청번호) : <%=faxResult.getRequestNum()%></li>
				<li>chargePageCnt (과금 페이지수) : <%=faxResult.getChargePageCnt()%></li>
				<li>tiffFileSize (변환파일용량 (단위:byte) ) : <%=faxResult.getTiffFileSize()%></li>
				<%
					String fileNames = "";
					int namesLength = faxResult.getFileNames().length;

					for (int j = 0; j < namesLength ; j++){
						if ( namesLength == 1 || j == faxResult.getFileNames().length -1 ) {
							fileNames += faxResult.getFileNames()[j];
						} else {
							fileNames += faxResult.getFileNames()[j]+", ";
						}
					}
				%>
				<li>fileNames (전송 파일명 리스트) : <%=fileNames%></li>
			</ul>
		</fieldset>
		<%
			}
		%>
	</fieldset>
</div>
</body>
</html>
