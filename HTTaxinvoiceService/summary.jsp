<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.hometax.HTTaxinvoiceSummary"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
  String jobID = "016062011000000001";  // 수집 요청시 발급받은 작업아이디
  String[] Type = {"N", "M"};
  String[] TaxType = {"T", "Z", "N"};
  String[] PurposeType = {"R", "C", "N"};

  Boolean TaxRegIDYN = false;
  String TaxRegIDType = "S";
  String[] TaxRegID = null;

  HTTaxinvoiceSummary result = null;

	try {

		result = htTaxinvoiceService.summary(testCorpNum, jobID, Type, TaxType, PurposeType, TaxRegIDYN, TaxRegIDType, TaxRegID);

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
        <legend>수집 결과 요약정보 조회</legend>
        <ul>
          <li>count (수집 결과 건수) : <%= result.getCount() %></li>
          <li>supplyCostTotal (공급가액 합계) : <%= result.getSupplyCostTotal() %></li>
          <li>taxTotal (세액 합계) : <%= result.getTaxTotal() %></li>
          <li>amountTotal (합계 금액) : <%= result.getAmountTotal() %></li>
        </ul>
			</fieldset>
		 </div>
	</body>
</html>
