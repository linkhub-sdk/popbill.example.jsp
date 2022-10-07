<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.hometax.HTCashbillSearchResult"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 수집 상태 확인(GetJobState API) 함수를 통해 상태 정보 확인된 작업아이디를 활용하여 현금영수증 매입/매출 내역을 조회합니다.
     * - https://docs.popbill.com/htcashbill/java/api#Search
     */

    // 팝빌 회원 사업자번호
    String testCorpNum = "1234567890";

    // 수집요청(requestJob API) 함수 호출 시 반환받은 작업아이디
    String jobID = "";

    // 거래구분 배열 ("P" 와 "C" 중 선택, 다중 선택 가능)
    // └ P = 소득공제용 , C = 지출증빙용
    // - 미입력 시 전체조회
    String[] TradeUsage = {"P", "C"};

    // 문서형태 배열 ("N" 와 "C" 중 선택, 다중 선택 가능)
    // └ N = 일반 현금영수증 , C = 취소현금영수증
    // - 미입력 시 전체조회
    String[] TradeType = {"N", "C"};

    // 페이지번호
    int Page = 1;

    // 페이지당 목록개수
    int PerPage = 15;

    // 정렬방향, "D" / "A" 중 택 1
    // └ D = 내림차순(기본값) , A = 오름차순
    String Order = "D";

    HTCashbillSearchResult result = null;

    try {

        result = htCashbillService.search(testCorpNum, jobID, TradeUsage, TradeType, Page, PerPage, Order);

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
                for ( int i = 0; i < result.getList().size(); i++ ) {
            %>
              <fieldset class="fieldset2">
              <legend> 현금영수증 정보 [ <%=(i+1) %> ] </legend>
              <ul>
                  <li>ntsconfirmNum (국세청 승인번호) : <%= result.getList().get(i).getNtsconfirmNum() %></li>
                  <li>tradeDate (거래일자) : <%= result.getList().get(i).getTradeDate() %></li>
                  <li>tradeDT (거래일시) : <%= result.getList().get(i).getTradeDT() %></li>
                  <li>tradeUsage (거래구분) : <%= result.getList().get(i).getTradeUsage() %></li>
                  <li>tradeType (문서형태) : <%= result.getList().get(i).getTradeType() %></li>
                  <li>totalAmount (합계금액) : <%= result.getList().get(i).getTotalAmount() %></li>
                  <li>supplyCost (공급가액) : <%= result.getList().get(i).getSupplyCost() %></li>
                  <li>tax (부가세) : <%= result.getList().get(i).getTax() %></li>
                  <li>serviceFee (봉사료) : <%= result.getList().get(i).getServiceFee() %></li>
                  <li>invoiceType (매입/매출) : <%= result.getList().get(i).getInvoiceType()  %> </li>
                  <li>franchiseCorpNum (발행자 사업자번호) : <%= result.getList().get(i).getFranchiseCorpNum() %></li>
                  <li>franchiseCorpName (발행자 상호) : <%= result.getList().get(i).getFranchiseCorpName() %></li>
                  <li>franchiseCorpType (발행자 사업자유형) : <%= result.getList().get(i).getFranchiseCorpType() %></li>
                  <li>identityNum (거래처 식별번호) : <%= result.getList().get(i).getIdentityNum() %></li>
                  <li>identityNumType (식별번호유형) : <%= result.getList().get(i).getIdentityNumType() %></li>
                  <li>customerName (식별번호유형) : <%= result.getList().get(i).getCustomerName() %></li>
                  <li>cardOwnerName (카드소유자명) : <%= result.getList().get(i).getCardOwnerName() %></li>
                  <li>deductionType (공제유형) : <%= result.getList().get(i).getDeductionType() %></li>
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
