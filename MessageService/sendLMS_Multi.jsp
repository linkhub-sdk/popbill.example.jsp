<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.message.Message"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1234567890";		// 팝빌회원 사업자번호
	String testUserID = "testkorea";		// 팝빌회원 아이디
	String sender = "07075103710";      // 발신번호

	String subject = "대량문자 제목";		// 대량문자 제목, 개별전송정보 없는경우
	String content = "대량문자 내용";		// 대량문자 내용, 개별전송정보 없는경우
	Boolean adsYN = false;					// 광고문자 전송여부

	//문자메시지 개별전송정보 최대 1000건
	Message msg1 = new Message();
	msg1.setSender("07075103710");			// 발신번호
  msg1.setSenderName("발신자명1");
	msg1.setReceiver("010111222");		// 수신번호
	msg1.setReceiverName("수신자명");
	msg1.setSubject("장문 메시지 제목1");
	msg1.setContent("장문 메시지 내용1");

	Message msg2 = new Message();
	msg2.setSender("07075103710");			// 발신번호
  msg2.setSenderName("발신자명2");
	msg2.setReceiver("010111222");		// 수신번호
	msg2.setReceiverName("수신자명");
	msg2.setSubject("장문 메시지 제목2");
	msg2.setContent("장문 메시지 내용2");

	Message[] messages = new Message[] {msg1, msg2};	//문자메시지 전송정보 최대 1000건

	Date reserveDT = null;					// 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전송
//	예약전송시 아래의 코드 참조
//	String reserveDTtxt ="20141229180000";
//	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//	reserveDT = formatter.parse(reserveDTtxt);

	String receiptNum = null;

	try {

		receiptNum = messageService.sendLMS(testCorpNum, sender, subject, content, messages, reserveDT, adsYN, testUserID);

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
				<legend>장문 문자메세지 다량 전송 요청</legend>
				<ul>
					<li>접수번호 : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
