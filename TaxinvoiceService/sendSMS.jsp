<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
  /**
  * 알림문자를 전송합니다. (단문/SMS- 한글 최대 45자)
  * - 알림문자 전송시 포인트가 차감됩니다. (전송실패시 환불처리)
  * - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [전송내역] 탭에서 전송결과를 확인할 수 있습니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

  // 세금계산서 문서관리번호
	String mgtKey = "20161128-01";

  // 발신번호
	String senderNum = "010-1111-2222";

  // 수신번호
	String receiverNum = "010-4324-5117";

  // 문자메시지 내용, 최대 90Byte 초과된 내용은 삭제되어 전송됨
	String msg = "문자 메시지 내용";

	Response CheckResponse = null;

	try {

		CheckResponse = taxinvoiceService.sendSMS(testCorpNum, keyType, mgtKey, senderNum, receiverNum, msg);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}

%>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>문자알림 재전송 결과 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>
