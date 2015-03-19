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
		문서관리번호 사용여부 확인
		최대 24자리, 영문, 숫자, '-', '_' 조합하여 구성
	*/

	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	int itemCode = 121;						// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	String mgtKey = "20150319-01";			// 문서관리번호

	boolean isInUse;

	try {

		isInUse = statementService.checkMgtKeyInUse(testCorpNum,itemCode,mgtKey);
		
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
				<legend>문서관리번호 사용여부 확인</legend>
				<ul>
					<li>사용중 여부 : <%=isInUse ? "사용중" : "미사용중"%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>