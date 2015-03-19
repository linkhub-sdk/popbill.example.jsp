<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CashbillInfo"%>

<%
	/*
		현금영수증 상태/요약 정보 확인
		현금영수증 상태정보 항목에 대한 설명은 [현금영수증 API 연동매뉴얼 - 4.2 현금영수증 상태정보 구성] 참조
	*/

	String testCorpNum = "1234567890";			// 연동회원 사업자번호
	String mgtKey = "20150319-01";				// 현금영수증 문서관리번호

	CashbillInfo cashbillInfo = null;
	
	try {

		cashbillInfo = cashbillService.getInfo(testCorpNum, mgtKey);
		
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
				<legend>현금영수증 상태/요약 정보 확인</legend>
				<fieldset class="fieldset2">
					<legend>CashbillInfo</legend>
					<ul>
						<li>itemKey : <%= cashbillInfo.getItemKey()%></li>
						<li>mgtKey : <%= cashbillInfo.getMgtKey()%></li>
						<li>tradeDate : <%= cashbillInfo.getTradeDate()%></li>
						<li>issueDT : <%= cashbillInfo.getIssueDT()%></li>
						<li>customerName : <%= cashbillInfo.getCustomerName()%></li>
						<li>itemName : <%= cashbillInfo.getItemName()%></li>
						<li>identityNum : <%= cashbillInfo.getIdentityNum()%></li>
						<li>taxationType : <%= cashbillInfo.getTaxationType()%></li>
						<li>totalAmount : <%= cashbillInfo.getTotalAmount()%></li>
						<li>tradeUsage : <%= cashbillInfo.getTradeUsage()%></li>
						<li>tradeType : <%= cashbillInfo.getTradeType()%></li>
						<li>stateCode : <%= cashbillInfo.getStateCode()%></li>
						<li>stateDT : <%= cashbillInfo.getStateDT()%></li>
						<li>printYN : <%= cashbillInfo.isPrintYN()%></li>
						<li>confirmNum : <%= cashbillInfo.getConfirmNum()%></li>
						<li>orgTradeDate : <%= cashbillInfo.getOrgTradeDate()%></li>
						<li>orgConfirmNum : <%= cashbillInfo.getOrgConfirmNum()%></li>
						<li>ntssendDT : <%= cashbillInfo.getNtssendDT()%></li>
						<li>ntsresult : <%= cashbillInfo.getNtsresult()%></li>
						<li>ntsresultDT : <%= cashbillInfo.getNtsresultDT()%></li>
						<li>ntsresultCode : <%= cashbillInfo.getNtsresultCode()%></li>
						<li>ntsresultMessage : <%= cashbillInfo.getNtsresultMessage()%></li>
						<li>regDT : <%= cashbillInfo.getRegDT()%></li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>