<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTTaxinvoice" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 국세청승인번호를 통해 수집한 전자세금계산서 1건의 상세정보를 반환합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/search#GetTaxinvoice
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 전자세금계산서 국세청승인번호
    String ntsConfirmNum = "202202188888888800000109";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    HTTaxinvoice taxinvoiceInfo = null;

    try {

        taxinvoiceInfo = htTaxinvoiceService.getTaxinvoice(testCorpNum, ntsConfirmNum, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
        <p class="heading1">Response </p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>writeDate (작성일자) : <%=taxinvoiceInfo.getWriteDate() %> </li>
                    <li>issueDT (발행일시) : <%=taxinvoiceInfo.getIssueDT() %> </li>
                    <li>invoiceType (전자세금계산서 종류) : <%=taxinvoiceInfo.getInvoiceType() %> </li>
                    <li>taxType (과세형태) : <%=taxinvoiceInfo.getTaxType() %> </li>
                    <li>taxTotal (세액합계) : <%=taxinvoiceInfo.getTaxTotal() %> </li>
                    <li>supplyCostTotal (공갑가액 합계) : <%=taxinvoiceInfo.getSupplyCostTotal() %> </li>
                    <li>totalAmount (합계금액) : <%=taxinvoiceInfo.getTotalAmount() %> </li>
                    <li>purposeTpye (영수/청구) : <%=taxinvoiceInfo.getPurposeType() %> </li>
                    <li>serialNum (일련번호) : <%=taxinvoiceInfo.getSerialNum() %> </li>
                    <li>cash (현금) : <%=taxinvoiceInfo.getCash() %> </li>
                    <li>chkBill (수표) : <%=taxinvoiceInfo.getChkBill() %> </li>
                    <li>credit (외상) : <%=taxinvoiceInfo.getCredit() %> </li>
                    <li>note (어음) : <%=taxinvoiceInfo.getNote() %> </li>
                    <li>remark1 (비고1) : <%=taxinvoiceInfo.getRemark1() %> </li>
                    <li>remark2 (비고2) : <%=taxinvoiceInfo.getRemark2() %> </li>
                    <li>remark3 (비고3) : <%=taxinvoiceInfo.getRemark3() %> </li>
                    <li>ntsconfirmNum (국세청승인번호) : <%=taxinvoiceInfo.getNtsconfirmNum() %> </li>

                    <li>invoicerCorpNum (공급자 사업자번호) : <%=taxinvoiceInfo.getInvoicerCorpNum() %> </li>
                    <li>invoicerMgtKey (공급자 문서번호) : <%=taxinvoiceInfo.getInvoicerMgtKey() %> </li>
                    <li>invoicerTaxRegID (공급자 종사업장 식별번호) : <%=taxinvoiceInfo.getInvoicerTaxRegID() %> </li>
                    <li>invoicerCorpName (공급자 상호) : <%=taxinvoiceInfo.getInvoicerCorpName() %> </li>
                    <li>invoicerCEOName (공급자 대표자 성명) : <%=taxinvoiceInfo.getInvoicerCEOName() %> </li>
                    <li>invoicerAddr (공급자 주소) : <%=taxinvoiceInfo.getInvoicerAddr() %> </li>
                    <li>invoicerBizType (공급자 업태) : <%=taxinvoiceInfo.getInvoicerBizType() %> </li>
                    <li>invoicerContactName (공급자 담당자 성명) : <%=taxinvoiceInfo.getInvoicerContactName() %> </li>
                    <li>invoicerTEL (공급자 담당자 연락처) : <%=taxinvoiceInfo.getInvoicerTEL() %> </li>
                    <li>invoicerEmail (공급자 담당자 메일) : <%=taxinvoiceInfo.getInvoicerEmail() %> </li>

                    <li>invoiceeCorpNum (공급받는자 등록번호) : <%=taxinvoiceInfo.getInvoiceeCorpNum() %> </li>
                    <li>invoiceeType (공급받는자 유형) : <%=taxinvoiceInfo.getInvoiceeType() %> </li>
                    <li>invoiceeMgtKey (공급받는자 문서번호) : <%=taxinvoiceInfo.getInvoiceeMgtKey() %> </li>
                    <li>invoiceeTaxRegID (공급받는자 종사업장 식별번호) : <%=taxinvoiceInfo.getInvoiceeTaxRegID() %> </li>
                    <li>invoiceeCorpName (공급받는자 상호) : <%=taxinvoiceInfo.getInvoiceeCorpName() %> </li>
                    <li>invoiceeCEOName (공급받는자 대표자 성명) : <%=taxinvoiceInfo.getInvoiceeCEOName() %> </li>
                    <li>invoiceeAddr (공급받는자 주소) : <%=taxinvoiceInfo.getInvoiceeAddr() %> </li>
                    <li>invoiceeBizType (공급받는자 업태) : <%=taxinvoiceInfo.getInvoiceeBizType() %> </li>
                    <li>invoiceeBizClass (공급받는자 종목) : <%=taxinvoiceInfo.getInvoiceeBizClass() %> </li>
                    <li>invoiceeContactName1 (공급받는자 담당자 성명) : <%=taxinvoiceInfo.getInvoiceeContactName1() %> </li>
                    <li>invoiceeTEL1 (공급받는자 담당자 연락처) : <%=taxinvoiceInfo.getInvoiceeTEL1() %> </li>
                    <li>invoiceeEmail1 (공급받는자 담당자 메일) : <%=taxinvoiceInfo.getInvoiceeEmail1() %> </li>

                    <li>trusteeCorpNum (수탁자 사업자번호) : <%=taxinvoiceInfo.getTrusteeCorpNum() %> </li>
                    <li>trusteeMgtKey (수탁자 문서번호) : <%=taxinvoiceInfo.getTrusteeMgtKey() %> </li>
                    <li>trusteeTaxRegID (수탁자 종사업장 식별번호) : <%=taxinvoiceInfo.getTrusteeTaxRegID() %> </li>
                    <li>trusteeCorpName (수탁자 상호) : <%=taxinvoiceInfo.getTrusteeCorpName() %> </li>
                    <li>trusteeCEOName (수탁자 대표자 성명) : <%=taxinvoiceInfo.getTrusteeCEOName() %> </li>
                    <li>trusteeAddr (수탁자 주소) : <%=taxinvoiceInfo.getTrusteeAddr() %> </li>
                    <li>trusteeBizType (수탁자 업태) : <%=taxinvoiceInfo.getTrusteeBizType() %> </li>
                    <li>trusteeBizClass (수탁자 종목) : <%=taxinvoiceInfo.getTrusteeBizClass() %> </li>
                    <li>trusteeContactName (수탁자 담당자 성명) : <%=taxinvoiceInfo.getTrusteeContactName() %> </li>
                    <li>trusteeDeptName (수탁자 담당자 부서명) : <%=taxinvoiceInfo.getTrusteeDeptName() %> </li>
                    <li>trusteeTEL (수탁자 담당자 연락처) : <%=taxinvoiceInfo.getTrusteeTEL() %> </li>
                    <li>trusteeEmail (수탁자 담당자 메일) : <%=taxinvoiceInfo.getTrusteeEmail() %> </li>

                    <li>modifyCode (수정 사유코드) : <%=taxinvoiceInfo.getModifyCode() %> </li>
                    <fieldset class ="fieldset2">
                        <legend> 품목정보</legend>
                        <%
                            if ( taxinvoiceInfo != null ){
                                for(int i=0; i < taxinvoiceInfo.getDetailList().size(); i++){
                        %>
                        <ul>
                            <li>serialNum (일련번호) : <%=taxinvoiceInfo.getDetailList().get(i).getSerialNum() %> </li>
                            <li>purchaseDT (구매일자) : <%=taxinvoiceInfo.getDetailList().get(i).getPurchaseDT() %> </li>
                            <li>itemName (품명) : <%=taxinvoiceInfo.getDetailList().get(i).getItemName() %> </li>
                            <li>spec (규격) : <%=taxinvoiceInfo.getDetailList().get(i).getSpec() %> </li>
                            <li>qty (수량) : <%=taxinvoiceInfo.getDetailList().get(i).getQty() %> </li>
                            <li>unitCost (단가) : <%=taxinvoiceInfo.getDetailList().get(i).getUnitCost() %> </li>
                            <li>supplyCost (공급가액) : <%=taxinvoiceInfo.getDetailList().get(i).getSupplyCost() %> </li>
                            <li>tax (세액) : <%=taxinvoiceInfo.getDetailList().get(i).getTax() %> </li>
                            <li>remark (비고) : <%=taxinvoiceInfo.getDetailList().get(i).getRemark() %> </li>
                        </ul>
                        <%
                                }
                            }
                        %>
                    </fieldset>
                </ul>

            </fieldset>
        </div>
    </body>
</html>
