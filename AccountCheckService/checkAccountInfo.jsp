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
						<li> bankCode (기관코드) : <%=accountInfo.getBankCode()%></li>
						<li> accountNumber (계좌번호) : <%=accountInfo.getAccountNumber()%></li>
						<li> accountName (예금주 성명) : <%=accountInfo.getAccountName()%></li>
						<li> checkDate (확인일시) : <%=accountInfo.getCheckDate()%></li>
						<li> result (응답코드) : <%=accountInfo.getResult()%></li>
						<li> resultMessage (응답메시지) : <%=accountInfo.getResultMessage()%></li>
					</ul>

			</fieldset>
		</div>
	</body>
</html>
