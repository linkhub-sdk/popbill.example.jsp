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
  /**
  * 1건의 전자세금계산서 인쇄 팝업 URL을 반환합니다.
  * - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.
  */

  // 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

  // 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

  // 세금계산서 문서관리번호
	String mgtKey = "20161130-01";

  // 팝빌회원 아이디
	String userID = "testkorea";

	String url = null;

	try {

		url = taxinvoiceService.getPrintURL(testCorpNum, keyType, mgtKey, userID);

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
				<legend>세금계산서 인쇄 팝업 URL</legend>
				<ul>
					<li>url : <%=url%></li>
				</ul>
			</fieldset>
		 </div>
</html>
