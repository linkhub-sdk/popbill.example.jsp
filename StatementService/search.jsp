<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.StatementInfo"%>
<%@page import="com.popbill.api.statement.StmtSearchResult"%>

<%
  /**
  * 검색조건을 사용하여 전자명세서 목록을 조회합니다.
  * - 응답항목에 대한 자세한 사항은 "[전자명세서 API 연동매뉴얼] > 3.3.3. Search (목록 조회)"
  *   를 참조하시기 바랍니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 검색일자 유형, R-등록일자, W-작성일자, I-발행일자 중 택1
	String DType = "W";

  // 시작일자, 날짜형식(yyyyMMdd)
	String SDate = "20190107";

  // 종료일자, 날짜형식(yyyyMMdd)
	String EDate = "20161130";

  // 전자명세서 상태코드 배열, 2,3번째 자리에 와일드카드(*) 사용가능
	String[] State = {"1**", "2**", "3**", "4**", "5**", "6**"};

	// 명세서 종류코드 배열, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int[] ItemCode = {121, 122, 123, 124, 125, 126};

  // 통합검색어, 거래처명 또는 거래처 사업자등록번호 기재하여 조회. 공백시 전체조회
  String QString = "";

  // 페이지 번호
	int Page = 1;

  // 페이지당 검색개수
	int PerPage = 30;

  // 정렬방향, A-오름차순, D-내림차순
	String Order = "D";

	StmtSearchResult searchResult = null;

	try {

		searchResult = statementService.search(testCorpNum, DType, SDate, EDate, State,
      ItemCode, QString, Page, PerPage, Order);

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
				<legend>전자명세서 목록조회</legend>
				<ul>
					<li>code (응답코드) : <%= searchResult.getCode()%></li>
					<li>message (응답메시지) : <%= searchResult.getMessage()%></li>
					<li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
					<li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
					<li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
					<li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
				</ul>
					<%
						StatementInfo statementInfo = null;

						for ( int i = 0; i < searchResult.getList().size(); i++ ) {
							statementInfo = searchResult.getList().get(i);
					%>

						<fieldset class="fieldset2">
							<legend>StatementInfo [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
							<ul>
								<li>itemKey : <%= statementInfo.getItemKey()%></li>
								<li>itemCode : <%= statementInfo.getItemCode()%></li>
								<li>invoiceNum : <%= statementInfo.getInvoiceNum()%></li>
								<li>mgtKey : <%= statementInfo.getMgtKey()%></li>

								<li>stateCode : <%= statementInfo.getStateCode()%></li>
								<li>taxType : <%= statementInfo.getTaxType()%></li>
								<li>purposeType : <%= statementInfo.getPurposeType()%></li>

								<li>writeDate : <%= statementInfo.getWriteDate()%></li>
								<li>senderCorpName : <%= statementInfo.getSenderCorpName()%></li>
								<li>senderCorpNum : <%= statementInfo.getSenderCorpNum()%></li>
								<li>senderPrintYN : <%= statementInfo.isSenderPrintYN()%></li>

								<li>receiverCorpName : <%= statementInfo.getReceiverCorpName()%></li>
								<li>receiverCorpNum : <%= statementInfo.getReceiverCorpNum()%></li>
								<li>receiverPrintYN : <%= statementInfo.isReceiverPrintYN()%></li>

								<li>supplyCostTotal : <%= statementInfo.getSupplyCostTotal()%></li>
								<li>taxTotal : <%= statementInfo.getTaxTotal()%></li>
								<li>issueDT : <%= statementInfo.getIssueDT()%></li>
								<li>stateDT : <%= statementInfo.getStateDT()%></li>
								<li>openYN : <%= statementInfo.isOpenYN()%></li>
								<li>openDT : <%= statementInfo.getOpenDT()%></li>
								<li>stateMemo : <%= statementInfo.getStateMemo()%></li>
								<li>regDT : <%= statementInfo.getRegDT()%></li>
							</ul>
						</fieldset>
						<%
							}
						%>
					</ul>
			</fieldset>
		 </div>
	</body>
</html>
