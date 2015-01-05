<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1231212312";	// 회원 사업자번호 
	String userid = "userid";			// 회원 아이디
	String TOGO = "TBOX";				// TBOX : 임시문서함, SBOX : 매출문서함, PBOX : 매입문서함, WRITE : 매출작성
	String url = null;

	try {
			
		url = taxinvoiceService.getURL(testCorpNum, userid, TOGO);

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
				<legend>세금계산서 관련 SSO URL 확인</legend>
				<ul>
					<li>url : <%=url%></li>
				</ul>
			</fieldset>
		 </div>
</html>