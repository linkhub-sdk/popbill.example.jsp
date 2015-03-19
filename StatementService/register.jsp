<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
	/*
		전자명세서 등록(임시저장)
		전자명세서 구성항목에 대한 설명은 [전자명세서 API 연동매뉴얼 > 4.1 전자명세서 구성] 참조
	*/

	Statement statement = new Statement();
	
	statement.setWriteDate("20150318");				// [필수] 작성일자, 형태 yyyyMmdd
	statement.setPurposeType("영수");				// [필수] {영수, 청구} 중 기재
	statement.setTaxType("과세");					// [필수] {과세, 영세, 면세} 중 기재
	statement.setFormCode("");						// 맞춤양식코드, 미기재시 기본양식으로 처리
	statement.setItemCode((short) 121);				// [필수] 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]	int 
	statement.setMgtKey("20150319-01");				// [필수] 문서관리번호, 최대 24자리 영문, 숫자, '-', '_'로 구성
	statement.setSenderCorpNum("1234567890");		// [필수] 공급자 사업자번호
	statement.setSenderCorpName("공급자 상호");
	statement.setSenderAddr("공급자 주소");
	statement.setSenderCEOName("공급자 대표자 성명");
	statement.setSenderTaxRegID("");
	statement.setSenderBizClass("업종");
	statement.setSenderBizType("업태");
	statement.setSenderContactName("공급자 담당자명");
	statement.setSenderEmail("test@test.com");
	statement.setSenderTEL("070-7070-0707");
	statement.setSenderHP("010-000-2222");

	statement.setReceiverCorpNum("8888888888");		// [필수] 공급받는자 사업자번호
	statement.setReceiverCorpName("공급받는자 상호");
	statement.setReceiverCEOName("공급받는자 대표자 성명");
	statement.setReceiverAddr("공급받는자 주소");
	statement.setReceiverBizClass("공급받는자 업종");
	statement.setReceiverBizType("공급받는자 업태");
	statement.setReceiverContactName("공급받는자 담당자명");
	statement.setReceiverEmail("test@receiver.com");

	statement.setSupplyCostTotal("400000");         // [필수] 공급가액 합계
	statement.setTaxTotal("40000");                 // [필수] 세액 합계
	statement.setTotalAmount("440000");             // [필수] 합계금액.  공급가액 + 세액

	statement.setSerialNum("123");                  // 기재상 일련번호 항목
	statement.setRemark1("비고1");
	statement.setRemark2("비고2");
	statement.setRemark3("비고3");

	statement.setBusinessLicenseYN(false);			// 사업자등록증 이미지 첨부시 설정.
	statement.setBankBookYN(false);					// 통장사본 이미지 첨부시 설정.
			

	// 추가속성, 추가속성에 관한 정보는 [전자명세서 API 연동매뉴얼 > [5.2 기본양식 추가속성 테이블] 참조
	Map<String, String> propertyBag = new HashMap<String, String>();
	
	propertyBag.put("Balance", "15000");			// 전잔액
	propertyBag.put("Deposit", "5000");				// 입금액
	propertyBag.put("CBalance", "20000");			// 현잔액

	statement.setPropertyBag(propertyBag);

	
	statement.setDetailList(new ArrayList<StatementDetail>());
	
	StatementDetail detail = new StatementDetail();		// 상세항목(품목) 배열

	detail.setSerialNum((short) 1);					// 일련번호, 1부터 순차기재
	detail.setItemName("품명");						// 품목명
	detail.setPurchaseDT("20150317");				// 거래일자
	detail.setQty("1");								// 수량
	detail.setSupplyCost("200000");					// 공급가액
	detail.setTax("20000");							// 세액

	statement.getDetailList().add(detail);

	detail = new StatementDetail();		// 상세항목(품목) 배열

	detail.setSerialNum((short) 2);					// 일련번호 1부터 순차기재
	detail.setItemName("품명");						// 품목명
	detail.setPurchaseDT("20150317");				// 거래일자
	detail.setQty("1");								// 수량
	detail.setSupplyCost("200000");					// 공급가액
	detail.setTax("20000");							// 세액

	statement.getDetailList().add(detail);
		
	Response CheckResponse = null;

	try {

		String testCorpNum = "1234567890";			// 연동회원 사업자번호, '-'제외 10자리 
		String userID = "testkorea";				// 연동회원 아이디

		CheckResponse = statementService.register(testCorpNum, statement, userID);

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
				<legend>전자명세서 등록 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>