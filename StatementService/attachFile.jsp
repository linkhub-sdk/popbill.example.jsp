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

<%
	/*
	 * 전자명세서에 첨부파일을 등록합니다.
	 * - 첨부파일 등록은 전자명세서가 [임시저장] 상태인 경우에만 가능합니다.
	 * - 첨부파일은 최대 5개까지 등록할 수 있습니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 명세서 종류코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

	// 전자명세서 문서관리번호
	String mgtKey = "20190107-101";

	// 첨부파일 표시명
	String fileName = "test.jpg";

	// 파일 스트림
	InputStream stream = new FileInputStream(application.getRealPath("/resources/test.jpg"));

	Response CheckResponse = null;

	try {

		CheckResponse = statementService.attachFile(testCorpNum, itemCode, mgtKey, fileName, stream);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	} finally {
		if ( stream != null ) {
			try {
				stream.close();
			} catch(IOException e) {}
		}
	}
%>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>전자명세서 첨부파일 등록</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>
