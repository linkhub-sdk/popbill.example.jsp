<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>예금주조회 SDK JSP Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.AccountCheckInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 1건의 예금주성명을 조회합니다.
	 * - https://docs.popbill.com/accountcheck/java/api#CheckAccountInfo
	 */

	AccountCheckInfo accountInfo = null;

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
	String testCorpNum = "1234567890";

	/*
	 * 조회할 기관코드
	 * - https://docs.popbill.com/accountcheck/?lang=java#BankCodeList
	 */
	String bankCode = "0004";

	// 조회할 기관의 계좌번호 (하이픈 '-' 제외 8자리 이상 14자리 이하)
	String accountNumber = "1234567890";

	try{
		accountInfo = accountCheckService.CheckAccountInfo(testCorpNum, bankCode, accountNumber);
	} catch (PopbillException pe){
		// 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		// 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}

%>

	<body>
		<div id="content">
			<p class="heading1">예금주조회 API SDK - JSP Example.</p>
			<br/>
			<fieldset class="fieldset1">
					<legend>에금주조회 결과</legend>
					<ul>
						<li>bankCode (기관코드) : <%=accountInfo.getBankCode()%></li>
						<li>accountNumber (계좌번호) : <%=accountInfo.getAccountNumber()%></li>
						<li>accountName (예금주 성명) : <%=accountInfo.getAccountName()%></li>
						<li>checkDate (확인일시) : <%=accountInfo.getCheckDate()%></li>
						<li>result (응답코드) : <%=accountInfo.getResult()%></li>
						<li>resultMessage (응답메시지) : <%=accountInfo.getResultMessage()%></li>
					</ul>

			</fieldset>
		</div>
	</body>
</html>
