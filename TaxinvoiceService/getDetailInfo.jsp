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
    /*
     * 세금계산서 1건의 상세정보를 확인합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/info#GetDetailInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문서번호 유형 (SELL-매출, BUY-매입, TRUSTEE-위수탁)
    MgtKeyType keyType = MgtKeyType.SELL;

    // 파트너가 할당한 문서번호
    String mgtKey = "20250711-JSP002";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Taxinvoice taxinvoice = null;

    try {

        taxinvoice = taxinvoiceService.getDetailInfo(CorpNum, keyType, mgtKey, UserID);

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
            <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>ntsconfirmNum (국세청승인번호) : <%=taxinvoice.getNTSConfirmNum() %></li>
                    <li>issueType (발행형태) : <%=taxinvoice.getIssueType() %></li>
                    <li>taxType (과세형태) : <%=taxinvoice.getTaxType() %></li>
                    <li>chargeDirection (과금방향) : <%=taxinvoice.getChargeDirection() %></li>
                    <li>serialNum (일련번호) : <%=taxinvoice.getSerialNum() %></li>
                    <li>kwon (책번호 "권" 항목) : <%=taxinvoice.getKwon() %></li>
                    <li>ho (책번호 "호" 항목)  : <%=taxinvoice.getHo() %></li>
                    <li>writeDate (작성일자) : <%=taxinvoice.getWriteDate() %></li>
                    <li>purposeType (영수/청구) : <%=taxinvoice.getPurposeType() %></li>
                    <li>supplyCostTotal (공급가액 합계) : <%=taxinvoice.getSupplyCostTotal() %></li>
                    <li>taxTotal (세액 합계) : <%=taxinvoice.getTaxTotal() %></li>
                    <li>totalAmount (합계금액) : <%=taxinvoice.getTotalAmount() %></li>
                    <li>cash (현금) : <%=taxinvoice.getCash() %></li>
                    <li>chkBill (수표) : <%=taxinvoice.getChkBill() %></li>
                    <li>credit (외상) : <%=taxinvoice.getCredit() %></li>
                    <li>note (어음) : <%=taxinvoice.getNote() %></li>
                    <li>remark1 (비고1) : <%=taxinvoice.getRemark1() %></li>
                    <li>remark2 (비고2) : <%=taxinvoice.getRemark2() %></li>
                    <li>remark3 (비고3) : <%=taxinvoice.getRemark3() %></li>

                    <li>invoicerMgtKey (공급자 문서번호) : <%=taxinvoice.getInvoicerMgtKey() %></li>
                    <li>invoicerCorpNum (공급자 사업자번호) : <%=taxinvoice.getInvoicerCorpNum() %></li>
                    <li>invoicerCorpName (공급자 상호) : <%=taxinvoice.getInvoicerCorpName() %></li>
                    <li>invoicerTaxRegID (공급자 종사업장 식별번호) : <%=taxinvoice.getInvoicerTaxRegID() %></li>
                    <li>invoicerCEOName (공급자 대표자 성명) : <%=taxinvoice.getInvoicerCEOName() %></li>
                    <li>invoicerAddr (공급자 주소) : <%=taxinvoice.getInvoicerAddr() %></li>
                    <li>invoicerBizType (공급자 업태)<%=taxinvoice.getInvoicerBizType() %></li>
                    <li>invoicerBizClass (공급자 종목)<%=taxinvoice.getInvoicerBizClass() %></li>
                    <li>invoicerContactName (공급자 담당자 성명) : <%=taxinvoice.getInvoicerContactName() %></li>
                    <li>invoicerDeptName (공급자 담당자 부서명)<%=taxinvoice.getInvoicerDeptName() %></li>
                    <li>invoicerTEL (공급자 담당자 연락처) : <%=taxinvoice.getInvoicerTEL() %></li>
                    <li>invoicerHP (공급자 담당자 휴대폰) : <%=taxinvoice.getInvoicerHP() %></li>
                    <li>invoicerEmail (공급자 담당자 메일) : <%=taxinvoice.getInvoicerEmail() %></li>
                    <li>invoicerSMSSendYN (공급자 알림문자 전송 여부) : <%=taxinvoice.getInvoicerSMSSendYN() %></li>

                    <li>invoiceeMgtKey (공급받는자 문서번호) : <%=taxinvoice.getInvoiceeMgtKey() %></li>
                    <li>invoiceeType (공급받는자 유형) : <%=taxinvoice.getInvoiceeType() %></li>
                    <li>invoiceeCorpNum (공급받는자 등록번호) : <%=taxinvoice.getInvoiceeCorpNum() %></li>
                    <li>invoiceeTaxRegID (공급받는자 종사업장 식별번호) : <%=taxinvoice.getInvoiceeTaxRegID() %></li>
                    <li>invoiceeCorpName (공급받는자 상호) : <%=taxinvoice.getInvoiceeCorpName() %></li>
                    <li>invoiceeCEOName (공급받는자 대표자 성명) : <%=taxinvoice.getInvoiceeCEOName() %></li>
                    <li>invoiceeAddr (공급받는자 주소) : <%=taxinvoice.getInvoiceeAddr() %></li>
                    <li>invoiceeBizType (공급받는자 업태)<%=taxinvoice.getInvoiceeBizType() %></li>
                    <li>invoiceeBizClass (공급받는자 종목)<%=taxinvoice.getInvoiceeBizClass() %></li>
                    <li>closeDownState (공급받는자 휴폐업상태) : <%=taxinvoice.getCloseDownState() %></li>
                    <li>closeDownStateDate (공급받는자 휴폐업일자) : <%=taxinvoice.getCloseDownStateDate() %></li>
                    <li>invoiceeContactName1 (공급받는자 담당자 성명) : <%=taxinvoice.getInvoiceeContactName1() %></li>
                    <li>invoiceeDeptName1 (공급받는자 담당자 부서명)<%=taxinvoice.getInvoiceeDeptName1() %></li>
                    <li>invoiceeTEL1 (공급받는자 담당자 연락처) : <%=taxinvoice.getInvoiceeTEL1() %></li>
                    <li>invoiceeHP1 (공급받는자 담당자 휴대폰) : <%=taxinvoice.getInvoiceeHP1() %></li>
                    <li>invoiceeEmail1 (공급받는자 담당자 메일) : <%=taxinvoice.getInvoiceeEmail1() %></li>
                    <li>invoiceeSMSSendYN (공급받는자 알림문자 전송 여부) : <%=taxinvoice.getInvoiceeSMSSendYN() %></li>

                    <li>trusteeMgtKey (수탁자 문서번호) : <%=taxinvoice.getTrusteeMgtKey() %></li>
                    <li>trusteeCorpNum (수탁자 사업자번호) : <%=taxinvoice.getTrusteeCorpNum() %></li>
                    <li>trusteeTaxRegID (수탁자 종사업장 식별번호) : <%=taxinvoice.getTrusteeTaxRegID() %></li>
                    <li>trusteeCorpName (수탁자 상호) : <%=taxinvoice.getTrusteeCorpName() %></li>
                    <li>trusteeCEOName (수탁자 대표자 성명) : <%=taxinvoice.getTrusteeCEOName() %></li>
                    <li>trusteeAddr (수탁자 주소) : <%=taxinvoice.getTrusteeAddr() %></li>
                    <li>trusteeBizType (수탁자 업태)<%=taxinvoice.getTrusteeBizType() %></li>
                    <li>trusteeBizClass (수탁자 종목)<%=taxinvoice.getTrusteeBizClass() %></li>
                    <li>trusteeContactName (수탁자 담당자 성명) : <%=taxinvoice.getTrusteeContactName() %></li>
                    <li>trusteeDeptName (수탁자 담당자 부서명)<%=taxinvoice.getTrusteeDeptName() %></li>
                    <li>trusteeTEL (수탁자 담당자 연락처) : <%=taxinvoice.getTrusteeTEL() %></li>
                    <li>trusteeHP (수탁자 담당자 휴대폰) : <%=taxinvoice.getTrusteeHP() %></li>
                    <li>trusteeEmail (수탁자 담당자 메일) : <%=taxinvoice.getTrusteeEmail() %></li>
                    <li>trusteeSMSSendYN (수탁자 알림문자 전송 여부) : <%=taxinvoice.getTrusteeSMSSendYN() %></li>

                    <li>modifyCode (수정 사유코드) : <%=taxinvoice.getModifyCode() %></li>
                    <li>orgNTSConfirmNum (당초 국세청승인번호) : <%=taxinvoice.getOrgNTSConfirmNum() %></li>
                    <li>businessLicenseYN (팝빌에 등록된 사업자등록증 첨부 여부) : <%=taxinvoice.getBusinessLicenseYN() %></li>
                    <li>bankBookYN (팝빌에 등록된 통장사본 첨부 여부) : <%=taxinvoice.getBankBookYN() %></li>
                    <%
                        if(taxinvoice.getDetailList() != null ){
                            for(int i=0; i<taxinvoice.getDetailList().size(); i++){
                                TaxinvoiceDetail detail = taxinvoice.getDetailList().get(i);
                    %>
                    <fieldset class="fieldset2">
                        <legend>품목 상세정보</legend>
                        <ul>
                            <li>SerialNum (일련번호) :  <%= detail.getSerialNum() %> </li>
                            <li>purchaseDT (거래일자) : <%= detail.getPurchaseDT() %> </li>
                            <li>itemName (품명) : <%=detail.getItemName() %></li>
                            <li>spec (규격) : <%=detail.getSpec() %></li>
                            <li>qty (수량) : <%=detail.getQty() %></li>
                            <li>unitCost (단가) : <%=detail.getUnitCost() %></li>
                            <li>supplyCost (공급가액) : <%=detail.getSupplyCost() %></li>
                            <li>tax (세액) : <%=detail.getTax() %></li>
                            <li>remark (비고) : <%=detail.getRemark() %></li>
                        </ul>
                    </fieldset>
                    <%
                            }
                        }
                    %>

                    <%
                        if ( taxinvoice.getAddContactList() != null ) {
                            for ( int i = 0; i < taxinvoice.getAddContactList().size(); i++ ) {
                                TaxinvoiceAddContact addContactList = taxinvoice.getAddContactList().get(i);
                    %>
                    <fieldset class="fieldset2">
                        <legend>공급받는자 추가담당자 정보</legend>
                        <ul>
                            <li>SerialNum (일련번호) :  <%= addContactList.getSerialNum() %> </li>
                            <li>contactName (담당자 성명) : <%= addContactList.getContactName() %> </li>
                            <li>email (메일) : <%=addContactList.getEmail() %></li>
                        </ul>
                    </fieldset>
                    <%
                            }
                        }
                    %>

                </ul>
        </fieldset>
    </div>
</body>
</html>
