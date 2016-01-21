<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.fax.FaxResult"%>
<%@page import="com.popbill.api.fax.FAXSearchResult"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	String SDate = "20150101";				// 시작일자, yyyyMMdd
	String EDate = "20160115";				// 종료일자, yyyyMMdd
	String[] State = {"1","2","3","4"};		// 전송상태 배열, 1-대기, 2-성공, 3-실패, 4-취소
	Boolean ReserveYN = false;				// 예약여부, true-예약전송건검색, false-전체조회
	Boolean SenderOnlyYN = false;			// 개인조회여부, true-개인조회, false-전체조회
	int Page = 5;							// 페이지번호
	int PerPage = 10;						// 페이지당 검색개수, 최대 1000건
	String Order = "A";						// 정렬방향, A-오름차순, D-내림차순
		
	FAXSearchResult searchResult = null;

	try {

		searchResult = faxService.search(testCorpNum, SDate, EDate, State, ReserveYN, SenderOnlyYN, Page, PerPage, Order);

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
			<legend>팩스전송 전송결과 확인</legend>
				<ul>	
					<li>code (응답코드) : <%= searchResult.getCode()%></li>
					<li>message (응답메시지) : <%= searchResult.getMessage()%></li>
					<li>total (총 검색결과 건수) : <%= searchResult.getTotal()%></li>
					<li>perPage (페이지당 검색개수) : <%= searchResult.getPerPage()%> </li>
					<li>pageNum (페이지 번호) : <%= searchResult.getPageNum()%></li>
					<li>pageCount (페이지 개수) : <%= searchResult.getPageCount()%></li>
				</ul>

				<%
					FaxResult faxResult = new FaxResult();

					for(int i=0; i<searchResult.getList().size(); i++){
						faxResult = searchResult.getList().get(i);
				%>

				<fieldset class="fieldset2">
					<legend>FaxResult : [ <%=i+1%> / <%=searchResult.getList().size()%>]</legend>
					<ul>
						<li>sendState : <%=faxResult.getSendState()%></li>
						<li>convState : <%=faxResult.getConvState()%></li>
						<li>sendNum : <%=faxResult.getSendNum()%></li>
						<li>receiveNum : <%=faxResult.getReceiveNum()%></li>
						<li>receiveName : <%=faxResult.getReceiveName()%></li>
						<li>sendPageCnt : <%=faxResult.getSendPageCnt()%></li>
						<li>successPageCnt : <%=faxResult.getSuccessPageCnt()%></li>
						<li>failPageCnt : <%=faxResult.getFailPageCnt()%></li>
						<li>refundPageCnt : <%=faxResult.getRefundPageCnt()%></li>
						<li>cancelPageCnt : <%=faxResult.getCancelPageCnt()%></li>
						<li>receiptDT : <%=faxResult.getReceiptDT()%></li>
						<li>reserveDT : <%=faxResult.getReserveDT()%></li>
						<li>sendDT : <%=faxResult.getSendDT()%></li>
						<li>resultDT : <%=faxResult.getResultDT()%></li>
						<li>sendResult : <%=faxResult.getSendResult()%></li>
						<%
							String fileNames = "";
							int namesLength = faxResult.getFileNames().length;

							for(int j = 0; j < namesLength ; j++){
								if ( namesLength == 1 || j == faxResult.getFileNames().length -1 ) {
									fileNames += faxResult.getFileNames()[j];
								} else {
									fileNames += faxResult.getFileNames()[j]+", ";
								}
							}
						%>
						<li>fileNames : <%=fileNames%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
			</fieldset>
		 </div>
	</body>
</html>