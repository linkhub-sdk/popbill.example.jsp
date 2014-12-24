<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%
	boolean isInUse;
	try {
		String testCorpNum = "1231212312"; //확인할 회원 사업자번호.
		MgtKeyType KeyType = MgtKeyType.SELL; //SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
		String mgtKey = "1234"; //확인하고자 하는 연동관리번호.
		
		isInUse = taxinvoiceService.checkMgtKeyInUse(testCorpNum,MgtKeyType.SELL,mgtKey);
		
	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">연동 관리번호 사용중 확인</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>사용중 여부 확인 결과</legend>
				<ul>
					<li>사용중 여부 : <%=isInUse ? "사용중" : "미 사용중"%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>