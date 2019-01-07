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
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
	/*
	 * 공급받는자가 공급자에게 1건의 역발행 세금계산서를 요청합니다.
	 * - 역발행 세금계산서 프로세스를 구현하기 위해서는 공급자/공급받는자가 모두 팝빌에 회원이여야 합니다.
	 * - 역발행 요청후 공급자가 [발행] 처리시 포인트가 차감되며 역발행 세금계산서 항목중 과금방향(ChargeDirection) 에 기재한 값에 따라
	 *   정과금(공급자과금) 또는 역과금(공급받는자과금) 처리됩니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

	// 세금계산서 문서관리번호
	String mgtKey = "20190107-001";

	// 메모
	String memo = "역)발행요청 메모";

	Response CheckResponse = null;

	try {

		CheckResponse = taxinvoiceService.request(testCorpNum, keyType, mgtKey, memo);

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
				<legend>역발행 요청</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
</html>
