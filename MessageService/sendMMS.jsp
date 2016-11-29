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
  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 팝빌회원 아이디
	String testUserID = "testkorea";

  // 발신번호
	String sender = "07043042991";

  // 수신번호
	String receiver = "010111222";

  // 수신자명
	String receiverName = "수신자명";

  // 메시지 제목
	String subject = "멀티 문자메시지 제목";

  // 메시지 내용
	String content = "멀티 문자메시지 내용";

  // 첨부이미지 파일스트림
	File file = new File((application.getRealPath("/resources/test.jpg")));

  // 전송예약시간(yyyyMMddHHmmss), null인 경우 즉시전송
	Date reserveDT = null;
  //	예약전송시 아래의 코드 참조
  //	String reserveDTtxt ="20141229180000";
  //	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
  //	reserveDT = formatter.parse(reserveDTtxt);

  // 광고문자 전송여부
	Boolean adsYN = false;

	String receiptNum = null;

	try {

		receiptNum = messageService.sendMMS(testCorpNum, sender, receiver, receiverName,
      subject, content, file, reserveDT, adsYN, testUserID);

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
				<legend>포토 문자 전송</legend>
				<ul>
					<li>접수번호 : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
