<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>

<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
	String testCorpNum = "1231212312";			// 회원 사업자번호
	MgtKeyType keyType = MgtKeyType.SELL;		// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	String mgtKey = "20141230-01";				// 세금계산서 연동관리번호
	String fileName = "첨부파일.jpg";			// 첨부파일 표시명
	Response CheckResponse = null;
	InputStream stream = new FileInputStream(application.getRealPath("/resources/사업자등록증.jpg"));	// 파일 스트림

	try {

		CheckResponse = taxinvoiceService.attachFile(testCorpNum, keyType, mgtKey, fileName, stream);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	} finally {
		if(stream != null) 
			try {
					stream.close();
			} catch(IOException e) {}
	}
			
%>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>세금계산서 파일첨부 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>