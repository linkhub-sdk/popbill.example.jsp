<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.SentMessage"%>
<%@page import="com.popbill.api.message.MSGSearchResult"%>

<%
  /**
  * 검색조건을 사용하여 문자전송 내역을 조회합니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum= "1234567890";

  // 시작일자, 날짜형태(yyyyMMdd)
	String SDate = "20161001";

  // 종료일자, 날짜형식(yyyyMMdd)
	String EDate = "20161231";

  // 문자 전송상태 배열, 1-대기, 2-성공, 3-실패, 4-취소
	String[] State = {"1", "2", "3", "4"};

  // 문자 전송여형 배열, SMS-단문, LMS-장문, MMS-포토
	String[] Item = {"SMS", "LMS", "MMS"};

  // 예약전송 여부, true-예약전송조회, false-전체조회
	Boolean ReserveYN = false;

  // 개인조회 여부, true-개인조회, false-전체조회
	Boolean SenderYN = false;

  // 페이지 번호
	int Page = 1;

  // 페이지당 검색개수, 최대 1000개
	int PerPage = 20;

  // 정렬방향, A-오름차순, D-내림차순
	String Order = "D";

	MSGSearchResult searchResult = null;

	try {

		searchResult = messageService.search(testCorpNum, SDate, EDate, State, Item,
      ReserveYN, SenderYN, Page, PerPage, Order);

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
				<legend>메시지 전송결과 조회</legend>
				<ul>
					<li>code (응답코드) : <%=searchResult.getCode()%></li>
					<li>message (응답메시지) : <%=searchResult.getMessage()%></li>
					<li>total (총 검색결과 건수) : <%=searchResult.getTotal()%></li>
					<li>perPage (페이지당 검색개수) : <%=searchResult.getPerPage()%></li>
					<li>pageNum (페이지번호) : <%=searchResult.getPageNum()%></li>
					<li>pageCount (페이지 개수) : <%=searchResult.getPageCount()%></li>

				</ul>
				<%
					for ( int i = 0; i < searchResult.getList().size(); i++ ) {
            
						SentMessage sentMsg = searchResult.getList().get(i);
				%>

				<fieldset class="fieldset2">
					<legend>SentMessage : [ <%=i+1%> / <%=searchResult.getList().size() %> ]</legend>
					<ul>
						<li>sendState : <%=sentMsg.getState()%> </li>
						<li>subject : <%=sentMsg.getSubject()%></li>
						<li>messageType : <%=sentMsg.getMessageType()%></li>
						<li>content : <%=sentMsg.getContent()%></li>
						<li>sendNum : <%=sentMsg.getSendNum()%></li>
            <li>senderName : <%=sentMsg.getSenderName()%></li>
						<li>receiveNum : <%=sentMsg.getReceiveNum()%></li>
						<li>receiveName : <%=sentMsg.getReceiveName()%></li>
						<li>receiptDT : <%=sentMsg.getReceiptDT()%></li>
						<li>reserveDT : <%=sentMsg.getReserveDT()%></li>
						<li>sendDT : <%=sentMsg.getSendDT()%></li>
						<li>resultDT : <%=sentMsg.getResultDT()%></li>
						<li>sendResult : <%=sentMsg.getSendResult()%></li>
						<li>tranNet :<%=sentMsg.getTranNet()%></li>
					</ul>
				</fieldset>
				<%
					}
				%>
		 </div>
	</body>
</html>
