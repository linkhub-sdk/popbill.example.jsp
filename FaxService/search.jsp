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
	/*
	 * 검색조건을 사용하여 팩스전송 내역을 조회합니다.
	 * - 최대 검색기간 : 6개월 이내
   * - https://docs.popbill.com/fax/java/api#Search
	 */

	// 펍발회원 사업자번호
	String testCorpNum = "1234567890";

	// 시작일자, 날짜형식(yyyyMMdd)
	String SDate = "20181201";

	// 종료일자, 날짜형식(yyyyMMdd)
	String EDate = "20190107";

	// 전송상태 배열, 1-대기, 2-성공, 3-실패, 4-취소
	String[] State = {"1", "2", "3", "4"};

	// 예약여부, true-예약전송건검색, false-전체조회
	Boolean ReserveYN = false;

	// 개인조회여부, true-개인조회, false-전체조회
	Boolean SenderOnlyYN = false;

	// 페이지번호
	int Page = 1;

	// 페이지당 검색개수, 최대 1000건
	int PerPage = 10;

	// 정렬방향, A-오름차순, D-내림차순
	String Order = "D";

	// 조회 검색어.
	// 팩스 전송시 입력한 발신자명 또는 수신자명 기재.
	// 조회 검색어를 포함한 발신자명 또는 수신자명을 검색합니다.
	String QString = "";

	FAXSearchResult searchResult = null;

	try {

		searchResult = faxService.search(testCorpNum, SDate, EDate, State, ReserveYN,
				SenderOnlyYN, Page, PerPage, Order, QString);

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
					<legend>개별 전송 내역 : [ <%=i+1%> / <%=searchResult.getList().size()%>]</legend>
					<ul>
						<li>state (전송상태 코드) : <%=faxResult.getState()%></li>
						<li>result (전송결과 코드) : <%=faxResult.getResult()%></li>
						<li>title (팩스제목) : <%=faxResult.getTitle()%></li>
						<li>sendNum (발신번호) : <%=faxResult.getSendNum()%></li>
						<li>senderName (발신자명) : <%=faxResult.getSenderName()%></li>
						<li>receiveNum (수신번호) : <%=faxResult.getReceiveNum()%></li>
						<li>receiveName (수신자명) : <%=faxResult.getReceiveName()%></li>
						<li>sendPageCnt (전체 페이지수) : <%=faxResult.getSendPageCnt()%></li>
						<li>successPageCnt (성공 페이지수) : <%=faxResult.getSuccessPageCnt()%></li>
						<li>failPageCnt (실패 페이지수) : <%=faxResult.getFailPageCnt()%></li>
						<li>refundPageCnt (환불 페이지수) : <%=faxResult.getRefundPageCnt()%></li>
						<li>cancelPageCnt (취소 페이지수) : <%=faxResult.getCancelPageCnt()%></li>
						<li>receiptDT (접수일시) : <%=faxResult.getReceiptDT()%></li>
						<li>reserveDT (예약일시) : <%=faxResult.getReserveDT()%></li>
						<li>sendDT (전송일시) : <%=faxResult.getSendDT()%></li>
						<li>resultDT (전송결과 수신일시) : <%=faxResult.getResultDT()%></li>
						<li>receiptNum (접수번호) : <%=faxResult.getReceiptNum()%></li>
						<li>requestNum (요청번호) : <%=faxResult.getRequestNum()%></li>
						<li>chargePageCnt (과금 페이지수) : <%=faxResult.getChargePageCnt()%></li>
						<li>tiffFileSize (변환파일용량 (단위:byte) ) : <%=faxResult.getTiffFileSize()%></li>
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
						<li>fileNames (전송 파일명 리스트) : <%=fileNames%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
			</fieldset>
		 </div>
	</body>
</html>
