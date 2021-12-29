<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.easyfin.EasyFinBankAccountForm"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	/*
	 * 계좌조회 서비스를 이용할 계좌를 팝빌에 등록합니다.
	 * - https://docs.popbill.com/easyfinbank/java/api#RegistBankAccount
	 */

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
	String testCorpNum = "1234567890";

	// 계좌정보 클래스 인스턴스 생성
	EasyFinBankAccountForm bankInfo = new EasyFinBankAccountForm();
	
	// 기관코드
	// 산업은행-0002 / 기업은행-0003 / 국민은행-0004 /수협은행-0007 / 농협은행-0011 / 우리은행-0020
	// SC은행-0023 / 대구은행-0031 / 부산은행-0032 / 광주은행-0034 / 제주은행-0035 / 전북은행-0037
	// 경남은행-0039 / 새마을금고-0045 / 신협은행-0048 / 우체국-0071 / KEB하나은행-0081 / 신한은행-0088 /씨티은행-0027
	bankInfo.setBankCode("");
	
	// 계좌번호 하이픈('-') 제외
	bankInfo.setAccountNumber("");
	
	// 계좌비밀번호
	bankInfo.setAccountPWD("");
	
	// 계좌유형, "법인" 또는 "개인" 입력
	bankInfo.setAccountType("");
	
	// 예금주 식별정보 (‘-‘ 제외)
	// 계좌유형이 “법인”인 경우 : 사업자번호(10자리)
	// 계좌유형이 “개인”인 경우 : 예금주 생년월일 (6자리-YYMMDD)
	bankInfo.setIdentityNumber("");
	
	// 계좌 별칭
	bankInfo.setAccountName("");
	
	// 인터넷뱅킹 아이디 (국민은행 필수)
	bankInfo.setBankID("");
	
	// 조회전용 계정 아이디 (대구은행, 신협, 신한은행 필수)
	bankInfo.setFastID("");
	
	// 조회전용 계정 비밀번호 (대구은행, 신협, 신한은행 필수
	bankInfo.setFastPWD("");
	
	// 결제기간(개월), 1~12 입력가능, 미기재시 기본값(1) 처리
	// - 파트너 과금방식의 경우 입력값에 관계없이 1개월 처리
	 bankInfo.setUsePeriod(1);
	
	// 메모
	bankInfo.setMemo("");

	Response CheckResponse = null;

	try {

		CheckResponse = easyFinBankService.registBankAccount(testCorpNum, bankInfo);

	} catch (PopbillException pe) {
		// 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		// 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>계좌 등록</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
