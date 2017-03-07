<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
	/*
  * 전자명세서 1건의 상세정보를 조회합니다.
  * - 응답항목에 대한 자세한 사항은 "[전자명세서 API 연동매뉴얼] > 4.1. 전자명세서 구성" 을
  *   참조하시기 바랍니다.
	*/

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

  // 전자명세서 문서관리번호
	String mgtKey = "20170307-01";

	Statement statement = null;

	try {

		statement = statementService.getDetailInfo(testCorpNum, itemCode, mgtKey);

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
				<legend>전자명세서 조회 결과</legend>
				<fieldset class="fieldset2">
					<legend>StatementInfo</legend>
					<ul>
						<li>itemCode : <%= statement.getItemCode()%></li>
						<li>mgtKey : <%= statement.getMgtKey()%></li>
						<li>formCode : <%= statement.getFormCode()%></li>
						<li>writeDate : <%= statement.getWriteDate()%></li>
						<li>taxType : <%= statement.getTaxType()%></li>

						<li>senderCorpNum : <%= statement.getSenderCorpNum()%></li>
						<li>senderTaxRegID : <%= statement.getSenderTaxRegID()%></li>
						<li>senderCorpName : <%= statement.getSenderCorpName()%></li>
						<li>senderCEOName : <%= statement.getSenderCEOName()%></li>
						<li>senderAddr : <%= statement.getSenderAddr()%></li>
						<li>senderBizClass : <%= statement.getSenderBizClass()%></li>
						<li>senderBizType : <%= statement.getSenderBizType()%></li>
						<li>senderContactName : <%= statement.getSenderContactName()%></li>
						<li>senderDeptName : <%= statement.getSenderDeptName()%></li>
						<li>senderTEL : <%= statement.getSenderTEL()%></li>
						<li>senderHP : <%= statement.getSenderHP()%></li>
						<li>senderEmail : <%= statement.getSenderEmail()%></li>
						<li>senderFAX : <%= statement.getSenderFAX()%></li>

						<li>receiverCorpNum : <%= statement.getReceiverCorpNum()%></li>
						<li>receiverTaxRegID : <%= statement.getReceiverTaxRegID()%></li>
						<li>receiverCorpName : <%= statement.getReceiverCorpName()%></li>
						<li>receiverCEOName : <%= statement.getReceiverCEOName()%></li>
						<li>receiverAddr : <%= statement.getReceiverAddr()%></li>
						<li>receiverBizClass : <%= statement.getReceiverBizClass()%></li>
						<li>receiverBizType : <%= statement.getReceiverBizType()%></li>
						<li>receiverContactName : <%= statement.getReceiverContactName()%></li>
						<li>receiverDeptName : <%= statement.getReceiverDeptName()%></li>
						<li>receiverTEL : <%= statement.getReceiverTEL()%></li>
						<li>receiverHP : <%= statement.getReceiverHP()%></li>
						<li>receiverEmail : <%= statement.getReceiverEmail()%></li>
						<li>receiverFAX : <%= statement.getReceiverFAX()%></li>

						<li>taxTotal : <%= statement.getTaxTotal()%></li>
						<li>supplyCostTotal : <%= statement.getSupplyCostTotal()%></li>
						<li>totalAmount : <%= statement.getTotalAmount()%></li>
						<li>purposeType : <%= statement.getPurposeType()%></li>
						<li>serialNum : <%= statement.getSerialNum()%></li>
						<li>remark1 : <%= statement.getRemark1()%></li>
						<li>remark2 : <%= statement.getRemark2()%></li>
						<li>remark3 : <%= statement.getRemark3()%></li>

						<li>businessLicenseYN : <%= statement.getBusinessLicenseYN()%></li>
						<li>bankBookYN : <%= statement.getBankBookYN()%></li>
						<li>smssendYN : <%= statement.getSmssendYN()%></li>
						<li>autoacceptYN : <%= statement.getAutoacceptYN()%></li>

						<fieldset class="fieldset3">
						<legend>detailList</legend>

						<%

							if(statement.getDetailList() != null){
								for(int i=0; i<statement.getDetailList().size(); i++){
									StatementDetail detail = statement.getDetailList().get(i);
						%>

							<legend>SerialNum :  <%= detail.getSerialNum() %> </legend>
								<ul>
									<li>purchaseDT : <%= detail.getPurchaseDT() %> </li>
									<li>itemName : <%=detail.getItemName() %></li>
									<li>spec : <%=detail.getSpec() %></li>
									<li>qty : <%=detail.getQty() %></li>
									<li>unitCost : <%=detail.getUnitCost() %></li>
									<li>supplyCost : <%=detail.getSupplyCost() %></li>
									<li>tax : <%=detail.getTax() %></li>
									<li>remark : <%=detail.getRemark() %></li>
								</ul>

						<%
								}
							}
						%>
						</fieldset>

						<fieldset class="fieldset3">
							<legend>propertyBag</legend>
							<ul>
							<%
								if ( statement.getPropertyBag() != null ) {
									for(String key : statement.getPropertyBag().keySet()) {
							%>
									<li><%=key%> : <%=statement.getPropertyBag().get(key)%></li>
							<%
									}
								}
							%>
							</ul>

						</fieldset>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
