<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.hometax.HTTaxinvoiceJobState" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
	String testUserID = "testkorea";			// 연동회원 아이디
  String jobID = "016062011000000001";  // 수집 요청시 반환받은 작업아이디

  HTTaxinvoiceJobState jobState = null;

	try {

		jobState = htTaxinvoiceService.getJobState(testCorpNum, jobID, testUserID);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>수집 상태 확인</legend>
				<ul>
					<li>jobID (작업아이디) : <%=jobState.getJobID() %> </li>
          <li>jobState (수집상태) : <%=jobState.getJobState() %> </li>
          <li>queryType (수집유형) : <%=jobState.getQueryType() %> </li>
          <li>queryDateType (일자유형) : <%=jobState.getQueryDateType() %> </li>
          <li>queryStDate (시작일자) : <%=jobState.getQueryStDate() %> </li>
          <li>queryEnDate (종료일자) : <%=jobState.getQueryEnDate() %> </li>
          <li>errorCode (오류코드) : <%=jobState.getErrorCode() %> </li>
          <li>errorReason (오류메시지) : <%=jobState.getErrorReason() %> </li>
          <li>jobStartDT (작업 시작일시) : <%=jobState.getJobStartDT() %> </li>
          <li>jobEndDT (작업 종료일시) : <%=jobState.getJobEndDT() %> </li>
          <li>collectCount (수집개수) : <%=jobState.getCollectCount() %> </li>
          <li>regDT (수집 요청일시) : <%=jobState.getRegDT() %> </li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
