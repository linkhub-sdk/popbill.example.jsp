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
    /*
     * 홈택스에서 수집된 전자세금계산서 매입/매출 내역을 확인합니다.
     * - 38개 항목으로 구성된 내역 확인이 가능합니다.
     * - https://developers.popbill.com/reference/httaxinvoice/java/api/search#Search
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 작업아이디
    String jobID = "";

    // 세금계산서 문서형태 ("N" 와 "M" 중 선택, 다중 선택 가능)
    // └ N = 일반 , M = 수정
    // - 미입력 시 전체조회
    String[] Type = {"N", "M"};

    // 과세형태 ("T" , "N" , "Z" 중 선택, 다중 선택 가능)
    // └ T = 과세, N = 면세, Z = 영세
    // - 미입력 시 전체조회
    String[] TaxType = {"T", "Z", "N"};

    // 영수/청구 ("R" , "C", "N" 중 선택, 다중 선택 가능)
    // └ R = 영수, C = 청구, N = 없음
    // - 미입력 시 전체조회
    String[] PurposeType = {"R", "C", "N"};

    // 종사업장번호 유무 (null , "0" , "1" 중 택 1)
    // - null = 전체조회 , 0 = 없음, 1 = 있음
    String TaxRegIDYN = null;

    // 종사업장번호의 주체 ("S" , "B" , "T" 중 택 1)
    // - S = 공급자 , B = 공급받는자 , T = 수탁자
    String TaxRegIDType = "S";

    // 종사업장번호
    // - 다수기재 시 콤마(",")로 구분. ex) "0001,0002"
    // - 미입력 시 전체조회
    String TaxRegID = "";

    // 목록 페이지번호 (기본값 = 1)
    int Page = 1;

    // 페이지당 표시할 목록 건수 (기본값 = 500 , 최대 = 1000)
    int PerPage = 10;

    // 목록 정렬 방향
    // - 수집 요청(requestJob API) 함수 사용시 사용한 DType 값을 기준.
    // - D = 내림차순(기본값) , A = 오름차순
    String Order = "D";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 조회 검색어, 거래처 상호 / 사업자번호 (사업자) / 주민등록번호 (개인) / "9999999999999" (외국인) 중 검색하고자 하는 정보 입력
    // - 사업자번호 / 주민등록번호는 하이픈('-')을 제외한 숫자만 입력
    // - 미입력시 전체조회
    String searchString = "";

    HTTaxinvoiceSearchResult result = null;

    try {

        result = htTaxinvoiceService.search(CorpNum, jobID, Type, TaxType, PurposeType,
                TaxRegIDYN, TaxRegIDType, TaxRegID, Page, PerPage, Order, UserID, searchString);

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
                <li>code (응답코드) : <%= result.getCode() %></li>
                <li>message (응답메시지) : <%= result.getMessage() %></li>
                <li>total (총 검색결과 건수) : <%= result.getTotal() %></li>
                <li>perPage (페이지당 목록 건수) : <%= result.getPerPage() %></li>
                <li>pageNum (페이지 번호) : <%= result.getPageNum() %></li>
                <li>pageCount (페이지 개수) : <%= result.getPageCount() %></li>
            </ul>
            <%
                if ( result != null ){
                    for(int i=0; i < result.getList().size(); i++){
            %>
            <fieldset class="fieldset2">
                <legend> 세금계산서 요약정보 [ <%=(i+1) %> ] </legend>
                <ul>
                    <li>ntsconfirmNum (전자세금계산서 국세청승인번호) <%= result.getList().get(i).getNtsconfirmNum() %></li>
                    <li>writeDate (작성일자) : <%= result.getList().get(i).getWriteDate()  %> </li>
                    <li>issueDate (발행일자) : <%= result.getList().get(i).getIssueDate()  %> </li>
                    <li>sendDate (전송일자) : <%= result.getList().get(i).getSendDate()  %> </li>
                    <li>invoiceType (세금계산서 유형) : <%= result.getList().get(i).getInvoiceType()  %> </li>

                    <li>taxType (과세형태) : <%= result.getList().get(i).getTaxType()  %> </li>
                    <li>purposeType (영수/청구) : <%= result.getList().get(i).getPurposeType()  %> </li>
                    <li>supplyCostTotal (공급가액 합계) : <%= result.getList().get(i).getSupplyCostTotal()  %> </li>
                    <li>taxTotal (세액 합계) : <%= result.getList().get(i).getTaxTotal()  %> </li>
                    <li>totalAmount (합계금액) : <%= result.getList().get(i).getTotalAmount()  %> </li>
                    <li>remark1 (비고) : <%= result.getList().get(i).getRemark1()  %> </li>

                    <li>modifyYN (수정 전자세금계산서 여부) : <%= result.getList().get(i).getModifyYN()  %> </li>
                    <li>orgNTSConfirmNum (당초 국세청승인번호) : <%= result.getList().get(i).getOrgNTSConfirmNum()  %> </li>
                    <li>purchaseDate (품목1의 거래일자) : <%= result.getList().get(i).getPurchaseDate()  %> </li>
                    <li>itemName (품목1의 품명) : <%= result.getList().get(i).getItemName()  %> </li>
                    <li>spec (품목1의 규격) : <%= result.getList().get(i).getSpec()  %> </li>
                    <li>qty (품목1의 수량) : <%= result.getList().get(i).getQty()  %> </li>
                    <li>unitCost (품목1의 단가) : <%= result.getList().get(i).getUnitCost()  %> </li>
                    <li>supplyCost (품목1의 공급가액) : <%= result.getList().get(i).getSupplyCost()  %> </li>
                    <li>tax (품목1의 세액) : <%= result.getList().get(i).getTax()  %> </li>
                    <li>remark (품목1의 비고) : <%= result.getList().get(i).getRemark()  %> </li>

                    <li>invoicerCorpNum (공급자 사업자번호) : <%= result.getList().get(i).getInvoicerCorpNum()  %> </li>
                    <li>invoicerTaxRegID (공급자 종사업장 식별번호) : <%= result.getList().get(i).getInvoicerTaxRegID()  %> </li>
                    <li>invoicerCorpName (공급자 상호) : <%= result.getList().get(i).getInvoicerCorpName()  %> </li>
                    <li>invoicerCEOName (공급자 대표자 성명) : <%= result.getList().get(i).getInvoicerCEOName()  %> </li>
                    <li>invoicerEmail (공급자 담당자 메일) : <%= result.getList().get(i).getInvoicerEmail()  %> </li>

                    <li>invoiceeCorpNum (공급받는자 등록번호) : <%= result.getList().get(i).getInvoiceeCorpNum()  %> </li>
                    <li>invoiceeType (공급받는자 유형) : <%= result.getList().get(i).getInvoiceeType()  %> </li>
                    <li>invoiceeTaxRegID (공급받는자 종사업장 식별번호) : <%= result.getList().get(i).getInvoiceeTaxRegID()  %> </li>
                    <li>invoiceeCorpName (공급받는자 상호) : <%= result.getList().get(i).getInvoiceeCorpName()  %> </li>
                    <li>invoiceeCEOName (공급받는자 대표자 성명) : <%= result.getList().get(i).getInvoiceeCEOName()  %> </li>
                    <li>invoiceeEmail1 (공급받는자 담당자 메일) : <%= result.getList().get(i).getInvoiceeEmail1()  %> </li>
                    <li>invoiceeEmail2 (공급받는자 ASP 연계사업자 메일) : <%= result.getList().get(i).getInvoiceeEmail2()  %> </li>

                    <li>trusteeCorpNum (수탁자 사업자번호) : <%= result.getList().get(i).getTrusteeCorpNum()  %> </li>
                    <li>trusteeTaxRegID (수탁자 종사업장 식별번호) : <%= result.getList().get(i).getTrusteeTaxRegID()  %> </li>
                    <li>trusteeCorpName (수탁자 상호) : <%= result.getList().get(i).getTrusteeCorpName()  %> </li>
                    <li>tursteeCEOName (수탁자 대표자 성명) : <%= result.getList().get(i).getTrusteeCEOName()  %> </li>
                    <li>trusteeEmail (수탁자 담당자 메일) : <%= result.getList().get(i).getTrusteeEmail()  %> </li>
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
