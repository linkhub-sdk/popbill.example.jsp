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

<%
	/**
  * 전자명세서에 첨부된 파일을 삭제합니다.
  * - 파일을 식별하는 파일아이디는 첨부파일 목록(GetFileList API) 의 응답항목
  *   중 파일아이디(AttachedFile) 값을 통해 확인할 수 있습니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

  // 전자명세서 문서관리번호
	String mgtKey = "20161130-05";

  // 파일 아이디 기재. 파일아이디는 첨부파일목록(getFiles)의 attachedFile 변수값 확인
	String FileID = "8BA8ACEA-2247-44EA-90A3-C4248005D5FD.PBF";

	Response CheckResponse = null;

	try {

		CheckResponse = statementService.deleteFile(testCorpNum, itemCode, mgtKey, FileID);

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
				<legend>첨부파일 삭제</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>
