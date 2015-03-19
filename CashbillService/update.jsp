<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
	/*
		현금영수증 수정, 기재 항목의 수정은 등록(임시저장) 한 경우에만 가능
		현금영수증 입력항목에 관한 자세한 사항은 [현금영수증 API 연동매뉴얼> 4.1 현금영수증 구성] 참조
	*/

	
	Cashbill cashbill = new Cashbill();

	cashbill.setMgtKey("20150319-02");				// 수정(update)시 문서관리번호를 다르게 기재하더라도 문서관리번호는 변경되지 않음
	cashbill.setTradeType("승인거래");				// 현금영수증 형태, {승인거래, 취소거래} 중 기재
	cashbill.setTradeUsage("소득공제용");			// 거래유형, {소득공제용, 지출증빙용} 중 기재
	cashbill.setTaxationType("과세");				// 과세형태, {과세, 비과세} 중 기재
	
	cashbill.setIdentityNum("01043245117");			// 거래처 식별번호, 거래유형(TradeUsage) : 소득공제용인 경우 - (주민등록/휴대폰/카드)번호 기재
													//					거래유형(TradeUsage) : 지출증빙용인 경우 - 사업자번호 기재

	cashbill.setFranchiseCorpNum("1234567890");		// 발행자 사업자번호, '-'제외 10자리 
	cashbill.setFranchiseCorpName("발행자 상호_수정");	
	cashbill.setFranchiseCEOName("발행자 대표자_수정");
	cashbill.setFranchiseAddr("발행자 주소");
	cashbill.setFranchiseTEL("07075103710");	
	cashbill.setSmssendYN(false);					// 발행시 알림문자 자동전송여부

	cashbill.setCustomerName("고객명");
	cashbill.setItemName("상품명");
	cashbill.setOrderNumber("주문번호");
	cashbill.setEmail("test@test.com");
	cashbill.setHp("01043245117");
	cashbill.setFax("07075103710");

	cashbill.setSupplyCost("100000");				// 공급가액, 숫자만 가능
	cashbill.setTax("10000");						// 세액, 숫자만 가능
	cashbill.setServiceFee("0");					// 봉사료, 숫자만 가능
	cashbill.setTotalAmount("110000");				// 합계금액, 숫자만 가능, 봉사료 + 공급가액 + 세액
		
	Response CheckResponse = null;

	try {

		String testCorpNum = "1234567890";		// 팝빌회원 사업자번호
		String userID = "testkorea";			// 팝빌회원 아이디
		String mgtKey = "20150319-01";			// 수정할 현금영수증 문서관리번호

		CheckResponse = cashbillService.update(testCorpNum, mgtKey, cashbill, userID);

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
				<legend>현금영수증 수정 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>