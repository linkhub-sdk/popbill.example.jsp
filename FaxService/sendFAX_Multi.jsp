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
<%@page import="com.popbill.api.fax.Receiver"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
  // 팝빌회원 사업자번호
  String testCorpNum = "1234567890";

  // 팝빌회원 아이디
	String testUserID = "testkorea";

  // 발신번호번호
	String sendNum = "07043042991";

	// 수신정보
	Receiver receiver1 = new Receiver();
	receiver1.setReceiveName("수신자1");
	receiver1.setReceiveNum("070111222");

	Receiver receiver2 = new Receiver();
	receiver2.setReceiveName("수신자2");
	receiver2.setReceiveNum("070111222");

  // 전송할 팩스 이미지파일 경로
  File file = new File((application.getRealPath("/resources/test.jpg")));

  // 팩스 수신자 번호 목록, 최대 1000개
	Receiver[] receivers = new Receiver[] {receiver1, receiver2};

  // 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전송
  //	String reserveDTtxt = "20141229180000";
  //	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
  //	reserveDT = formatter.parse(reserveDTtxt);
	Date reserveDT = null;

  // 광고팩스 전송여부
  Boolean adsYN = false;

  // 팩스제목
  String title = "팩스동보전송 제목";


  String receiptNum = null;

	try {

		receiptNum = faxService.sendFAX(testCorpNum, sendNum, receivers, file,
      reserveDT, testUserID, adsYN, title);

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
				<legend>팩스 동보전송 결과 확인</legend>
				<ul>
					<li>접수번호 : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
