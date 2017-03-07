<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.CorpInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
  /**
  * 연동회원의 회사정보를 확인합니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	CorpInfo corpInfo = null;

	try {

		corpInfo = htTaxinvoiceService.getCorpInfo(testCorpNum);

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
				<legend>회사정보 확인</legend>
				<ul>
					<li>Ceoname (대표자명) : <%=corpInfo.getCeoname() %> </li>
					<li>CorpName (상호명) : <%=corpInfo.getCorpName() %> </li>
					<li>Addr (주소) : <%=corpInfo.getAddr() %> </li>
					<li>BizClass (종목) : <%=corpInfo.getBizClass() %> </li>
					<li>BizType (업태) : <%=corpInfo.getBizType() %> </li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
