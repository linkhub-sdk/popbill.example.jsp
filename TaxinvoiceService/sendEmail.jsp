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
	/*
	 * 세금계싼서 안내 메일을 재전송합니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

	// 세금계산서 문서번호
	String mgtKey = "20190107-001";

	// 메일주소
	String emailAddr = "test@test.com";

	Response CheckResponse = null;

	try {

		CheckResponse = taxinvoiceService.sendEmail(testCorpNum, keyType, mgtKey, emailAddr);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<div id="content">
		<p class="heading1">Respones</p>
		<br/>
		<fieldset class="fieldset1">
			<legend>발행안내메일 재전송</legend>
			<ul>
				<li>Response.code : <%=CheckResponse.getCode()%></li>
				<li>Response.message : <%=CheckResponse.getMessage()%></li>
			</ul>
		</fieldset>
	 </div>
</html>
