<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/**
  * 현금영수증을 팩스전송합니다.
  * - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
  * - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [팩스] > [전송내역] 메뉴에서 전송결과를
  *   확인할 수 있습니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 현금영수증 문서관리번호
	String mgtKey = "20150318-02";

  // 발신자 번호
	String sender = "07043042991";

  // 수신팩스번호
	String receiver = "070111222";

  // 팝빌회원 아이디
	String userID = "testkorea";

	Response CheckResponse = null;

	try {

		CheckResponse = cashbillService.sendFAX(testCorpNum, mgtKey, sender, receiver, userID);

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
				<legend>현금영수증 팩스 전송</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
