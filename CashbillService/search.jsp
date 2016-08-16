<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CashbillInfo"%>
<%@page import="com.popbill.api.cashbill.CBSearchResult"%>

<%
	// 현금영수증 목록 조회

	String testCorpNum = "1234567890";		// 연동회원 사업자번호

	String DType = "R";						// 검색일자 유형, R-등록일자, T-거래일자, I-발행일자
	String SDate = "20160701";				// 시작일자, yyyyMMdd
	String EDate = "20160731";				// 종료일자, yyyyMMdd

	String[] State = {"100", "2**", "3**"};	// 현금영수증 상태코드 배열, 2,3번째 자리에 와일드카드(*) 사용가능
	String[] TradeType = {"N", "C"};		// 현금영수증 형태 배열, N-일반 현금영수증, C-취소 현금영수증
	String[] TradeUsage = {"P", "C"};		// 거래용도 배열, P-소득공제용, C-지출증빙용
	String[] TaxationType = {"T", "N"};		// 과세형태 배열, T-과세, N-비과세
  String QString = "1234";            // 식별번호조회

	int Page = 1;							// 페이지 번호
	int PerPage = 20;						// 페이지당 검색개수, 최대 1000개
	String Order = "D";						// 정렬방향, D-내림차순, A-오름차순

	CBSearchResult searchResult = null;

	// 현금영수증 상태정보 항목에 대한 설명은 [현금영수증 API 연동매뉴얼 - 4.2 현금영수증 상태정보 구성] 참조
	try {
		searchResult = cashbillService.search(testCorpNum, DType, SDate, EDate, State, TradeType, TradeUsage, TaxationType, QString, Page, PerPage, Order);
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
				<legend>현금영수증 목록 조회</legend>
				<ul>
					<li>code (응답코드) : <%= searchResult.getCode()%></li>
					<li>message (응답메시지) : <%= searchResult.getMessage()%></li>
					<li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
					<li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
					<li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
					<li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
				</ul>

				<%
					CashbillInfo cashbillInfo = null;
					for(int i=0; i< searchResult.getList().size(); i++){
						cashbillInfo = searchResult.getList().get(i);
				%>

				<fieldset class="fieldset2">
					<legend>CashbillInfo [ <%=i+1%> / <%=searchResult.getList().size()%> ] </legend>
					<ul>
						<li>itemKey : <%= cashbillInfo.getItemKey()%></li>
						<li>mgtKey : <%= cashbillInfo.getMgtKey()%></li>
						<li>tradeDate : <%= cashbillInfo.getTradeDate()%></li>
						<li>issueDT : <%= cashbillInfo.getIssueDT()%></li>
						<li>customerName : <%= cashbillInfo.getCustomerName()%></li>
						<li>itemName : <%= cashbillInfo.getItemName()%></li>
						<li>identityNum : <%= cashbillInfo.getIdentityNum()%></li>
						<li>taxationType : <%= cashbillInfo.getTaxationType()%></li>
						<li>totalAmount : <%= cashbillInfo.getTotalAmount()%></li>
						<li>tradeUsage : <%= cashbillInfo.getTradeUsage()%></li>
						<li>tradeType : <%= cashbillInfo.getTradeType()%></li>
						<li>stateCode : <%= cashbillInfo.getStateCode()%></li>
						<li>stateDT : <%= cashbillInfo.getStateDT()%></li>
						<li>printYN : <%= cashbillInfo.isPrintYN()%></li>
						<li>confirmNum : <%= cashbillInfo.getConfirmNum()%></li>
						<li>orgTradeDate : <%= cashbillInfo.getOrgTradeDate()%></li>
						<li>orgConfirmNum : <%= cashbillInfo.getOrgConfirmNum()%></li>
						<li>ntssendDT : <%= cashbillInfo.getNtssendDT()%></li>
						<li>ntsresult : <%= cashbillInfo.getNtsresult()%></li>
						<li>ntsresultDT : <%= cashbillInfo.getNtsresultDT()%></li>
						<li>ntsresultCode : <%= cashbillInfo.getNtsresultCode()%></li>
						<li>ntsresultMessage : <%= cashbillInfo.getNtsresultMessage()%></li>
						<li>regDT : <%= cashbillInfo.getRegDT()%></li>
					</ul>
				</fieldset>

				<%
					}
				%>



			</fieldset>
		 </div>
	</body>
</html>
