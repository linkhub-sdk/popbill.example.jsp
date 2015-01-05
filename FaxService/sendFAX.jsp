<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testUserID = "userid";			// 회원 아이디
	String testCorpNum = "1231212312";		// 회원 사업자번호
	String sendNum = "07075103710";			// 발신자 번호
	String receiveNum = "0264429700";		// 수신 팩스 번호
	String receiveName = "수신자 명칭";		

	String receiptNum = null;				// 접수번호 (전송결과 확인 시 사용)
	Date reserveDT = null;					// 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전송
	
	File file = new File((application.getRealPath("/resources/test.jpg")));

//	예약전송시 아래의 코드참조
//	String reserveDTtxt = "20141230180000";		
//	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//	reserveDT = formatter.parse(reserveDTtxt);

	try {

		receiptNum = faxService.sendFAX(testCorpNum, sendNum, receiveNum, receiveName, file, reserveDT, testUserID);

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
				<legend>팩스 전송요청 결과 확인</legend>
				<ul>
					<li>receiptNum : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>