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
	String testCorpNum = "1234567890";		// 회원 사업자번호
	MgtKeyType keyType = MgtKeyType.SELL;   // 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	String mgtKey = "20141230-03";			// 세금계산서 연동관리번호
	String memo = "발행취소 메모";			// 전송메일과 이력정보에 기재되는 메모

	Response CheckResponse = null;

	try {
		
		CheckResponse = taxinvoiceService.cancelIssue(testCorpNum, keyType, mgtKey, memo);

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
				<legend>발행취소 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>