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
	 * 현금영수증 PDF 파일을 다운 받을 수 있는 URL을 반환합니다.
	 * - 반환되는 URL은 보안정책상 30초의 유효시간을 갖으며, 유효시간 이후 호출시 정상적으로 페이지가 호출되지 않습니다.
	 * - https://docs.popbill.com/cashbill/java/api#GetPDFURL
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 현금영수증 문서번호
	String mgtKey = "20210701-001";

	String url = null;

	try {

		url = cashbillService.getPDFURL(testCorpNum, mgtKey);

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
				<legend>현금영수증 PDF 다운로드 URL 확인</legend>
				<ul>
					<li>URL : <%=url%></li>
				</ul>
			</fieldset>
		</div>
	</body>
</html>
