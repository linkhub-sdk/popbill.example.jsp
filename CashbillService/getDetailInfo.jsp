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
	String mgtKey = "20170316-02";

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
						<li>mgtKey (문서관리번호) : <%=cashbill.getMgtKey() %></li>
						<li>tradeDate (거래일자) : <%=cashbill.getTradeDate() %></li>
						<li>tradeUsage (거래유형) : <%=cashbill.getTradeUsage() %></li>
						<li>tradeType (현금영수증 형태) : <%=cashbill.getTradeType() %></li>
            <li>confirmNum (국세청승인번호) : <%=cashbill.getConfirmNum() %></li>
						<li>orgConfirmNum (원본 현금영수증 국세청승인번호) : <%=cashbill.getOrgConfirmNum() %></li>

						<li>taxationType (과세형태) : <%=cashbill.getTaxationType() %></li>
						<li>supplyCost (공급가액) : <%=cashbill.getSupplyCost() %></li>
						<li>tax (세액) : <%=cashbill.getTax() %></li>
						<li>serviceFee (봉사료) : <%=cashbill.getServiceFee() %></li>
						<li>totalAmount (거래금액) : <%=cashbill.getTotalAmount() %></li>

						<li>franchiseCorpNum (발행자 사업자번호) : <%=cashbill.getFranchiseCorpNum() %></li>
						<li>franchiseCorpName (발행자 상호) : <%=cashbill.getFranchiseCorpName() %></li>
						<li>franchiseCEOName (발행자 대표자 성명) : <%=cashbill.getFranchiseCEOName() %></li>
						<li>franchiseAddr (발행자 주소) : <%=cashbill.getFranchiseAddr() %></li>
						<li>franchiseTEL (발행자 연락처) : <%=cashbill.getFranchiseTEL() %></li>

						<li>identityNum (거래처 식별번호) : <%=cashbill.getIdentityNum() %></li>
						<li>customerName (고객명) : <%=cashbill.getCustomerName() %></li>
						<li>itemName (상품명) : <%=cashbill.getItemName() %></li>
						<li>orderNumber (가맹점 주문번호) : <%=cashbill.getOrderNumber() %></li>
						<li>email (고객 이메일) : <%=cashbill.getEmail() %></li>
						<li>hp (고객 휴대폰번호) : <%=cashbill.getHp() %></li>
						<li>smssendYN (알림문자 전송여부) : <%=cashbill.isSmssendYN() %></li>
					</ul>
			</fieldset>
		</fieldset>
	 </div>
</body>
</html>
