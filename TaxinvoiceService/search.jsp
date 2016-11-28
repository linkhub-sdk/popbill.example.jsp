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
  /**
  * 검색조건을 사용하여 세금계산서 목록을 조회합니다.
  * - 응답항목에 대한 자세한 사항은 "[전자세금계산서 API 연동매뉴얼] >
  *   4.2. (세금)계산서 상태정보 구성" 을 참조하시기 바랍니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 일자유형, R-등록일자, W-작성일자, I-발행일자
	String DType = "W";

  // 시작일자, 날짜형식(yyyyMMdd)
	String SDate = "20161001";

  // 종료일자, 날짜형식(yyyyMMdd)
	String EDate = "20161231";

  // 세금계산서 상태코드 배열, 2,3번째 자리에 와일드카드(*) 사용가능
	String[] State = {"100", "2**", "3**"};

  // 문서유형 배열, N-일반세금계산서, M-수정세금계산서
	String[] Type = {"N", "M"};

  // 과세형태 배열, T-과세, N-면세, Z-영세
	String[] TaxType = {"T","Z"};

  // 지연발행 여부, null- 전체조회, false-정상발행, true-지연발행
	Boolean LateOnly = null;


  // 종사업장 식별번호 유형, S-공급자, B-공급받는자, T-수탁자
  String TaxRegIDType = "S";

  // 종사업장번호, 다수기재시 콤마(",")로 구분하여 구성 ex ) "0001,0002"
  String TaxRegID = "";

  // 종사업장번호 조회 여부, 빈문자열-전체조회, 0-종사업장번호 없음, 1-종사업장번호 있음.
  String TaxRegIDYN = "";

  // 통합검색어, 거래처명 또는 거래처 사업자등록번호 기재, 공백시 전체조회
  String QString = "";


  // 페이지번호
	int Page = 1;

  // 페이지당 검색개수, 최대 1000건
	int PerPage = 30;

  // 정렬방향, A-오름차순, D-내림차순
	String Order = "D";

	TISearchResult searchResult = new TISearchResult();

	try {
		searchResult = taxinvoiceService.Search(testCorpNum, MgtKeyType.SELL, DType,
      SDate, EDate, State, Type, TaxType, LateOnly, TaxRegIDType, TaxRegID,
      TaxRegIDYN, QString, Page, PerPage, Order);

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
				<legend>세금계산서 목록조회</legend>
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

						for ( int i = 0; i< searchResult.getList().size(); i++ ) {
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
