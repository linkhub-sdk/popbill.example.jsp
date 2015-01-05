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
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%
	String testCorpNum = "1231212312";			// 회원 사업자번호
	MgtKeyType keyType = MgtKeyType.SELL;		// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	String mgtKey = "20141230-01";				// 세금계산서 연동관리번호

	Taxinvoice taxinvoice = null;

	try {

		taxinvoice = taxinvoiceService.getDetailInfo(testCorpNum, keyType, mgtKey);

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
				<legend>세금계산서 조회 결과</legend>
				<fieldset class="fieldset2">
					<legend>Taxinvoice</legend>
					<ul>
						<li>writeDate : <%=taxinvoice.getWriteDate() %></li>
						<li>chargeDirection : <%=taxinvoice.getChargeDirection() %></li>
						<li>issueType : <%=taxinvoice.getIssueType() %></li>
						<li>issueTiming : <%=taxinvoice.getIssueTiming() %></li>
						<li>taxType : <%=taxinvoice.getTaxType() %></li>
						
						<li>invoicerCorpNum : <%=taxinvoice.getInvoicerCorpNum() %></li>
						<li>invoicerCorpName : <%=taxinvoice.getInvoicerCorpName() %></li>
						<li>invoicerMgtKey : <%=taxinvoice.getInvoicerMgtKey() %></li>
						<li>invoicerTaxRegID : <%=taxinvoice.getInvoicerTaxRegID() %></li>
						<li>invoicerCEOName : <%=taxinvoice.getInvoicerCEOName() %></li>
						<li>invoicerAddr : <%=taxinvoice.getInvoicerAddr() %></li>
						<li>invoicerBizClass : <%=taxinvoice.getInvoicerBizClass() %></li>
						<li>invoicerBizType : <%=taxinvoice.getInvoicerBizType() %></li>
						<li>invoicerContactName : <%=taxinvoice.getInvoicerContactName() %></li>
						<li>invoicerDeptName : <%=taxinvoice.getInvoicerDeptName() %></li>
						<li>invoicerTEL : <%=taxinvoice.getInvoicerTEL() %></li>
						<li>invoicerHP : <%=taxinvoice.getInvoicerHP() %></li>
						<li>invoicerEmail : <%=taxinvoice.getInvoicerEmail() %></li>
						<li>invoicerSMSSendYN : <%=taxinvoice.getInvoicerSMSSendYN() %></li>
						
						<li>invoiceeType : <%=taxinvoice.getInvoiceeType() %></li>
						<li>invoiceeCorpNum : <%=taxinvoice.getInvoiceeCorpNum() %></li>
						<li>invoiceeMgtKey : <%=taxinvoice.getInvoiceeMgtKey() %></li>
						<li>invoiceeTaxRegID : <%=taxinvoice.getInvoiceeTaxRegID() %></li>
						<li>invoiceeCorpName : <%=taxinvoice.getInvoiceeCorpName() %></li>
						<li>invoiceeCEOName : <%=taxinvoice.getInvoiceeCEOName() %></li>
						<li>invoiceeAddr : <%=taxinvoice.getInvoiceeAddr() %></li>
						<li>invoiceeBizClass : <%=taxinvoice.getInvoiceeBizClass() %></li>
						<li>invoiceeBizType : <%=taxinvoice.getInvoiceeBizType() %></li>
						<li>invoiceeContactName1 : <%=taxinvoice.getInvoiceeContactName1() %></li>
						<li>invoiceeDeptName1 : <%=taxinvoice.getInvoiceeDeptName1() %></li>
						<li>invoiceeTEL1 : <%=taxinvoice.getInvoiceeTEL1() %></li>
						<li>invoiceeHP1 : <%=taxinvoice.getInvoiceeHP1() %></li>
						<li>invoiceeEmail1 : <%=taxinvoice.getInvoiceeEmail1() %></li>
						<li>invoiceeContactName2 : <%=taxinvoice.getInvoiceeContactName2() %></li>
						<li>invoiceeDeptName2 : <%=taxinvoice.getInvoiceeDeptName2() %></li>
						<li>invoiceeTEL2 : <%=taxinvoice.getInvoiceeTEL2() %></li>
						<li>invoiceeHP2 : <%=taxinvoice.getInvoiceeHP2() %></li>
						<li>invoiceeEmail2 : <%=taxinvoice.getInvoiceeEmail2() %></li>
						<li>invoiceeSMSSendYN : <%=taxinvoice.getInvoiceeSMSSendYN() %></li>
						
						<li>trusteeCorpNum : <%=taxinvoice.getTrusteeCorpNum() %></li>
						<li>trusteeCorpName : <%=taxinvoice.getTrusteeCorpName() %></li>
						<li>trusteeMgtKey : <%=taxinvoice.getTrusteeMgtKey() %></li>
						<li>trusteeTaxRegID : <%=taxinvoice.getTrusteeTaxRegID() %></li>
						<li>trusteeCEOName : <%=taxinvoice.getTrusteeCEOName() %></li>
						<li>trusteeAddr : <%=taxinvoice.getTrusteeAddr() %></li>
						<li>trusteeBizClass : <%=taxinvoice.getTrusteeBizClass() %></li>
						<li>trusteeBizType : <%=taxinvoice.getTrusteeBizType() %></li>
						<li>trusteeContactName : <%=taxinvoice.getTrusteeContactName() %></li>
						<li>trusteeDeptName : <%=taxinvoice.getTrusteeDeptName() %></li>
						<li>trusteeTEL : <%=taxinvoice.getTrusteeTEL() %></li>
						<li>trusteeHP : <%=taxinvoice.getTrusteeHP() %></li>
						<li>trusteeEmail : <%=taxinvoice.getTrusteeEmail() %></li>
						<li>trusteeSMSSendYN : <%=taxinvoice.getTrusteeSMSSendYN() %></li>
						
						<li>supplyCostTotal : <%=taxinvoice.getSupplyCostTotal() %></li>
						<li>taxTotal : <%=taxinvoice.getTaxTotal() %></li>
						<li>totalAmount : <%=taxinvoice.getTotalAmount() %></li>
						
						<li>modifyCode : <%=taxinvoice.getModifyCode() %></li>
						<li>orgNTSConfirmNum : <%=taxinvoice.getOrgNTSConfirmNum() %></li>
						<li>purposeType : <%=taxinvoice.getPurposeType() %></li>
						
						<li>serialNum : <%=taxinvoice.getSerialNum() %></li>
						<li>cash : <%=taxinvoice.getCash() %></li>
						<li>chkBill : <%=taxinvoice.getChkBill() %></li>
						<li>credit : <%=taxinvoice.getCredit() %></li>
						<li>note : <%=taxinvoice.getNote() %></li>
						
						<li>remark1 : <%=taxinvoice.getRemark1() %></li>
						<li>remark2 : <%=taxinvoice.getRemark2() %></li>
						<li>remark3 : <%=taxinvoice.getRemark3() %></li>
						
						<li>kwon : <%=taxinvoice.getKwon() %></li>
						<li>ho : <%=taxinvoice.getHo() %></li>
						
						<li>businessLicenseYN : <%=taxinvoice.getBusinessLicenseYN() %></li>
						<li>bankBookYN : <%=taxinvoice.getBankBookYN() %></li>
						<li>NTSConfirmNum : <%=taxinvoice.getNTSConfirmNum() %></li>
						<li>originalTaxinvoiceKey : <%=taxinvoice.getOriginalTaxinvoiceKey() %></li>


						<fieldset class="fieldset3">
						<legend>detailList</legend>

						<%
							
							if(taxinvoice.getDetailList() != null ){
								for(int i=0; i<taxinvoice.getDetailList().size(); i++){
									TaxinvoiceDetail detail = taxinvoice.getDetailList().get(i);				
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

						<%		}
							}	
						%>

				
						</fieldset>
						<fieldset class="fieldset3">
							<legend>addContactList</legend>

						<%
							
							if(taxinvoice.getAddContactList() != null ){
								for(int i=0; i<taxinvoice.getAddContactList().size(); i++){
									TaxinvoiceAddContact addContactList = taxinvoice.getAddContactList().get(i);				
						%>

						<legend>SerialNum :  <%= addContactList.getSerialNum() %> </legend>
						<ul>
							<li>contactName : <%= addContactList.getContactName() %> </li>
							<li>email : <%=addContactList.getEmail() %></li>

						</ul>

						<%		}
							}	
						%>
						</fieldset class="fieldset3">

					</ul>
				</fieldset>
				
				
			</fieldset>
		 </div>
	</body>
</html>