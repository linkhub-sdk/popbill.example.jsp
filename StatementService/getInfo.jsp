<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.StatementInfo"%>

<%
  /**
  * 1건의 전자명세서 상태/요약 정보를 확인합니다.
  * - 응답항목에 대한 자세한 정보는 "[전자명세서 API 연동매뉴얼] > 3.3.1.
  *   GetInfo (상태 확인)"을 참조하시기 바랍니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

  // 전자명세서 문서관리번호
	String mgtKey = "20161130-01";

	StatementInfo statementInfo = null;

	try {

		statementInfo = statementService.getInfo(testCorpNum, itemCode, mgtKey);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>전자명세서 상태/요약 정보</legend>
				<fieldset class="fieldset2">
					<legend>StatementInfo</legend>
					<ul>
						<li>itemKey : <%= statementInfo.getItemKey()%></li>
						<li>itemCode : <%= statementInfo.getItemCode()%></li>
						<li>invoiceNum : <%= statementInfo.getInvoiceNum()%></li>
						<li>mgtKey : <%= statementInfo.getMgtKey()%></li>

						<li>stateCode : <%= statementInfo.getStateCode()%></li>
						<li>taxType : <%= statementInfo.getTaxType()%></li>
						<li>purposeType : <%= statementInfo.getPurposeType()%></li>

						<li>writeDate : <%= statementInfo.getWriteDate()%></li>
						<li>senderCorpName : <%= statementInfo.getSenderCorpName()%></li>
						<li>senderCorpNum : <%= statementInfo.getSenderCorpNum()%></li>
						<li>senderPrintYN : <%= statementInfo.isSenderPrintYN()%></li>

						<li>receiverCorpName : <%= statementInfo.getReceiverCorpName()%></li>
						<li>receiverCorpNum : <%= statementInfo.getReceiverCorpNum()%></li>
						<li>receiverPrintYN : <%= statementInfo.isReceiverPrintYN()%></li>

						<li>supplyCostTotal : <%= statementInfo.getSupplyCostTotal()%></li>
						<li>taxTotal : <%= statementInfo.getTaxTotal()%></li>
						<li>issueDT : <%= statementInfo.getIssueDT()%></li>
						<li>stateDT : <%= statementInfo.getStateDT()%></li>
						<li>openYN : <%= statementInfo.isOpenYN()%></li>
						<li>openDT : <%= statementInfo.getOpenDT()%></li>
						<li>stateMemo : <%= statementInfo.getStateMemo()%></li>
						<li>regDT : <%= statementInfo.getRegDT()%></li>

					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
