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
	/*
		다량 전자명세서 상태/요약 정보 확인, 최대 1000건
		상태정보 항목에 대한 설명은 [전자명세서 API 연동매뉴얼 > 4.2 전자명세서 상태정보 구성] 참조
	*/
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	int itemCode = 121;						// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]

	// 전자명세서 문서관리번호 배열(최대 1000건)
	String[] MgtKeyList = new String[] {"20150318-01", "20150318-02", "20150318-03", "20150319-01"};	
		
	StatementInfo[] statementInfos = null;
	
	try {

		statementInfos = statementService.getInfos(testCorpNum, itemCode, MgtKeyList);

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
				<legend>전자명세서 상태/요약 정보 확인</legend>

					<%
						StatementInfo statementInfo = null;
						for(int i=0; i < statementInfos.length; i++){
							statementInfo = statementInfos[i];		
						
					%>

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
								<li>receiverCorpName : <%= statementInfo.getReceiverCorpName()%></li>
								<li>receiverCorpNum : <%= statementInfo.getReceiverCorpNum()%></li>

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

						<%
							}
						%>


					</ul>
			</fieldset>
		 </div>
	</body>
</html>
