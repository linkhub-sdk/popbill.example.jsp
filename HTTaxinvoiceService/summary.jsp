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
  /*
   * 함수 (GetJobState – 수집 상태 확인)를 통해 상태 정보가 확인된 작업아이디를 활용하여 수집된 전자세금계산서 매입/매출 내역의 요약 정보를 조회합니다.
   * - https://docs.popbill.com/httaxinvoice/java/api#Summary
   */

	// 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
	String testCorpNum = "1234567890";

  // 팝빌회원 아이디
  String testUserID = "testkorea";

	// 수집 요청시 발급받은 작업아이디
	String jobID = "021102217000000002";

	// 문서형태 배열 ("N" 와 "M" 중 선택, 다중 선택 가능)
	// └ N = 일반 , M = 수정 , 미입력 시 전체조회
	String[] Type = {"N", "M"};

	// 과세형태 배열 ("T" , "N" , "Z" 중 선택, 다중 선택 가능)
	// └ T = 과세, N = 면세, Z = 영세 , 미입력 시 전체조회
	String[] TaxType = {"T", "Z", "N"};

	// 발행목적 배열 ("R" , "C", "N" 중 선택, 다중 선택 가능)
	// └ R = 영수, C = 청구, N = 없음, 미입력 시 전체조회
	String[] PurposeType = {"R", "C", "N"};

	// 종사업장번호 유무, 공백-전체조회, 0-종사업장번호 없음, 1-종사업장번호 있음
	String TaxRegIDYN = "";

	// 종사업장번호의 주체, S-공급자, B-공급받는자, T-수탁자
	String TaxRegIDType = "S";

	// 종사업장번호, 다수 기재시 콤마(",")로 구분하여 구성 ex) "0001,0002"
	String TaxRegID = "";

	// 거래처 상호 / 사업자번호 (사업자) / 주민등록번호 (개인) / "9999999999999" (외국인) 중 검색하고자 하는 정보 입력
	// - 사업자번호 / 주민등록번호는 하이픈('-')을 제외한 숫자만 입력
	// - 미입력시 전체조회
	String searchString = "";

	HTTaxinvoiceSummary result = null;

	try {

		result = htTaxinvoiceService.summary(testCorpNum, jobID, Type, TaxType, PurposeType,
				TaxRegIDYN, TaxRegIDType, TaxRegID, testUserID, searchString);

	} catch (PopbillException pe) {
		// 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		// 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
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
