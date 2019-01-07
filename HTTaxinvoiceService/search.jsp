<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTTaxinvoiceSearchResult"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /**
     * 전자세금계산서 매입/매출 내역의 수집 결과를 조회합니다.
     * - 응답항목에 관한 정보는 "[홈택스연동 (전자세금계산서계산서) API 연동매뉴얼] >
     *   3.2.1. Search(수집 결과 조회)" 을 참고하시기 바랍니다.
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 수집 요청시 발급받은 작업아이디
    String jobID = "017030710000000002";

    // 문서형태, N-일반, M-수정
    String[] Type = {"N", "M"};

    // 과세형태, T-과세, N-면세, Z-영세
    String[] TaxType = {"T", "Z", "N"};

    // 영수/청구 R-영수, C-청구, N-없음
    String[] PurposeType = {"R", "C", "N"};

    // 종사업장 유무, 공백-전체조회, 0-종사업장번호 없음, 1-종사업장번호 있음
    String TaxRegIDYN = "";

    // 종사업장 유형, S-공급자, B-공급받는자, T-수탁자
    String TaxRegIDType = "S";

    // 종사업장번호, 다수 기재시 콤마(",")로 구분하여 구성 ex) "0001,0002"
    String TaxRegID = "";

    // 페이지 번호
    int Page = 1;

    // 페이지당 목록개수
    int PerPage = 10;

    // 정렬발향, A-오름차순, D-내림차순
    String Order = "D";

    HTTaxinvoiceSearchResult result = null;

    try {

        result = htTaxinvoiceService.search(testCorpNum, jobID, Type, TaxType, PurposeType,
                TaxRegIDYN, TaxRegIDType, TaxRegID, Page, PerPage, Order);

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
            <legend> 조회결과 </legend>
            <ul>
                <li>code (응답코드) : <%= result.getCode() %></li>
                <li>message (응답메시지) : <%= result.getMessage() %></li>
                <li>total (총 검색결과 건수) : <%= result.getTotal() %></li>
                <li>perPage (페이지당 검색개수) : <%= result.getPerPage() %></li>
                <li>pageNum (페이지 번호) : <%= result.getPageNum() %></li>
                <li>pageCount (페이지 개수) : <%= result.getPageCount() %></li>
            </ul>
            <%
                if ( result != null ){
                    for(int i=0; i < result.getList().size(); i++){
            %>
            <fieldset class="fieldset2">
                <legend> 전자(세금)계산서 정보 [ <%=(i+1) %> ] </legend>
                <ul>
                    <li>ntsconfirmNum (국세청 승인번호) <%= result.getList().get(i).getNtsconfirmNum() %></li>
                    <li>writeDate (작성일자) : <%= result.getList().get(i).getWriteDate()  %> </li>
                    <li>issueDate (발행일자) : <%= result.getList().get(i).getIssueDate()  %> </li>
                    <li>sendDate (전송일자) : <%= result.getList().get(i).getSendDate()  %> </li>
                    <li>invoiceType (구분) : <%= result.getList().get(i).getInvoiceType()  %> </li>

                    <li>taxType (과세형태) : <%= result.getList().get(i).getTaxType()  %> </li>
                    <li>purposeType (영수/청구) : <%= result.getList().get(i).getPurposeType()  %> </li>
                    <li>supplyCostTotal (공급가액 합계) : <%= result.getList().get(i).getSupplyCostTotal()  %> </li>
                    <li>taxTotal (세액 합계) : <%= result.getList().get(i).getTaxTotal()  %> </li>
                    <li>totalAmount (합계금액) : <%= result.getList().get(i).getTotalAmount()  %> </li>
                    <li>remark1 (비고) : <%= result.getList().get(i).getRemark1()  %> </li>

                    <li>modifyYN (수정 전자세금계산서 여부) : <%= result.getList().get(i).getModifyYN()  %> </li>
                    <li>orgNTSConfirmNum (원본 전자세금계산서 국세청 승인번호) : <%= result.getList().get(i).getOrgNTSConfirmNum()  %> </li>
                    <li>purchaseDate (거래일자) : <%= result.getList().get(i).getPurchaseDate()  %> </li>
                    <li>itemName (품명) : <%= result.getList().get(i).getItemName()  %> </li>
                    <li>spec (규격) : <%= result.getList().get(i).getSpec()  %> </li>
                    <li>qty (수량) : <%= result.getList().get(i).getQty()  %> </li>
                    <li>unitCost (단가) : <%= result.getList().get(i).getUnitCost()  %> </li>
                    <li>supplyCost (공급가액) : <%= result.getList().get(i).getSupplyCost()  %> </li>
                    <li>tax (세액) : <%= result.getList().get(i).getTax()  %> </li>
                    <li>remark (비고) : <%= result.getList().get(i).getRemark()  %> </li>

                    <li>invoicerCorpNum (공급자 사업자번호) : <%= result.getList().get(i).getInvoicerCorpNum()  %> </li>
                    <li>invoicerTaxRegID (공급자 종사업장번호) : <%= result.getList().get(i).getInvoicerTaxRegID()  %> </li>
                    <li>invoicerCorpName (공급자 상호) : <%= result.getList().get(i).getInvoicerCorpName()  %> </li>
                    <li>invoicerCEOName (공급자 대표자 성명) : <%= result.getList().get(i).getInvoicerCEOName()  %> </li>
                    <li>invoicerEmail (공급자 이메일) : <%= result.getList().get(i).getInvoicerEmail()  %> </li>

                    <li>invoiceeCorpNum (공급받는자 사업자번호) : <%= result.getList().get(i).getInvoiceeCorpNum()  %> </li>
                    <li>invoiceeType (공급받는자 구분) : <%= result.getList().get(i).getInvoiceeType()  %> </li>
                    <li>invoiceeTaxRegID (공급받는자 종사업장번호) : <%= result.getList().get(i).getInvoiceeTaxRegID()  %> </li>
                    <li>invoiceeCorpName (공급받는자 상호) : <%= result.getList().get(i).getInvoiceeCorpName()  %> </li>
                    <li>invoiceeCEOName (공급받는자 대표자성명) : <%= result.getList().get(i).getInvoiceeCEOName()  %> </li>
                    <li>invoiceeEmail1 (공급받는자 이메일) : <%= result.getList().get(i).getInvoiceeEmail1()  %> </li>

                    <li>trusteeCorpNum (수탁자 사업자번호) : <%= result.getList().get(i).getTrusteeCorpNum()  %> </li>
                    <li>trusteeTaxRegID (수탁자 종사업장번호) : <%= result.getList().get(i).getTrusteeTaxRegID()  %> </li>
                    <li>trusteeCorpName (수탁자 상호) : <%= result.getList().get(i).getTrusteeCorpName()  %> </li>
                    <li>tursteeCEOName (수탁자 대표자 성명) : <%= result.getList().get(i).getTrusteeCEOName()  %> </li>
                    <li>trusteeEmail (수탁자 이메일) : <%= result.getList().get(i).getTrusteeEmail()  %> </li>
                </ul>
            </fieldset>
            <%
                    }
                }
            %>

        </fieldset>
    </div>
    </body>
</html>
