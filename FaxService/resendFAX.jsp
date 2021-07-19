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
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 팝빌에서 반환받은 접수번호를 통해 팩스 1건을 재전송합니다.
	 * - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
	 * - https://docs.popbill.com/fax/java/api#ResendFAX
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 팝빌회원 아이디
	String testUserID = "testkorea";

	// 팩스 접수번호
	String orgReceiptNum = "021010809435800001";

	// 발신번호, 공백처리시 기존전송정보로 전송
	String sendNum = "07043042991";

	// 발신자명, 공백처리시 기존전송정보로 전송
	String senderName = "발신자명";

	// 수신자명, 수신번호를 모두 공백처리시 기존전송정보로 전송
	// 수신 팩스번호
	String receiveNum = "070111222";

	// 수신자명
	String receiveName = "";

	// 예약전송일시(yyyyMMddHHmmss), null인 경우 즉시전ㅌ
	//	String reserveDTtxt = "20141230180000";
	//	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	//	reserveDT = formatter.parse(reserveDTtxt);
	Date reserveDT = null;

	// 팩스제목
	String title = "팩스전송 제목";

	// 재전송 팩스의 전송요청번호
	// 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
	// 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
	// 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
	String requestNum = "";

	String receiptNum = null;

	try {

		receiptNum = faxService.resendFAX(testCorpNum, orgReceiptNum, sendNum, senderName,
				receiveNum, receiveName, reserveDT, testUserID, title, requestNum);

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
				<legend>팩스 재전송 요청</legend>
				<ul>
					<li>receiptNum (팩스전송 접수번호) : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
