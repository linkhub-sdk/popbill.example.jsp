<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
	/**
  * 현금영수증 1건의 상세정보를 조회합니다.
  * - 응답항목에 대한 자세한 사항은 "[현금영수증 API 연동매뉴얼] > 4.1.현금영수증 구성" 을
  *   참조하시기 바랍니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 현금영수증 문서관리번호
	String mgtKey = "20161130-01";

	Cashbill cashbill = null;

	try {

		cashbill = cashbillService.getDetailInfo(testCorpNum, mgtKey);

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
				<legend>현금영수증 상세정보 조회</legend>
				<fieldset class="fieldset2">
					<legend>Cashbill</legend>
					<ul>
						<li>mgtKey : <%=cashbill.getMgtKey() %></li>
						<li>tradeDate : <%=cashbill.getTradeDate() %></li>
						<li>tradeUsage : <%=cashbill.getTradeUsage() %></li>
						<li>tradeType : <%=cashbill.getTradeType() %></li>

						<li>taxationType : <%=cashbill.getTaxationType() %></li>
						<li>supplyCost : <%=cashbill.getSupplyCost() %></li>
						<li>tax : <%=cashbill.getTax() %></li>
						<li>serviceFee : <%=cashbill.getServiceFee() %></li>
						<li>totalAmount : <%=cashbill.getTotalAmount() %></li>

						<li>franchiseCorpNum : <%=cashbill.getFranchiseCorpNum() %></li>
						<li>franchiseCorpName : <%=cashbill.getFranchiseCorpName() %></li>
						<li>franchiseCEOName : <%=cashbill.getFranchiseCEOName() %></li>
						<li>franchiseAddr : <%=cashbill.getFranchiseAddr() %></li>
						<li>franchiseTEL : <%=cashbill.getFranchiseTEL() %></li>

						<li>identityNum : <%=cashbill.getIdentityNum() %></li>
						<li>customerName : <%=cashbill.getCustomerName() %></li>
						<li>itemName : <%=cashbill.getItemName() %></li>
						<li>orderNumber : <%=cashbill.getOrderNumber() %></li>

						<li>email : <%=cashbill.getEmail() %></li>
						<li>hp : <%=cashbill.getHp() %></li>
						<li>fax : <%=cashbill.getFax() %></li>
						<li>faxsendYN : <%=cashbill.isFaxsendYN() %></li>
						<li>smssendYN : <%=cashbill.isSmssendYN() %></li>

						<li>confirmNum : <%=cashbill.getConfirmNum() %></li>
						<li>orgConfirmNum : <%=cashbill.getOrgConfirmNum() %></li>
					</ul>
			</fieldset>
		</fieldset>
	 </div>
</body>
</html>
