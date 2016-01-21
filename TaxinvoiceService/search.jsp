<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.TISearchResult"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceInfo"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
	String testCorpNum = "1234567890";			// 연동회원 사업자번호 
	String DType = "I";							// 일자유형, R-등록일자, W-작성일자, I-발행일자
	String SDate = "20160101";					// 시작일자
	String EDate = "20160114";					// 종료일자
	String[] State = {"100", "2**", "3**"};		// 상태코드 배열, 2,3번째 자리에 와일드카드(*) 사용가능
	String[] Type = {"N", "M"};					// 문서유형 배열, N-일반세금계산서, M-수정세금계산서
	String[] TaxType = {"T","Z"};				// 과세형태 배열, T-과세, N-면세, Z-영세
	Boolean LateOnly = null;					// 지연발행 여부, null- 전체조회, false-정상발행, true-지연발행
	int Page = 1;								// 페이지번호 
	int PerPage = 30;							// 페이지당 검색개수, 최대 1000건
	String Order = "D";							// 정렬방향, A-오름차순, D-내림차순
			
	TISearchResult searchResult = new TISearchResult();		
		
	try {

		searchResult = taxinvoiceService.Search(testCorpNum, MgtKeyType.SELL, DType, SDate, EDate, State, Type, TaxType, LateOnly, Page, PerPage, Order);

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
				<legend>세금계산서 목록 조회</legend>
				<ul>	
					<li>code (응답코드) : <%= searchResult.getCode()%></li>
					<li>message (응답메시지) : <%= searchResult.getMessage()%></li>
					<li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
					<li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
					<li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
					<li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
				</ul>

					<%
						TaxinvoiceInfo taxinvoiceInfo = null;
						for(int i=0; i< searchResult.getList().size(); i++){
							taxinvoiceInfo = searchResult.getList().get(i);
					%>
					
						<fieldset class="fieldset2">
							<legend>TaxinvoiceInfos [ <%=i+1%> / <%=searchResult.getList().size()%> ]</legend>
								<ul>	
									<li>itemKey : <%= taxinvoiceInfo.getItemKey()%></li>
									<li>taxType : <%= taxinvoiceInfo.getTaxType()%></li>
									<li>writeDate : <%= taxinvoiceInfo.getWriteDate()%></li>
									<li>regDT : <%= taxinvoiceInfo.getRegDT()%> </li>
									<li>lateIssueYN : <%= taxinvoiceInfo.getLateIssueYN() %></li>
									<li>invoicerCorpName : <%= taxinvoiceInfo.getInvoicerCorpName()%></li>
									<li>invoicerCorpNum : <%= taxinvoiceInfo.getInvoicerCorpNum() %> </li>
									<li>invoicerMgtKey : <%= taxinvoiceInfo.getInvoicerMgtKey() %></li>
									<li>invoicerPrintYN : <%= taxinvoiceInfo.isInvoicerPrintYN() %></li>
									<li>invoiceeCorpName : <%= taxinvoiceInfo.getInvoiceeCorpName() %></li>
									<li>invoiceeCorpNum : <%= taxinvoiceInfo.getInvoiceeCorpNum() %></li>
									<li>invoiceeMgtKey : <%= taxinvoiceInfo.getInvoiceeMgtKey() %> </li>
									<li>invoiceePrintYN : <%= taxinvoiceInfo.isInvoiceePrintYN() %></li>
									<li>trusteeCorpName : <%= taxinvoiceInfo.getTrusteeCorpName() %></li>
									<li>trusteeCorpNum : <%= taxinvoiceInfo.getTrusteeCorpNum() %></li>
									<li>trusteeMgtKey : <%= taxinvoiceInfo.getTrusteeMgtKey() %></li>
									<li>trusteePrintYN : <%= taxinvoiceInfo.isTrusteePrintYN() %></li>
									<li>supplyCostTotal : <%= taxinvoiceInfo.getSupplyCostTotal() %></li>
									<li>taxTotal : <%= taxinvoiceInfo.getTaxTotal() %></li>
									<li>purposeType : <%= taxinvoiceInfo.getPurposeType() %></li>
									<li>modifyCode : <%= taxinvoiceInfo.getModifyCode() %></li>
									<li>issueType : <%= taxinvoiceInfo.getIssueType() %></li>
									<li>issueDT : <%= taxinvoiceInfo.getIssueDT() %></li>
									<li>preIssueDT : <%= taxinvoiceInfo.getPreIssueDT() %></li>
									<li>stateCode : <%= taxinvoiceInfo.getStateCode() %></li>
									<li>stateDT : <%= taxinvoiceInfo.getStateDT() %></li>
									<li>stateMemo : <%= taxinvoiceInfo.getStateMemo() %></li>
									<li>openYN : <%= taxinvoiceInfo.isOpenYN() %></li>
									<li>openDT : <%= taxinvoiceInfo.getOpenDT() %></li>
									<li>ntsresult : <%= taxinvoiceInfo.getNTSResult() %></li>
									<li>ntsconfirmNum : <%= taxinvoiceInfo.getNTSConfirmNum() %></li>
									<li>ntssendDT : <%= taxinvoiceInfo.getNTSSendDT() %></li>
									<li>ntsresultDT : <%= taxinvoiceInfo.getNTSResultDT() %></li>
									<li>ntssendErrCode : <%= taxinvoiceInfo.getNTSSendErrCode() %></li>
								</ul>
						</fieldset>		
						
					<%			
						}
					%>

			</fieldset>
		 </div>
	</body>
</html>