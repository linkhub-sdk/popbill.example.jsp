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
  /**
  * 검색조건을 사용하여 수집결과를 조회합니다.
  * - 응답항목에 관한 정보는 "[홈택스 현금영수증 연계 API 연동매뉴얼]
  *   > 3.3.1. Search (수집 결과 조회)" 을 참고하시기 바랍니다.
  */

  // 팝빌 회원 사업자번호
	String testCorpNum = "1234567890";

  // 수집 요청시 발급받은 작업아이디
  String jobID = "016062015000000001";

  // 거래용도 배열, P-소득공제용, C-지출증빙용
  String[] TradeUsage = {"P", "C"};

  // 거래유형 배열, N-일반 현금영수증, C-취소현금영수증
  String[] TradeType = {"N", "C"};

  // 페이지번호
  int Page = 1;

  // 페이지당 목록개수
  int PerPage = 15;

  // 정렬방향, 내림차순-D, 오름차순-A
  String Order = "D";

  HTCashbillSearchResult result = null;

	try {

		result = htCashbillService.search(testCorpNum, jobID, TradeUsage, TradeType, Page, PerPage, Order);

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
            for ( int i = 0; i < result.getList().size(); i++ ) {
        %>

          <fieldset class="fieldset2">
          <legend> 현금영수증 정보 [ <%=(i+1) %> ] </legend>
          <ul>
            <li>ntsconfirmNum (국세청승인번호) : <%= result.getList().get(i).getNtsconfirmNum() %></li>
            <li>tradeDT (거래일시) : <%= result.getList().get(i).getTradeDT() %></li>
            <li>tradeUsage (거래유형) : <%= result.getList().get(i).getTradeUsage() %></li>
            <li>tradeType (현금영수증 형태) : <%= result.getList().get(i).getTradeType() %></li>
            <li>supplyCost (공급가액) : <%= result.getList().get(i).getSupplyCost() %></li>
            <li>tax (세액) : <%= result.getList().get(i).getTax() %></li>
            <li>serviceFee (봉사료) : <%= result.getList().get(i).getServiceFee() %></li>
            <li>totalAmount (거래금액) : <%= result.getList().get(i).getTotalAmount() %></li>
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
