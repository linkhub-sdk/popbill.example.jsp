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
	/*
		다량 전자명세서 인쇄 화면 URL 확인, 최대 100건
	*/

	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	int itemCode = 121;						// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	String userID = "testkorea";			// 연동회원 아이디

	// 문서관리번호 배열, 최대 100건
	String[] MgtKeyList = new String[] {"20150318-01", "20150318-01", "20150318-02", "20150319-01"}; 
	
	String url = null;

	try {

		url = statementService.getMassPrintURL(testCorpNum, itemCode, MgtKeyList, userID);

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
				<legend>전자명세서 다량 인쇄 팝업 URL 확인</legend>
				<ul>
					<li>URL : <%=url%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>